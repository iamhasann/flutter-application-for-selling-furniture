import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:application_store2/model/Transactions.dart';
import 'package:application_store2/providers/transaction_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final titleController = TextEditingController();
  final authorController = TextEditingController();
  final detailsController = TextEditingController();
  String selectedType = 'ห้องรับแขก';
  DateTime? selectedDate;
  final amountController = TextEditingController();
  Uint8List? imageBytes;

  @override
  Widget build(BuildContext context) {
    List<String> types = ['ห้องรับแขก', 'ห้องนอน', 'ห้องครัว', 'ห้องทำงาน', 'ห้องน้ำ'];

    return Scaffold(
      appBar: AppBar(
        title: Text("แบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    final imagePicker = ImagePicker();
                    final pickedImage = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );

                    if (pickedImage != null) {
                      imageBytes = await pickedImage.readAsBytes();
                    }
                  },
                  child: Text('เลือกรูปภาพ'),
                ),
              ),
              if (imageBytes != null)
                Image.memory(
                  imageBytes!,
                  width: 100,
                  height: 100,
                ),
              SizedBox(height: 20),
              Text(
                "ชื่อสินค้า",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: "กรอกชื่อสินค้า"),
                autofocus: true,
              ),
              SizedBox(height: 20),
              Text(
                "ชื่อผู้ขาย",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: authorController,
                decoration: InputDecoration(labelText: "กรอกชื่อผู้ขาย"),
              ),
              SizedBox(height: 20),
              Text(
                "วันที่เพิ่มสินค้า",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      showDatePicker(
                        context: context,
                        initialDate: selectedDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      ).then((date) {
                        if (date != null) {
                          setState(() {
                            selectedDate = date;
                          });
                        }
                      });
                    },
                    child: Text(
                      selectedDate == null
                          ? "เลือกวันที่เพิ่มสินค้า"
                          : DateFormat("yyyy-MM-dd").format(selectedDate!),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "ประเภทสินค้า",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DropdownButton<String>(
                value: selectedType,
                onChanged: (value) {
                  setState(() {
                    selectedType = value!;
                  });
                },
                items: types.map((type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
              ),
              
              SizedBox(height: 20),
              Text(
                "รายละเอียดเพิ่มเติม",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              TextField(
                controller: detailsController,
                decoration: InputDecoration(
                  labelText: "กรอกรายละเอียด",
                  border: OutlineInputBorder(),
                ),
                keyboardType:
                    TextInputType.multiline, // กำหนดให้รองรับข้อความหลายบรรทัด
                maxLines: null, // กำหนดให้สามารถเพิ่มบรรทัดใหม่ได้
              ),
              SizedBox(height: 20),
              Text(
                "ราคา",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(labelText: "กรอกราคา"),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    var title = titleController.text;
                    var author = authorController.text;
                    var details = detailsController.text;
                    var amount = amountController.text;

                    if (selectedType.isEmpty || selectedDate == null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("ค่าประเภทหรือวันที่ไม่ถูกต้อง"),
                            content: Text("โปรดเลือกประเภทและวันที่ก่อนบันทึก"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("ปิด"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Transactions statement = Transactions(
                        title: title,
                        author: author,
                        type: selectedType,
                        date: selectedDate!,
                        amount: double.parse(amount),
                        details: details,
                        imageBytes: imageBytes!,
                      );

                      var provider = Provider.of<TransactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statement);

                      Navigator.pop(context);
                    }
                  },
                  child: Text('เพิ่มข้อมูล'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // กลับหน้าหลัก
                  },
                  child: Text('กลับหน้าหลัก'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
