import 'package:flutter/material.dart';
import 'package:application_store2/model/Transactions.dart';
import 'package:application_store2/screens/transaction_detail_screen.dart';

class TransactionSearchDelegate extends SearchDelegate<Transactions> {
  final List<Transactions> transactions;

  TransactionSearchDelegate({required this.transactions});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query == null || query.isEmpty) {
      return Center(
        child: Text(
          "กรุณาป้อนคำค้นหา",
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    final results = transactions.where((transaction) =>
        transaction.title.toLowerCase().contains(query.toLowerCase()));

    if (results.isEmpty) {
      return Center(
        child: Text(
          "ไม่พบผลลัพธ์",
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final result = results.elementAt(index);
        return Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: result.imageBytes != null
                ? Image.memory(
                    result.imageBytes!,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                : Icon(Icons.image),
            title: Text(result.title),
            subtitle: Text(result.type),
            onTap: () {
              // เมื่อคลิกบนการ์ด นำไปยังหน้า TransactionDetailScreen
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    TransactionDetailScreen(transaction: result),
              ));
            },
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query == null || query.isEmpty) {
      return Center(
        child: Text(
          "กรุณาป้อนคำค้นหา",
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    final suggestions = transactions.where((transaction) =>
        transaction.title.toLowerCase().contains(query.toLowerCase()));

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions.elementAt(index);
        return ListTile(
          title: Text(suggestion.title),
          onTap: () {
            query = suggestion.title;
            showResults(context);
          },
        );
      },
    );
  }
}
