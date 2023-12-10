import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desa/component/berita/Filterberitacomponent.dart';
import 'package:desa/services/firestore_berita.dart';
import 'package:flutter/material.dart';
import 'package:desa/screens/akun/akunscreens.dart';
import 'package:desa/screens/berita/beritascreens.dart';
import 'package:desa/screens/berita/detailberitascreens.dart';
import 'package:desa/screens/home/homescreens.dart';
import 'package:desa/utils/constans.dart';

class BeritaComponent extends StatefulWidget {
  const BeritaComponent({super.key});

  @override
  State<BeritaComponent> createState() => _BeritaComponent();
}

final TextEditingController searchController = TextEditingController();

final FireStoreBerita fireStoreBerita = FireStoreBerita();
final TextEditingController txtImage = TextEditingController();
final TextEditingController txtKategori = TextEditingController();
final TextEditingController txtJudul = TextEditingController();
final TextEditingController txtProfil = TextEditingController();
final TextEditingController txtNama = TextEditingController();
final TextEditingController txtTanggal = TextEditingController();
final TextEditingController txtText = TextEditingController();

class _BeritaComponent extends State<BeritaComponent> {
  String _selectedCategory = 'Semuanya';

  Widget buildCategoryButton(String txtKategori) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedCategory = txtKategori;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: _selectedCategory == txtKategori ? Colors.green : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        txtKategori,
        style: TextStyle(
          color: _selectedCategory == txtKategori ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  List<DocumentSnapshot> filterBeritaList(
      String query, List<DocumentSnapshot> beritaList) {
    return beritaList.where((berita) {
      final judul = berita['judul'].toString().toLowerCase();
      return judul.contains(query.toLowerCase());
    }).toList();
  }

  // final FirebaseAuth _authServicev = FirebaseAuth.instanceFor.instance;
  final _formKey = GlobalKey<FormState>();
  String selectedCategory = 'Semuanya';

  @override
  Widget build(BuildContext context) {
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
                  Navigator.pop(context);
                },
              ),
              Container(
                height: 40,
                width: 282,
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
                        controller: searchController,
                        onChanged: (query) {
                          setState(() {});
                        },
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
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        fullscreenDialog: true,
                        builder: (context) => FilterBeritaComponent(),
                      ));
                },
              ),
            ],
          ),
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
                  List<DocumentSnapshot> filteredBeritaList =
                      filterBeritaList(searchController.text, beritaList);

                  return Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailBeritaScreens(
                                beritaData: beritaList[0].data()
                                    as Map<String, dynamic>,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Image.network(
                                  beritaList[0][
                                      'image'],
                                  width: double.maxFinite,
                                  height: 250,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(
                                beritaList[0][
                                    'judul'],
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
                                    child: Image.network(
                                      beritaList[0][
                                          'profil'],
                                      height: 20,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    beritaList[0][
                                        'nama'],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 14,
                                    child: Center(child: Text('-')),
                                  ),
                                  Text(
                                    beritaList[0][
                                        'tanggal'],
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
                            Container(
                              height: 30,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  buildCategoryButton('Semuanya'),
                                  SizedBox(width: 10),
                                  buildCategoryButton('Informasi'),
                                  SizedBox(width: 10),
                                  buildCategoryButton('Infrastruktur'),
                                  SizedBox(width: 10),
                                  buildCategoryButton('Layanan'),
                                  SizedBox(width: 10),
                                  buildCategoryButton('Kecelakaan'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Daftar Berita
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: filteredBeritaList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = filteredBeritaList[index].data()
                              as Map<String, dynamic>;

                          // Filter item berdasarkan kategori yang dipilih
                          if (item['kategori'] == _selectedCategory ||
                              _selectedCategory == 'Semuanya') {
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
                                              '', // Pastikan URL gambar tidak null
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
                                                  '', // Pastikan nilai judul tidak null
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
                                                        BorderRadius.circular(
                                                            10),
                                                    child: Image.network(
                                                      item['profil'] ?? '',
                                                      height: 20,
                                                      width: 20,
                                                      fit: BoxFit
                                                          .cover, // Sesuaikan dengan kontennya
                                                    ),
                                                  ),
                                                  SizedBox(width: 5),
                                                  Text(
                                                    item['nama'] ??
                                                        '', // Pastikan nilai nama tidak null
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                    child: Center(
                                                        child: Text(' - ')),
                                                  ),
                                                  Text(
                                                    item['tanggal'] ??
                                                        '', // Pastikan nilai tanggal tidak null
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
                          } else {
                            // Jika kategori tidak sesuai, kembalikan widget kosong
                            return SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  );
                }
              }
            },
          ),
        ])),
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
