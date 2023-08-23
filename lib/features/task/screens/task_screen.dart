import 'package:flutter/material.dart';
import 'package:task_manager_app/constants/widgets/task_text_form_field.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, this.title, this.description});
  static const String routeName = '/task';
  final String? title;
  final String? description;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              flex: 1,
              child: TaskTextFormField(
                controller: _titleController,
                label: 'Title',
                desc: false,
              ),
            ),
            Expanded(
              flex: 16,
              child: TaskTextFormField(
                controller: _descriptionController,
                label: 'Description',
                desc: true,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
