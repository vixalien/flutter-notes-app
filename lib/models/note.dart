class Note {
  final String id;
  final String content;

  Note({required this.id, required this.content});

  factory Note.fromMap(Map<String, dynamic> data, String id) {
    return Note(id: id, content: data['content']);
  }

  Map<String, dynamic> toMap() {
    return {'content': content};
  }
}
