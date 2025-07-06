import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/note.dart';

class NoteRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String get _uid => _auth.currentUser!.uid;

  Future<List<Note>> fetchNotes() async {
    final snapshot = await _firestore
        .collection('users/$_uid/notes')
        .orderBy('content')
        .get();

    return snapshot.docs
        .map((doc) => Note.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addNote(String content) async {
    await _firestore.collection('users/$_uid/notes').add({'content': content});
  }

  Future<void> updateNote(String id, String content) async {
    await _firestore.collection('users/$_uid/notes').doc(id).update({
      'content': content,
    });
  }

  Future<void> deleteNote(String id) async {
    await _firestore.collection('users/$_uid/notes').doc(id).delete();
  }
}
