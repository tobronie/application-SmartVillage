import 'package:desa/services/firestore_berita.dart';
import 'package:desa/utils/constans.dart';
import 'package:flutter/material.dart';

class DetailBeritaComponent extends StatefulWidget {
  final Map<String, dynamic> beritaData;

  DetailBeritaComponent({required this.beritaData});

  @override
  _DetailBeritaComponent createState() => _DetailBeritaComponent();
}

final FireStoreBerita fireStoreBerita = FireStoreBerita();

class _DetailBeritaComponent extends State<DetailBeritaComponent> {
  final _formKey = GlobalKey<FormState>();
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final beritaData = widget.beritaData;

    if (beritaData == null) {
      return Scaffold(
        body: Center(
          child: Text('Data berita kosong'),
        ),
      );
    }

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
                  Navigator.pop(
                      context); // Menggunakan Navigator.pop untuk kembali
                },
              ),
              SizedBox(width: 5),
              Text(
                'Detail Berita',
                style: mTitleStyleNameApps.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Image.network(
                  beritaData['image'],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 250),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        beritaData['judul'],
                        style: mTitleStyle16.copyWith(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Image.network(
                              beritaData['profil'],
                              height: 25,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            beritaData['nama'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                            child: Center(child: Text('-')),
                          ),
                          Text(
                            beritaData['tanggal'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        child: Text(
                          beritaData['text'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            height: 1.5,
                          ),
                          maxLines: isExpanded ? null : 10,
                          overflow: isExpanded
                              ? TextOverflow.clip
                              : TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            isExpanded ? 'Baca Sedikit' : 'Baca Selengkapnya',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.favorite),
                              SizedBox(height: 5),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.comment),
                              SizedBox(height: 5),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.share),
                              SizedBox(height: 5),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.save),
                              SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
