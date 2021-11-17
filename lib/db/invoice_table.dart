
class Invoice {
  final int? id;
   int invNumber;
  final String proBarcode;
  final String proName;
  final int proPrice;
  final int proCount;
  final DateTime invTime;

  Invoice(
      {this.id,
        required this.invNumber,
        required this.proBarcode,
        required this.proName,
        required this.proPrice,
        required this.proCount,
        required this.invTime,
      });

  Invoice.fromMap(Map<String, dynamic> res)
      : id=res["id"],
        invNumber=res["invNumber"],
        proBarcode = res["proBarcode"],
        proName = res["proName"],
        proPrice = res["proPrice"],
        proCount = res["boxPrice"],
        invTime = res["invTime"];

  Map<String, Object?> toMap() {
    return {'id':id,'invNumber':invNumber,'proBarcode':proBarcode,'proName': proName, 'proPrice': proPrice, 'proCount': proCount
      , 'invTime': invTime};
  }
}
