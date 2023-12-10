import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');
  Stream<QuerySnapshot> getCategories() {
    final categoriesStream = categories.snapshots();
    return categoriesStream;
  }

  final CollectionReference populer =
      FirebaseFirestore.instance.collection('populer');
  Stream<QuerySnapshot> getPopuler() {
    final populerStream = populer.snapshots();
    return populerStream;
  }

  final CollectionReference terbaru =
      FirebaseFirestore.instance.collection('terbaru');
  Stream<QuerySnapshot> getTerbaru() {
    final terbaruStream = terbaru.snapshots();
    return terbaruStream;
  }

  final CollectionReference listCategories =
      FirebaseFirestore.instance.collection('listCategories');
  Stream<QuerySnapshot> getlistCategories() {
    final listCategoriesStream = listCategories.snapshots();
    return listCategoriesStream;
  }

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  Stream<QuerySnapshot> getUsers() {
    final usersStream = users.snapshots();
    return usersStream;
  }
}
