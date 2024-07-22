import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import '../model/Transactions.dart';

class TransactionDB {
  //บริการเกี่ยวกับข้อมูล
  String dbname;

  //ถ้ายังไม่สร้าง จะสร้าง
  // ถูกสร้างแล้ว ให้เปิด
  TransactionDB({required this.dbname});

  Future<Database> openDatabase() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbname);

    DatabaseFactory dbFactory = await databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);
    return db;
  }

  Future<int> insertData(Transactions statement) async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");

    var keyID = store.add(db, {
      "title": statement.title,
      "type": statement.type,
      "author": statement.author,
      //"textEditing": statement.textEditing,

      "amount": statement.amount,
      "date": statement.date.toString(),
      "image": statement.imageBytes,
      "details": statement.details,
    });
    db.close();
    return keyID;
  }

  Future<bool> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("expense");
    var snapshot = await store.find(db);

    print(snapshot);
    return true;
  }
}
