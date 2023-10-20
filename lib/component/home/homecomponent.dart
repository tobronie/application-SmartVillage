import 'package:flutter/material.dart';
import 'package:desa/screens/akun/akunscreens.dart';
import 'package:desa/screens/berita/beritascreens.dart';
import 'package:desa/screens/berita/detailberitascreens.dart';
import 'package:desa/screens/home/homescreens.dart';
import 'package:desa/screens/login/loginscreens.dart';
import 'package:desa/models/produck.dart';
import 'package:desa/models/berita.dart';
import 'package:desa/utils/constans.dart';

class HomeComponent extends StatefulWidget {
  @override
  _HomeComponent createState() => _HomeComponent();
}

class _HomeComponent extends State<HomeComponent> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          actions: [
            Container(
              height: 40,
              width: 240,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.black),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari ...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.keyboard_voice_outlined,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
            PopupMenuButton<String>(
              icon: Icon(
                Icons.dehaze,
                color: Colors.white,
              ),
              itemBuilder: (BuildContext context) {
                return {'LogOut'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Row(
                      children: [
                        Icon(
                          Icons.logout,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10),
                        Text(
                          choice,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
              onSelected: (String choice) {
                if (choice == 'LogOut') {
                  Navigator.pushNamed(context, LoginScreens.routeName);
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),

        body: ListView(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    'assets/images/desa.jpg',
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Selamat Datang Imam',
                        style: mTitleStyleNameApps2.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Kami Siap Membantumu',
                        style: mTitle2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 115),
                      Text(
                        'ds. Kedungmulyo, kec. Bangilan, kab. Tuban,\nJawa Timur - 62364',
                        style: mTitle2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildMenuItem(
                    'Layanan', Icons.note_alt_outlined, Colors.green.shade400),
                _buildMenuItem(
                    'e-Pasar', Icons.store_sharp, Colors.green.shade400),
                _buildMenuItem('Ajuan', Icons.email, Colors.green.shade400),
                _buildMenuItem(
                    'Setting', Icons.settings, Colors.green.shade400),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Kebutuhan Untukmu',
                    style: mTitle2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 20),
                    height: 245,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      itemBuilder: (BuildContext context, int index) {
                        final product = products[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: 170,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    product.image,
                                    height: 170,
                                    width: 170,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      product.nama,
                                      style: mTitle2.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      'Rp ${product.harga},-',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      product.deskripsi,
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Berita Untukmu',
                    style: mTitle2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, BeritaScreens.routeName);
                    },
                    child: Text(
                      'Lihat Semuanya',
                      style: mTitle2.copyWith(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                final item = berita[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailBeritaScreens.routeName,
                      arguments: item,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 240, 240, 240),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 120,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            child: Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.judul,
                                  maxLines: 2,
                                  style: mTitle2.copyWith(),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image.asset(
                                          item.profil,
                                          height: 20,
                                          width: 20,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        item.nama,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      const SizedBox(
                                        width: 14,
                                        child: Center(child: Text('-')),
                                      ),
                                      Text(
                                        item.tanggal,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),

//NavBar
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          elevation: 10,
          currentIndex: 0,
          showUnselectedLabels: true,
          onTap: (int index) {
            if (index == 0) {
              Navigator.pushNamed(context, HomeScreens.routeName);
            } else if (index == 1) {
              Navigator.pushNamed(context, BeritaScreens.routeName);
            } else if (index == 2) {
              Navigator.pushReplacementNamed(context, AkunScreens.routeName);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_outlined),
              label: 'Berita',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String text, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 35,
              ),
              SizedBox(height: 2),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
