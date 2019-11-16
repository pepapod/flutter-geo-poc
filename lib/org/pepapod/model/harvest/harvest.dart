import 'package:flutter_geo_poc/org/pepapod/persistance/db-document.dart';

class Harvest extends DBDocument {
  final String batchId;
  final String latitude;
  final String longitude;
  final String picturePath;

  Harvest(this.batchId, this.latitude, this.longitude, this.picturePath);

  factory Harvest.fromJson(Map<String, dynamic> json) {
    String batchId = json["batchId"];
    String latitude = json["latitude"];
    String longitude = json["longitude"];
    String picturePath = json["picturePath"];
    return Harvest(batchId, latitude, longitude, picturePath);
  }

  @override
  String key() {
    return batchId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "batchId": batchId,
      "latitude": latitude,
      "longitude": longitude,
      "picturePath": picturePath,
    };
  }
}
