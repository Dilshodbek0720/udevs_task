import 'address.dart';

class CurrentLocation {
  String lat;
  String lon;
  String type;
  String addressType;
  String name;
  String displayName;
  Address address;

  CurrentLocation({
    required this.lat,
    required this.lon,
    required this.type,
    required this.addressType,
    required this.name,
    required this.displayName,
    required this.address,
  });

  factory CurrentLocation.fromJson(Map<String, dynamic> json) =>
      CurrentLocation(
        lat: json["lat"] ?? 0.0,
        lon: json["lon"] ?? 0.0,
        type: json["type"] ?? '',
        addressType: json["addresstype"] ?? '',
        name: json["name"] ?? '',
        displayName: json["display_name"] ?? '',
        address: Address.fromJson(json["address"] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
        "type": type,
        "addresstype": addressType,
        "name": name,
        "display_name": displayName,
        "address": address.toJson(),
      };
}
