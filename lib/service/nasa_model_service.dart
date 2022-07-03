import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:wester_ops_case/model/nasa_modelll.dart';

class NasaApiServices {
  List<NasaModel> nasaModels = [];
  String url =
      "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=3pgCoXqTHViatq5rLDF8dkk3rEIYK5vbZJYp96Zl";

  Future<List<NasaModel>?> fetchNasaModel() async {
    try {
      var response = await Dio().get(url);

      if (response.statusCode == HttpStatus.ok) {
        final jsonList = (response.data as Map)['photos'] as List;
        nasaModels = jsonList.map((x) => NasaModel.fromJson(x)).toList();
      }
    } on DioError catch (e) {
      print(e);
    }
    return nasaModels;
  }
}

/**abstract class NasaServices {
  late final Dio _dio;

  NasaServices(Dio dio) {
    _dio = dio;
  }

  Future<List<NasaModel>?> fetchNasaModel();
}

class NasaApiServices extends NasaServices {
  NasaApiServices(Dio dio) : super(dio);
  List<NasaModel> nasaModels = [];
  String url =
      "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=3pgCoXqTHViatq5rLDF8dkk3rEIYK5vbZJYp96Zl";

  @override
  Future<List<NasaModel>?> fetchNasaModel() async {
    print("nokta 1");
    try {
      final response = await Dio().get(url);

      if (response.statusCode == HttpStatus.ok) {
        print("nokta 2");
        final jsonList = (response.data as Map)['photos'] as List;
        nasaModels = jsonList.map((x) => NasaModel.fromJson(x)).toList();
      }
    } on DioError catch (e) {
      print(e);
    }
    return null;
  }
}
**/
