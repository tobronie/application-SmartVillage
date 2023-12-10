import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desa/services/firestore_berita.dart';
import 'package:desa/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:desa/screens/berita/detailberitascreens.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FilterBeritaComponent extends StatefulWidget {
  const FilterBeritaComponent({Key? key}) : super(key: key);

  @override
  State<FilterBeritaComponent> createState() => _FilterBeritaComponent();
}

final FireStoreBerita fireStoreBerita = FireStoreBerita();
final TextEditingController txtImage = TextEditingController();
final TextEditingController txtKategori = TextEditingController();
final TextEditingController txtJudul = TextEditingController();
final TextEditingController txtProfil = TextEditingController();
final TextEditingController txtNama = TextEditingController();
final TextEditingController txtTanggal = TextEditingController();
final TextEditingController txtText = TextEditingController();

class _FilterBeritaComponent extends State<FilterBeritaComponent> {
  User? _user;
  Map<String, dynamic>? _userData;

  @override
  void initState() {
    super.initState();
    _user = FirebaseAuth.instance.currentUser;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (_user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_user!.email)
          .get();

      if (userDoc.exists) {
        setState(() {
          _userData = userDoc.data() as Map<String, dynamic>;
        });
      }
    }
  }

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
              SizedBox(width: 5),
              Text(
                'Berita Anda',
                style: mTitleStyleNameApps.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                          SizedBox(height: 20),
                          // Daftar Berita
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: beritaList.length,
                            itemBuilder: (BuildContext context, int index) {
                              final item = beritaList[index].data()
                                  as Map<String, dynamic>;

                              // Filter berdasarkan nama pengguna yang login
                              if (_userData != null &&
                                  item['nama'] == _userData!['nama_lengkap']) {
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailBeritaScreens(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                                child: Image.network(
                                                  item['image'] ?? '',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 10),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.green
                                                            .withOpacity(
                                                                0.7),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Edit Berita'),
                                                                content:
                                                                    SingleChildScrollView(
                                                                  child: Column(
                                                                    children: [
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      TextField(
                                                                        controller: txtImage
                                                                          ..text =
                                                                              item['image'],
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Image URL',
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      TextField(
                                                                        controller: txtJudul
                                                                          ..text =
                                                                              item['judul'],
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Judul Berita',
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                          height:
                                                                              10),
                                                                      TextField(
                                                                        controller: txtText
                                                                          ..text =
                                                                              item['text'],
                                                                        decoration:
                                                                            InputDecoration(
                                                                          labelText:
                                                                              'Isi Berita',
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: [
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      fireStoreBerita
                                                                          .updateBerita(
                                                                        beritaList[index]
                                                                            .id,
                                                                        txtImage
                                                                            .text,
                                                                        txtJudul
                                                                            .text,
                                                                        txtText
                                                                            .text,
                                                                      );
                                                                      txtImage
                                                                          .clear();
                                                                      txtJudul
                                                                          .clear();
                                                                      txtText
                                                                          .clear();
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Simpan'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: Icon(Icons.edit,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 10),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.red
                                                            .withOpacity(
                                                                0.7), // Reduce opacity to 70%
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                      child: IconButton(
                                                        onPressed: () {
                                                          showDialog(
                                                            context: context,
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: Text(
                                                                    'Konfirmasi Hapus'),
                                                                content: Text(
                                                                    'Anda yakin ingin menghapus data ini?'),
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Batal'),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      // Hapus data berita
                                                                      fireStoreBerita
                                                                          .deleteBerita(
                                                                              beritaList[index].id);
                                                                      Navigator.of(
                                                                              context)
                                                                          .pop();
                                                                    },
                                                                    child: Text(
                                                                        'Hapus'),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        icon: Icon(Icons.delete,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
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
                                                  item['judul'] ?? '',
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
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        child: Image.network(
                                                          item['profil'] ?? '',
                                                          height: 20,
                                                          width: 20,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        item['nama'] ?? '',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                        child: Center(
                                                            child: Text('-')),
                                                      ),
                                                      Text(
                                                        item['tanggal'] ?? '',
                                                        style: TextStyle(
                                                            fontSize: 12),
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
            ],
          ),
        ),
      ),
    );
  }
}
