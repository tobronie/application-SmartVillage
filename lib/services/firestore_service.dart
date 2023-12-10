import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  Stream<QuerySnapshot> getUsers() {
    final usersStream = users.snapshots();
    return usersStream;
  }

  Future<void> addData(String image, String namalengkap, String nikktp, String nokk,
      String alamat, String nohp, String email) async {
    users.add({
      'image': image,
      'nama_lengkap': namalengkap,
      'nik': nikktp,
      'no_kk': nokk,
      'alamat': alamat,
      'no_hp': nohp,
      'email': email,
    });
  }

  Future<void> updateData(String id, String namalengkap, String nikktp,
      String nokk, String alamat, String nohp, String email) async {
    users.doc(id).update({
      'nama_lengkap': namalengkap,
      'nik': nikktp,
      'no_kk': nokk,
      'alamat': alamat,
      'no_hp': nohp,
      'email': email,
    });
  }

  Future<void> deleteData(String id) async {
    users.doc(id).delete();
  }
}
