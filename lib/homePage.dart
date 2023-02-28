import 'package:depremsizsiniz/widget/datas.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
/*Selam geliştirici dostlar!
Bu sayfanın deprem bildirimlerinde http kütüphanesi
ve http://193.111.125.206:5000/ api'ı kullanılmıştır.

Eğer bu sayfayı Chrome ile debug edecekseniz, güvenlik
kurallarını yeniden düzenlemeniz gerekir.

 1- Klasöre gidin: flutter\bin\cache ve bu dosyayı silin: flutter_tools.stamp
 2- Klasöre gidin:
    flutter\packages\flutter_tools\lib\src\web ve bu dosyayı açın: chrome.dart.
 3- '--disable-extensions' yazılı satırı bulup, silin ve onun yerine '--disable-web-security' yazın.
 
 Artık sertifika önlemleri duvarını kaldırdınız ve test edebilirsiniz.

 Tüm gerekli kısımlara notlar ve bilgi komutları bıraktım.
 Eğer aklınıza takılan yerler olursa bana bildirin.

  ~ JeaFriday
 */
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ///Tüm kontrolcüler (Controller..)
  final jeaDatasController = ScrollController();

  ///Tüm Rx değişkenler (GetX)
  final RxList dataList = [].obs;

  ///Rasathaneden veri geliyor.. (Asenkron Fonksiyon)
  Future<void> getRasathaneData(String link) async {
    final gotData = await http.get(Uri.parse(link)); // API'dan verileri al.
    final jsonParse = json.decode(gotData.body); // Verileri parçala.
    final Map x = jsonParse as Map; // Verileri makinaya Map olarak tanıt.
    final List result =
        x["results"]; //Map içerisinden results array kümesini çek.
    dataList.value = result; // GetX ile ekrana yazması için değişkene gönder.
  }

  ///Tüm değişkenler
  final Color color = Colors.black;
  final String imgUrl = "assets/img.jpg";

  ///initS
  @override
  void initState() {
    // Ekran başlıyor...
    super.initState();
    getRasathaneData(
        "http://193.111.125.206:5000/"); // Ekran başladığında, Ixel'in API'ından verileri toparla.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text("Depremsizsiniz"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mail_outline_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outline),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
              child: Obx(() => GestureDetector(
                    // Dokunma ile kaydırma etkin.
                    onVerticalDragUpdate: (details) {
                      jeaDatasController
                          .jumpTo(jeaDatasController.offset - details.delta.dy);
                    },
                    child: ListView.builder(
                      controller:
                          jeaDatasController, // Listview'in kaydırıcısı vardır.
                      itemCount: dataList
                          .length, // Uzunluk, gelen liste sayısına bağlıdır.
                      itemBuilder: (context, index) {
                        //Örnek: ["2023.02.24","11:42:38","38.2502","38.1677","5.0","-.-","3.1","-.-","SEYITUSAGI-YESILYURT","(MALATYA)"]
                        final String location = dataList[index][8].toString();
                        final String clock =
                            "${dataList[index][1].toString().split(":")[0]}:${dataList[index][1].toString().split(":")[1]}";
                        final intensity = dataList[index][6].toString();
                        return JeaDatas(
                          constraints: constraints,
                          location: location, //Nerede deprem oldu?
                          clock: clock, //Deprem hangi saatte oldu?
                          intensity: intensity, //Deprem şiddeti ne idi?
                        );
                      },
                    ),
                  )));
        },
      ),
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
                  children: const [
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
      bottomNavigationBar: const GNav(
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
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      );
}
