import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreProduk {
  final CollectionReference produk =
      FirebaseFirestore.instance.collection('produk');
  Stream<QuerySnapshot> getProduk() {
    final produkStream = produk.snapshots();
    return produkStream;
  }

  Future<void> addProduk(
      String image, String nama, String harga, String deskripsi) async {
    produk.add({
      'image': image,
      'nama': nama,
      'harga': harga,
      'deskripsi': deskripsi,
    });
  }

  Future<void> updateProduk(
      String id, String nama, String harga, String deskripsi) async {
    produk.doc(id).update({
      'nama': nama,
      'harga': harga,
      'deskripsi': deskripsi,
    });
  }

  Future<void> deleteProduk(String id) async {
    produk.doc(id).delete();
  }
}
