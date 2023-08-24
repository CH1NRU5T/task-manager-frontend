// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:task_manager_app/models/task.dart';

class User {
  String username;
  List<Task> tasks;
  User({
    required this.username,
    required this.tasks,
  });

  User copyWith({
    String? username,
    List<Task>? tasks,
  }) {
    return User(
      username: username ?? this.username,
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'tasks': tasks.map((x) => x.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] as String,
      tasks: List<Task>.from(
        (map['tasks'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(username: $username, tasks: $tasks)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.username == username && listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => username.hashCode ^ tasks.hashCode;
}
