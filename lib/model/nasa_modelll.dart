import 'package:hive/hive.dart';
part 'nasa_modelll.g.dart';

@HiveType(typeId: 1)
class NasaModel {
  @HiveField(0)
  int? id;
  int? sol;
  @HiveField(1)
  Camera? camera;
  @HiveField(2)
  String? imgSrc;
  @HiveField(3)
  String? earthDate;
  @HiveField(4)
  Rover? rover;

  NasaModel(
      {this.id,
      this.sol,
      this.camera,
      this.imgSrc,
      this.earthDate,
      this.rover});

  NasaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sol = json['sol'];
    camera =
        json['camera'] != null ? Camera.fromJson(json['camera']) : null;
    imgSrc = json['img_src'];
    earthDate = json['earth_date'];
    rover = json['rover'] != null ? Rover.fromJson(json['rover']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sol'] = sol;
    if (camera != null) {
      data['camera'] = camera!.toJson();
    }
    data['img_src'] = imgSrc;
    data['earth_date'] = earthDate;
    if (rover != null) {
      data['rover'] = rover!.toJson();
    }
    return data;
  }
}

@HiveType(typeId: 2)
class Camera {
  int? id;
  String? name;
  int? roverId;
  @HiveField(5)
  String? fullName;

  Camera({this.id, this.name, this.roverId, this.fullName});

  Camera.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roverId = json['rover_id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['rover_id'] = roverId;
    data['full_name'] = fullName;
    return data;
  }
}

@HiveType(typeId: 3)
class Rover {
  int? id;
  @HiveField(6)
  String? name;
  @HiveField(7)
  String? landingDate;
  @HiveField(8)
  String? launchDate;
  @HiveField(9)
  String? status;

  Rover({this.id, this.name, this.landingDate, this.launchDate, this.status});

  Rover.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    landingDate = json['landing_date'];
    launchDate = json['launch_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['landing_date'] = landingDate;
    data['launch_date'] = launchDate;
    data['status'] = status;
    return data;
  }
}
