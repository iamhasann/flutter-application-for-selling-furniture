import 'package:flutter/material.dart';
import 'package:application_store2/model/Transactions.dart';
import 'package:application_store2/providers/transaction_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:application_store2/screens/transaction_detail_screen.dart'; // import หน้า ShowScreen

class CategoryDetailScreen extends StatelessWidget {
  final String category;

  CategoryDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('รายการประเภท $category'),
      ),
      body: Consumer(
        builder: (context, TransactionProvider provider, Widget) {
          var categoryTransactions = provider.transactions
              .where((transaction) => transaction.type == category)
              .toList();
 
          if (categoryTransactions.isEmpty) {
            return Center(
              child: Text(
                "ไม่พบรายการในประเภท $category",
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: categoryTransactions.length,
              itemBuilder: (context, int index) {
                Transactions data = categoryTransactions[index];
                return GestureDetector(
                  onTap: () {
                    // เมื่อกดบนการ์ดในรายการ ListView
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TransactionDetailScreen(
                              transaction:
                                  data); // ไปยังหน้า ShowScreen พร้อมส่งข้อมูล transaction
                        },
                      ),
                    );
                  },
                  child: Card(
                    elevation: 25,
                    margin: const EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: data.imageBytes != null
                          ? Image.memory(
                              data.imageBytes!,
                              width: 100,
                              height: 600,
                              fit: BoxFit.cover,
                            )
                          : CircleAvatar(
                              radius: 40,
                              child: FittedBox(
                                child: Text(data.amount.toString()),
                              ),
                            ),
                      title: Text("ชื่อสินค้า : ${data.title}"),
                      subtitle: Text(
                        "ราคา : ${data.amount.toStringAsFixed(2)} บาท\n" +
                        "วันที่ : ${DateFormat("dd/MM/yyyy").format(data.date)}" ,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
