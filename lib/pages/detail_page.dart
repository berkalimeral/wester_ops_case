import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:wester_ops_case/model/nasa_modelll.dart';
import 'package:wester_ops_case/pages/favorites_page.dart';
import 'package:wester_ops_case/pages/home_page.dart';

class DetailPage extends StatefulWidget {
  NasaModel nasaModel;
  DetailPage({
    Key? key,
    required this.nasaModel,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // late final CacheManager<NasaModel> cacheManager;
  // late final NasaApiServices services;
  // List<NasaModel>? items;

  final String butonText = 'Your Favorites';
  final String labelText = 'Save to Favorites';
  final double containerHeight = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(primary: Colors.transparent),
              onPressed: saveRovers,
              icon: const Icon(Icons.save),
              label: Text(labelText))
        ],
        title: const Text('Detail Page'),
      ),
      body: ListView(
        children: [
          Card(
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Utility.borderRadius)),
              margin: const EdgeInsets.all(Utility.inset),
              padding: const EdgeInsets.all(Utility.inset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.nasaModel.id.toString(),
                      child: Image.network(
                        widget.nasaModel.imgSrc ??
                            'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          cardItem(const Icon(Icons.date_range), widget.nasaModel.earthDate,
              "Earth Date"),
          cardItem(const Icon(Icons.smart_toy_outlined),
              widget.nasaModel.rover?.name, "Rover Name"),
          cardItem(const Icon(Icons.camera), widget.nasaModel.camera?.name,
              "Camera Name"),
          cardItem(
              Icon(widget.nasaModel.rover?.status == "active"
                  ? Icons.sentiment_satisfied_rounded
                  : Icons.sentiment_dissatisfied_rounded),
              widget.nasaModel.rover?.status,
              "Rover Status"),
          cardItem(const Icon(Icons.date_range_outlined),
              widget.nasaModel.rover?.landingDate, "Landing Date"),
          cardItem(const Icon(Icons.date_range_outlined),
              widget.nasaModel.rover?.launchDate, "Launch Date"),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoritesPage()));
            },
            child: Text(butonText),
          )
        ],
      ),
    );
  }

  Card cardItem(Icon icon, String? nasaModel, String? text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13),
      ),
      child: ListTile(
        leading: icon,
        title: Text(nasaModel ?? ""),
        trailing: Text(text ?? ""),
      ),
    );
  }

  void saveRovers() async {
    var box = Hive.box('rovers');

    box.put(widget.nasaModel.id, [
      widget.nasaModel.imgSrc,
      widget.nasaModel.rover?.name,
      widget.nasaModel.rover?.status,
      widget.nasaModel.rover?.landingDate,
      widget.nasaModel.rover?.launchDate
    ]);

    print(box.toMap());
  }
}
