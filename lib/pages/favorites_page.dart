import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wester_ops_case/pages/home_page.dart';

class FavoritesPage extends StatefulWidget {
  FavoritesPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  String title = 'Favorites Page';

  var list;
  var box;

  void fetchFavorites() {
    box = Hive.box('rovers');

    list = box.values.toList();

    print(list);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchFavorites();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var listItem = list[index];
            return Card(
              child: Container(
                height: Utility.containerHeight,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(Utility.inset)),
                margin: const EdgeInsets.all(Utility.inset),
                padding: const EdgeInsets.all(Utility.inset),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        listItem[0] ??
                            'https://tech.pelmorex.com/wp-content/uploads/2020/10/flutter.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "Rover Name: " + listItem[1],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: Utility.idFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Rover Status: " + listItem[2],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utility.dateFontSize,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Rover Landing Date: " + listItem[3],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Utility.dateFontSize,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rover Launch date: " + listItem[4],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Utility.dateFontSize,
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              print(index.toString());
                              await box.deleteAt(index);
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete)),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
