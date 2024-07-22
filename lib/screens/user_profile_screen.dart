import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class UserProfileScreen extends StatelessWidget {
  final VoidCallback? onBack; // รับ Callback สำหรับการย้อนกลับไปยังหน้าหลัก

  UserProfileScreen({this.onBack}); // Constructor รับค่า Callback

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("ประวัติผู้พัฒนา"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: NetworkImage(
                  'https://scontent.fbkk10-1.fna.fbcdn.net/v/t39.30808-6/384754813_1391510181465273_995301613949052550_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=5f2048&_nc_ohc=SGKVKxf-MWkAX9xvtGG&_nc_ht=scontent.fbkk10-1.fna&oh=00_AfBqZbpB0-94mYVo8-g5dH7Dyi75S6NBwmilHQVF3pD7LA&oe=6561C79F',
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'ชื่อผู้พัฒนา: Hasan Chemamah',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'รหัสนักศึกษา: 406459027',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'ชั้นปี: ชั้นปีที่ 3',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'เรียนอยู่ที่: มหาวิทยาลัยราชภัฏยะลา',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      // เปิดลิงค์ Facebook ในแอพ Chrome Custom Tabs
                      openInChromeCustomTab(
                          'https://web.facebook.com/fdafee.fkhadafee');
                    },
                    icon: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1200px-Facebook_Logo_%282019%29.png',
                      width: 40,
                      height: 40,
                    ),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: () {
                      // เปิดลิงค์ Instagram ในแอพ Chrome Custom Tabs
                      openInChromeCustomTab(
                          'https://www.instagram.com/k._dafiiq_/');
                    },
                    icon: Image.network(
                      'https://p7.hiclipart.com/preview/729/192/1024/computer-icons-instagram-logo-sticker-logo.jpg',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // สำหรับปุ่มย้อนกลับ
                  Navigator.of(context).pop();
                },
                child: Text('ย้อนกลับ'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openInChromeCustomTab(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw 'ไม่สามารถเปิด URL: $url ได้';
    }
  }
}
