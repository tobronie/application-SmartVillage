import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreBerita {
  final CollectionReference berita =
      FirebaseFirestore.instance.collection('berita');
  Stream<QuerySnapshot> getBerita() {
    final beritaStream = berita.snapshots();
    return beritaStream;
  }

  Future<void> addBerita(String image, String kategori, String judul,
      String profil, String nama, String tanggal, String text) async {
    berita.add({
      'image': image,
      'kategori': kategori,
      'judul': judul,
      'profil': profil,
      'nama': nama,
      'tanggal': tanggal,
      'text': text,
    });
  }

  Future<void> updateBerita(String id, String image, String judul, String text) async {
    berita.doc(id).update({
      'image': image,
      'judul': judul,
      'text': text,
    });
  }

  Future<void> deleteBerita(String id) async {
    berita.doc(id).delete();
  }
}
