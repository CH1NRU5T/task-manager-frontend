// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Task {
  String title;
  String description;
  String id;
  String createdAt;
  String updatedAt;
  int counter;
  Task({
    required this.title,
    required this.description,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.counter,
  });

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? createdAt,
    String? updatedAt,
    int? counter,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      counter: counter ?? this.counter,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'counter': counter,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      description: map['description'] as String,
      id: map['_id'] as String,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] as String,
      counter: map['counter'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(title: $title, description: $description, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, counter: $counter)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.id == id &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.counter == counter;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        id.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        counter.hashCode;
  }
}
