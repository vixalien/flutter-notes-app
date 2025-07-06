import 'package:flutter/material.dart';
import '../models/note.dart';
import '../data/note_repository.dart';

class NoteProvider with ChangeNotifier {
  final NoteRepository _repo = NoteRepository();

  List<Note> _notes = [];
  bool isLoading = false;

  List<Note> get notes => _notes;

  Future<void> fetchNotes() async {
    isLoading = true;
    notifyListeners();

    _notes = await _repo.fetchNotes();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addNote(String content) async {
    await _repo.addNote(content);
    await fetchNotes();
  }

  Future<void> updateNote(String id, String content) async {
    await _repo.updateNote(id, content);
    await fetchNotes();
  }

  Future<void> deleteNote(String id) async {
    await _repo.deleteNote(id);
    await fetchNotes();
  }
}
