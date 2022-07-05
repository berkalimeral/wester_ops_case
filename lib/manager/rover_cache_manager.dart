import 'package:hive_flutter/hive_flutter.dart';
import '../core/model/nasa_modelll.dart';

abstract class CacheManager<T> {
  final String key;
  Box<NasaModel>? boxItem;

  CacheManager(this.key);

  Future<void> init() async {
    if (!(boxItem?.isOpen ?? false)) {
      boxItem = await Hive.openBox(key);
    }
    registerAdapters();
  }

  void registerAdapters();

  Future<void> addItems(List<T> items);

  Future<void> putAllItems(List<T> items);

  Future<void> putItem(String key, NasaModel item);

  T? getItem(String key);

  List<T>? getValues();

  Future<void> deleteItem(String key);

  Future<void> deleteAllItem() async {
    await boxItem?.clear();
  }
}

class RoverCacheManager extends CacheManager<NasaModel> {
  RoverCacheManager(String key) : super(key);

  @override
  Future<void> addItems(List<NasaModel> items) async {
    await boxItem?.addAll(items);
  }

  @override
  Future<void> putAllItems(List<NasaModel> items) async {
    await boxItem?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  Future<void> putItem(String key, NasaModel item) async {
    await boxItem?.put(key, item);
  }

  @override
  NasaModel? getItem(String key) {
    return boxItem?.get(key);
  }

  @override
  Future<void> deleteItem(String key) async {
    await boxItem?.delete(key);
  }

  @override
  List<NasaModel>? getValues() {
    return boxItem?.values.toList();
  }

  @override
  void registerAdapters() {
    Hive.registerAdapter(NasaModelAdapter());
    Hive.registerAdapter(CameraAdapter());
    Hive.registerAdapter(RoverAdapter());
  }
}
