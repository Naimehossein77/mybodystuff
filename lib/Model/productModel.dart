class ProductModel {
  String deviceId;
  String prodName;
  String prodSerialNumber;
  String prodId;

  ProductModel({
    required this.deviceId,
    required this.prodId,
    required this.prodName,
    required this.prodSerialNumber,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      deviceId: json['deviceId'] ?? '',
      prodId: json['prodId'] ?? '',
      prodName: json['prodName'] ?? '',
      prodSerialNumber: json['prodSerialNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        "deviceId": deviceId,
        "prodId": prodId,
        "prodName": prodName,
        "prodSerialNumber": prodSerialNumber,
      };
}
