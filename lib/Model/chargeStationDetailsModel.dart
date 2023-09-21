
class ChargeStationDetailsModel {
  final int id;
  final String name;
  final String location_name;
  final String rating;
  final String image;
  final double lattitude;
  final double longitude;
  final String amenities;
  final String startTime;
  final String stopTime;
  bool isFavorite;

  ChargeStationDetailsModel({
    required this.id,
    required this.name,
    required this.location_name,
    required this.rating,
    required this.image,
    required this.lattitude,
    required this.longitude,
    required this.amenities,
    required this.isFavorite,

    required this.startTime,
    required this.stopTime,
  });

  factory ChargeStationDetailsModel.fromJson(Map<String, dynamic> json) {
    return ChargeStationDetailsModel(
      id: json['id'],
      name: json['name'] ?? '',
      location_name: json['location_name'] ?? '',
      rating: json['rating'] == 'null' ? '0.0' : json['rating'] ?? '0.0',
      image: json['image'] ?? '',
      lattitude: json['lattitude'] ?? 0,
      longitude: json['longitude'] ?? 0,
      amenities: json['amenities'] ?? '',
      startTime: json['startTime'] ?? '',
      stopTime: json['stopTime'] ?? '',
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "rating": rating,
        "name": name,
        "location_name": location_name,
        "image": image,
        "lattitude": lattitude,
        "longitude": longitude,
        "amenities": amenities,
        "isFavorite": isFavorite,
        "startTime": startTime,
        "stopTime": stopTime,

      };
}
