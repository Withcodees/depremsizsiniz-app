import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color color = Colors.black;
  final String imgUrl = "assets/img.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Text("Depremsizsiniz"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.mail_outline_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Center(),
      drawer: Drawer(
        child: Container(
          color: Colors.deepPurple[200],
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imgUrl),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 8.0,
                      left: 4.0,
                      child: Text(
                        "Depremsizsiniz",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              myItem(Icons.medical_services_outlined, "Yardımlar"),
              myItem(Icons.map, "Harita"),
              myItem(Icons.settings, "Ayarlar"),
              myItem(Icons.info, "İletişim"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: GNav(
        backgroundColor: Color(0xFFB39DDB),
        tabs: [
          GButton(
            icon: Icons.timeline_outlined,
            text: '  Depremler',
          ),
          GButton(
            icon: Icons.map_outlined,
            text: '  Harita',
          ),
          GButton(
            icon: Icons.av_timer_outlined,
            text: '  Geçmiş',
          ),
          GButton(
            icon: Icons.settings_outlined,
            text: '  Ayarlar',
          ),
        ],
      ),
    );
  }

  Widget myItem(IconData icon, String title) => ListTile(
        leading: Icon(icon),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      );
}
