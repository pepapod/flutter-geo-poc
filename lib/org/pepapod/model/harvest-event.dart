import 'package:flutter_geo_poc/org/pepapod/persistance/db-document.dart';

class HarvestEvent extends DBDocument {
  final String eventId;
  final String name;
  final String ownerId;
  final String zoneId;
  final String date;

  HarvestEvent(this.eventId, this.name, this.ownerId, this.zoneId, this.date);

  factory HarvestEvent.fromJson(Map<String, dynamic> json) {
    String eventId = json["eventId"];
    String name = json["name"];
    String ownerId = json["ownerId"];
    String zoneId = json["zoneId"];
    String date = json["date"];
    return HarvestEvent(eventId, name, ownerId, zoneId, date);
  }
  @override
  String key() {
    return eventId;
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "eventId": eventId,
      "name": name,
      "ownerId": ownerId,
      "zoneId": zoneId,
    };
  }
}
