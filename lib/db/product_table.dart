
class Product {
  final int? id;
  final String proBarcode;
  final String proName;
  final int proPrice;
  final int boxPrice;
  final String proType;


  Product(
      {this.id,
        required this.proBarcode,
        required this.proName,
        required this.proPrice,
        required this.boxPrice,
        required this.proType,

      });

  Product.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        proBarcode = res["proBarcode"],
        proName = res["proName"],
        proPrice = res["proPrice"],
        boxPrice = res["boxPrice"],
        proType = res["proType"];

  Map<String, Object?> toMap() {
    return {'id':id,'proBarcode':proBarcode,'proName': proName, 'proPrice': proPrice, 'boxPrice': boxPrice, 'proType': proType};
  }
}