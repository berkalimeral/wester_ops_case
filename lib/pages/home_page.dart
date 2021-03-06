import 'package:flutter/material.dart';
import 'package:wester_ops_case/core/model/nasa_modelll.dart';
import 'package:wester_ops_case/service/nasa_model_service.dart';
import '../core/constants/constants.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = 'Nasa Rover Pictures';

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: FutureBuilder<List<NasaModel>?>(
        future: NasaApiServices().fetchNasaModel(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: snapshot.data?.length ?? 4,
                itemBuilder: (context, index) {
                  var nasaModel = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => DetailPage(
                                    nasaModel: nasaModel,
                                  ))));
                    },
                    child: Card(
                      child: Container(
                        height: Constants.containerHeight,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Constants.borderRadius)),
                        margin: const EdgeInsets.all(Constants.inset),
                        padding: const EdgeInsets.all(Constants.inset),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Hero(
                                tag: nasaModel.id.toString(),
                                child: Image.network(
                                  nasaModel.imgSrc ??
                                      'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  nasaModel.id.toString(),
                                  style: const TextStyle(
                                    fontSize: Constants.idFontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  nasaModel.earthDate ?? 'Subtitle',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Constants.dateFontSize,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}

