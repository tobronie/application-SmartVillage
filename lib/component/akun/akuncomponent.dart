import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desa/services/firestore_produk.dart';
import 'package:desa/services/firestore_service.dart';
import 'package:desa/services/firestore_berita.dart';
import 'package:desa/utils/constans.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:desa/screens/akun/akunscreens.dart';
import 'package:desa/screens/berita/beritascreens.dart';
import 'package:desa/screens/home/homescreens.dart';

class AkunComponent extends StatefulWidget {
  const AkunComponent({Key? key}) : super(key: key);

  @override
  State<AkunComponent> createState() => _AkunComponent();
}

final FireStoreService firestoreService = FireStoreService();
final TextEditingController txtImageProfile = TextEditingController();
final TextEditingController txtNamaLengkap = TextEditingController();
final TextEditingController txtNIK = TextEditingController();
final TextEditingController txtNoKK = TextEditingController();
final TextEditingController txtAlamat = TextEditingController();
final TextEditingController txtNoHandphone = TextEditingController();
final TextEditingController txtEmail = TextEditingController();

final FireStoreBerita fireStoreBerita = FireStoreBerita();
final TextEditingController txtImage = TextEditingController();
final TextEditingController txtKategori = TextEditingController();
final TextEditingController txtJudul = TextEditingController();
final TextEditingController txtProfil = TextEditingController();
final TextEditingController txtNama = TextEditingController();
final TextEditingController txtTanggal = TextEditingController();
final TextEditingController txtText = TextEditingController();

final FireStoreProduk fireStoreProduk = FireStoreProduk();
final TextEditingController txtNamaProduk = TextEditingController();
final TextEditingController txtImageProduk = TextEditingController();
final TextEditingController txtHargaProduk = TextEditingController();
final TextEditingController txtDeskripsiProduk = TextEditingController();

class _AkunComponent extends State<AkunComponent> {
  final FirebaseAuth _authService = FirebaseAuth.instance;
  late final User currentUser;

  @override
  void initState() {
    super.initState();
    currentUser = _authService.currentUser!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(width: 5),
            Text(
              'Akun Anda',
              style: mTitleStyleNameApps.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FireStoreService().getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      List userList = snapshot.data!.docs;
                      List<DocumentSnapshot>? currentUserData = userList
                          .where((doc) => doc.id == currentUser.email)
                          .cast<DocumentSnapshot<Object?>>()
                          .toList();
                      if (currentUserData.isEmpty) {
                        return Text("User data not found");
                      }
                      DocumentSnapshot documentSnapshot = currentUserData[0];
                      Map<String, dynamic> data =
                          documentSnapshot.data() as Map<String, dynamic>;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.network(
                                (data['imageprofil']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          itemProfile((data['nama_lengkap']), Icons.person),
                          SizedBox(height: 10),
                          itemProfile((data['nik']), Icons.note),
                          SizedBox(height: 10),
                          itemProfile((data['no_kk']), Icons.note),
                          SizedBox(height: 10),
                          itemProfile((data['alamat']), Icons.location_city),
                          SizedBox(height: 10),
                          itemProfile((data['no_hp']), Icons.phone),
                          SizedBox(height: 10),
                          itemProfile((data['email']), Icons.mail),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Edit Data'),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtImageProfile,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'URL Image Profile'),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextField(
                                                  controller: txtNamaLengkap,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Nama Lengkap'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtNIK,
                                                  decoration: InputDecoration(
                                                      labelText: 'No NIK'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtNoKK,
                                                  decoration: InputDecoration(
                                                      labelText: 'No KK'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtAlamat,
                                                  decoration: InputDecoration(
                                                      labelText: 'Alamat'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtNoHandphone,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'No Handphone'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                firestoreService.updateData(
                                                  documentSnapshot.id,
                                                  txtImageProfile.text,
                                                  txtNamaLengkap.text,
                                                  txtNIK.text,
                                                  txtNoKK.text,
                                                  txtAlamat.text,
                                                  txtNoHandphone.text,
                                                );
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Simpan'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    primary: Colors.green,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.edit_note_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    DateTime now = DateTime.now();
                                    String formattedDate =
                                        "${now.day}-${now.month}-${now.year}";
                                    String fotoProfilPengguna =
                                        data['imageprofil'];
                                    String namaLengkapPengguna =
                                        data['nama_lengkap'];
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Tulis Berita Baru'),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtImage,
                                                  decoration: InputDecoration(
                                                      labelText: 'Image URL'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtKategori,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Kategori Berita'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtJudul,
                                                  decoration: InputDecoration(
                                                      labelText:
                                                          'Judul Berita'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtText,
                                                  decoration: InputDecoration(
                                                      labelText: 'Isi Berita'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                fireStoreBerita.addBerita(
                                                  txtImage.text,
                                                  txtKategori.text,
                                                  txtJudul.text,
                                                  fotoProfilPengguna,
                                                  namaLengkapPengguna,
                                                  formattedDate,
                                                  txtText.text,
                                                );
                                                txtImage.clear();
                                                txtKategori.clear();
                                                txtJudul.clear();
                                                txtText.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Simpan'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    primary: Colors.green,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.feed_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Tambah Produk Baru'),
                                          content: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtImageProduk,
                                                  decoration: InputDecoration(
                                                      labelText: 'Image URL'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtNamaProduk,
                                                  decoration: InputDecoration(
                                                      labelText: 'Nama Produk'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtHargaProduk,
                                                  decoration: InputDecoration(
                                                      labelText: 'Harga'),
                                                ),
                                                SizedBox(height: 10),
                                                TextField(
                                                  controller: txtDeskripsiProduk,
                                                  decoration: InputDecoration(
                                                      labelText: 'Deskripsi'),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              onPressed: () {
                                                FireStoreProduk().addProduk(
                                                  txtImageProduk.text,
                                                  txtNamaProduk.text,
                                                  txtHargaProduk.text,
                                                  txtDeskripsiProduk.text,
                                                );
                                                txtImageProduk.clear();
                                                txtNamaProduk.clear();
                                                txtHargaProduk.clear();
                                                txtDeskripsiProduk.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: Text('Simpan'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    primary: Colors.green,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.next_week_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        elevation: 10,
        currentIndex: 2,
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
    );
  }

  Widget itemProfile(String title, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            color: Colors.black.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: ListTile(
        title: Text(title),
        leading: Icon(iconData),
        tileColor: Colors.white,
      ),
    );
  }
}
