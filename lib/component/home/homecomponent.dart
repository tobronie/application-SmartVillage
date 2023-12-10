import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desa/services/firestore_berita.dart';
import 'package:desa/services/firestore_produk.dart';
import 'package:flutter/material.dart';
import 'package:desa/screens/akun/akunscreens.dart';
import 'package:desa/screens/berita/beritascreens.dart';
import 'package:desa/screens/berita/detailberitascreens.dart';
import 'package:desa/screens/home/homescreens.dart';
import 'package:desa/screens/login/loginscreens.dart';
import 'package:desa/utils/constans.dart';

class HomeComponent extends StatefulWidget {
  const HomeComponent({super.key});
  @override
  State<HomeComponent> createState() => _HomeComponent();
}

final FireStoreBerita fireStoreBerita = FireStoreBerita();
final FireStoreProduk fireStoreProduk = FireStoreProduk();

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
              width: 290,
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

        body: SingleChildScrollView(
            child: Column(children: [
          StreamBuilder<QuerySnapshot>(
            stream: FireStoreBerita().getBerita(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else {
                  List<DocumentSnapshot> beritaList = snapshot.data!.docs;
                  return Column(
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
                          _buildMenuItem('Layanan', Icons.note_alt_outlined,
                              Colors.green.shade400),
                          _buildMenuItem('e-Pasar', Icons.store_sharp,
                              Colors.green.shade400),
                          _buildMenuItem(
                              'Ajuan', Icons.email, Colors.green.shade400),
                          _buildMenuItem(
                              'Setting', Icons.settings, Colors.green.shade400),
                        ],
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
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
                      StreamBuilder<QuerySnapshot>(
                        stream: FireStoreProduk().getProduk(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else {
                            if (snapshot.hasError) {
                              return Text(snapshot.error.toString());
                            } else {
                              List<DocumentSnapshot> produkList =
                                  snapshot.data!.docs;
                              return Container(
                                padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                                height: 225,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: produkList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final item = produkList[index].data()
                                        as Map<String, dynamic>;
                                    return Container(
                                      margin: EdgeInsets.all(5),
                                      width: 150,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(
                                                5), // Set semua sisi padding gambar
                                            child: Image.network(
                                              item['image'] ?? '',
                                              height: 140,
                                              width: 140,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  5), // Jarak antara gambar dan teks
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              item['nama'] ?? '',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              'Rp ${item['harga'] ?? ''},-',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Text(
                                              item['deskripsi'] ?? '',
                                              style: TextStyle(
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          }
                        },
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => BeritaScreens(),
                                    ));
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
                        itemCount:
                            min(3, beritaList.length), // Display only 3 items
                        itemBuilder: (BuildContext context, int index) {
                          final item =
                              beritaList[index].data() as Map<String, dynamic>;
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailBeritaScreens(
                                    beritaData: beritaList[index].data()
                                        as Map<String, dynamic>,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 240, 240),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                      child: Image.network(
                                        item['image'] ??
                                            '',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['judul'] ??
                                                '',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Container(
                                            clipBehavior: Clip.hardEdge,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image.network(
                                                    item['profil'] ?? '',
                                                    height: 20,
                                                    width: 20,
                                                    fit: BoxFit
                                                        .cover,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  item['nama'] ??
                                                      '',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                  child:
                                                      Center(child: Text('-')),
                                                ),
                                                Text(
                                                  item['tanggal'] ??
                                                      '',
                                                  style:
                                                      TextStyle(fontSize: 12),
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
                  );
                }
              }
            },
          ),
        ])),

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
