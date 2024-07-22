import 'dart:typed_data';

class Transactions {
  String title;
  String type;
  String author;
  //String textEditing;
  double amount;
  DateTime date;
  final Uint8List imageBytes;
  String details;

  Transactions({
    required this.title,
    required this.type,
    required this.author,
    //required this.textEditing,
    required this.amount,
    required this.date,
    required this.imageBytes,
    required this.details,
  });
}
