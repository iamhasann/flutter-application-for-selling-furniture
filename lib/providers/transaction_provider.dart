import 'package:flutter/foundation.dart';
import 'package:application_store2/database/transaction_db.dart';
import 'package:application_store2/model/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbname: "transactions.db");

    await db.insertData(statement);

    await db.loadAllData();

    transactions.insert(0, statement);

    //แจ้งเตือน consumer
    notifyListeners();
  }
}
