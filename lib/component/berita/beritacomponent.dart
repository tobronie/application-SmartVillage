import 'package:flutter/material.dart';
import 'package:desa/screens/akun/akunscreens.dart';
import 'package:desa/screens/berita/beritascreens.dart';
import 'package:desa/screens/berita/detailberitascreens.dart';
import 'package:desa/screens/home/homescreens.dart';
import 'package:desa/models/berita.dart';
import 'package:desa/utils/constans.dart';

class BeritaComponent extends StatefulWidget {
  @override
  _BeritaComponent createState() => _BeritaComponent();
}

class _BeritaComponent extends State<BeritaComponent> {
  final _formKey = GlobalKey<FormState>();
  String selectedCategory = 'Semuanya';

  @override
  Widget build(BuildContext context) {
    List<Berita> filteredBerita = berita.where((item) {
      return selectedCategory == 'Semuanya' ||
          item.kategori == selectedCategory;
    }).toList();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreens.routeName);
                },
              ),
              Container(
                height: 40,
                width: 280,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black),
                    SizedBox(width: 8),
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
            ],
          ),
        ),
        body: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, DetailBeritaScreens.routeName);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        filteredBerita[0]
                            .image,
                        width: double.maxFinite,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      filteredBerita[0]
                          .judul,
                      maxLines: 2,
                      style: mTitleStyle16.copyWith(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Image.asset(filteredBerita[0].profil,
                              height:
                                  20),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          filteredBerita[0]
                              .nama,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                          child: Center(child: Text('-')),
                        ),
                        Text(
                          filteredBerita[0]
                              .tanggal,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    height: 30,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'Semuanya';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedCategory == 'Semuanya'
                                ? Colors.green
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Semuanya',
                            style: TextStyle(
                              color: selectedCategory == 'Semuanya'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'Informasi';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedCategory == 'Informasi'
                                ? Colors.green
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Informasi',
                            style: TextStyle(
                              color: selectedCategory == 'Informasi'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'Infrastruktur';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedCategory == 'Infrastruktur'
                                ? Colors.green
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Infrastruktur',
                            style: TextStyle(
                              color: selectedCategory == 'Infrastruktur'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'Layanan';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedCategory == 'Layanan'
                                ? Colors.green
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Layanan',
                            style: TextStyle(
                              color: selectedCategory == 'Layanan'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              selectedCategory = 'Kecelakaan';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: selectedCategory == 'Kecelakaan'
                                ? Colors.green
                                : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Kecelakaan',
                            style: TextStyle(
                              color: selectedCategory == 'Kecelakaan'
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: filteredBerita.length,
              itemBuilder: (BuildContext context, int index) {
                final item = filteredBerita[index];
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
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
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
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          elevation: 10,
          currentIndex: 1,
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
}
