import 'package:bookstore/model/author.dart';
import 'package:bookstore/model/book.dart';
import 'package:bookstore/model/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseReference {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static CollectionReference<Category> categoryCollection =
      firestore.collection("categories").withConverter<Category>(
            fromFirestore: (snap, __) => Category.fromJson(snap.data()!),
            toFirestore: (category, __) => category.toJson(),
          );
  static DocumentReference<Category> categoryDocument(String id) =>
      categoryCollection.doc(id);
  static CollectionReference<Author> authorCollection =
      firestore.collection("authors").withConverter<Author>(
            fromFirestore: (snap, __) => Author.fromJson(snap.data()!),
            toFirestore: (author, __) => author.toJson(),
          );
  static DocumentReference<Author> authorDocument(String id) =>
      authorCollection.doc(id);
  static CollectionReference<Book> bookCollection =
      firestore.collection("books").withConverter<Book>(
            fromFirestore: (snap, __) => Book.fromJson(snap.data()!),
            toFirestore: (book, __) => book.toJson(),
          );
  static DocumentReference<Book> bookDocument(String id) =>
      bookCollection.doc(id);
}
