import 'package:application_store2/screens/category_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:application_store2/providers/transaction_provider.dart';
import 'package:application_store2/screens/form_screen.dart';
import 'package:provider/provider.dart';
import 'package:application_store2/screens/user_profile_screen.dart';
import 'package:application_store2/search/transaction_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'FURNITURE SHOP',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          //scaffoldBackgroundColor: Colors.cyanAccent,
        ),
        home: const MyHomePage(title: 'FURNITURE SHOP'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _navigateToUserProfileScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return UserProfileScreen(onBack: () {
            Navigator.pop(context);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
        leading: Image.network(
          'https://scalebranding.com/wp-content/uploads/2022/02/home-furniture-logo_2.jpg',
          width: 50, // กำหนดความกว้างของโลโก้
          fit: BoxFit.cover, // ปรับขนาดของรูปให้พอดี
        ),
        actions: [
          if (_selectedIndex == 0)
            // IconButton(
            //   icon: Icon(Icons.add),
            //   onPressed: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return FormScreen();
            //     }));
            //   },
            // ),
          IconButton(
            icon: Icon(Icons.search), // ไอคอนค้นหา
            onPressed: () {
              // เมื่อคลิกที่ไอคอนค้นหา
              // สร้างการแสดงคำค้นหา
              showSearch(
                context: context,
                delegate: TransactionSearchDelegate(
                  transactions: Provider.of<TransactionProvider>(context,
                          listen: false)
                      .transactions, // ใช้งาน Provider เพื่อรับรายการธุรกรรมจาก TransactionProvider
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage("https://www.hafelethailand.com/wp-content/uploads/2022/11/decorate-living-room-for-luck-banner.jpg"),
                fit:BoxFit.cover
              ),
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 50,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: ListTile(
                title: Center(
                  child: Text('living room',
                    style: TextStyle(
                      fontSize: 40, // ปรับขนาดฟ้อนต์ตามต้องการ
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // ทำให้ข้อความตัวหนา
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryDetailScreen(category: 'ห้องรับแขก');
                      },
                    ),
                  );
                },
              ),
            )
          ),
          
          SizedBox(height: 20),    
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage("https://images.livspace-cdn.com/plain/https://jumanji.livspace-cdn.com/magazine/wp-content/uploads/sites/2/2022/06/10183457/small-bedroom-ideas.jpg"),
                fit:BoxFit.cover
              ),
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 50,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: ListTile(
                title: Center(
                  child: Text('bedroom',
                    style: TextStyle(
                      fontSize: 40, // ปรับขนาดฟ้อนต์ตามต้องการ
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // ทำให้ข้อความตัวหนา
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryDetailScreen(category: 'ห้องนอน');
                      },
                    ),
                  );
                },
              ),
            )
          ),

          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage("https://atkitchenmag.com/wp-content/uploads/2019/07/Feature-DIY-kitchen1.jpg"),
                fit:BoxFit.cover
              ),
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 50,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: ListTile(
                title: Center(
                  child: Text('kitchen room',
                    style: TextStyle(
                      fontSize: 40, // ปรับขนาดฟ้อนต์ตามต้องการ
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // ทำให้ข้อความตัวหนา
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryDetailScreen(category: 'ห้องครัว');
                      },
                    ),
                  );
                },
              ),
            )
          ),

          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage("https://cwtower.com/wp-content/uploads/2021/11/modern-interior-working-room-2021-09-02-07-13-20-utc-scaled.jpg"),
                fit:BoxFit.cover
              ),
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 50,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: ListTile(
                title: Center(
                  child: Text('office room',
                    style: TextStyle(
                      fontSize: 40, // ปรับขนาดฟ้อนต์ตามต้องการ
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // ทำให้ข้อความตัวหนา
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryDetailScreen(category: 'ห้องทำงาน');
                      },
                    ),
                  );
                },
              ),
            )
          ),

          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            width: 200, // กำหนดความกว้างของ Card
            height: 200, // กำหนดความสูงของ Card
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage("https://blog.ghbank.co.th/wp-content/uploads/2021/10/Cover-%E0%B8%9A%E0%B8%97%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1-%E0%B9%84%E0%B8%AD%E0%B9%80%E0%B8%94%E0%B8%B5%E0%B8%A2%E0%B8%AB%E0%B9%89%E0%B8%AD%E0%B8%87%E0%B8%99%E0%B9%89%E0%B8%B3%E0%B8%AA%E0%B8%A7%E0%B8%A2%E0%B9%86-1.jpg"),
                fit:BoxFit.cover
              ),
            ),
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              color: Colors.transparent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 50,
              margin: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: ListTile(
                title: Center(
                  child: Text('bathroom',
                    style: TextStyle(
                      fontSize: 40, // ปรับขนาดฟ้อนต์ตามต้องการ
                      color: Colors.white,
                      fontWeight: FontWeight.bold, // ทำให้ข้อความตัวหนา
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryDetailScreen(category: 'ห้องน้ำ');
                      },
                    ),
                  );
                },
              ),
            )
          ),
          SizedBox(height: 20), // เพิ่มรายการประเภทอื่น ๆ ตามต้องการ
          
        ],
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          switch (index) {
            case 1: // ถ้าถูกเลือก index ที่ 2 (เพิ่มข้อมูล)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FormScreen(), // ไปยังหน้า FormScreen()
                ),
              );
              break;
            case 2: // ถ้าถูกเลือก index ที่ 3 (โปรไฟล์)
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UserProfileScreen(), // ไปยังหน้า ProfileScreen()
                ),
              );
              break;
            default:
              setState(() {
                _selectedIndex = index;
              });
          }
        },
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'เพิ่มข้อมูล',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}