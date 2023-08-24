import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager_app/constants/widgets/task_text_form_field.dart';
import 'package:task_manager_app/features/task/services/task_service.dart';
import 'package:task_manager_app/models/task.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key, required this.task});
  static const String routeName = '/task';
  final Task task;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TaskService _taskService;
  @override
  void initState() {
    super.initState();
    _taskService = TaskService();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  _saveWithoutNotifying() {
    if (widget.task.id.isNotEmpty) {
      _taskService.updateTask(context, widget.task.id, _titleController.text,
          _descriptionController.text, false);
    }
  }

  _save() {
    if (widget.task.id.isNotEmpty) {
      _taskService.updateTask(context, widget.task.id, _titleController.text,
          _descriptionController.text, true);
    } else {
      _taskService.createTask(
          context: context,
          title: _titleController.text,
          description: _descriptionController.text);
    }
  }

  _delete() {
    _taskService.deleteTask(context, widget.task.id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomSheet: widget.task.updatedAt != null
            ? Container(
                color: Colors.red,
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text(
                      'Edited ${DateFormat('MMM dd').format(DateTime.parse(widget.task.updatedAt!))}'),
                ),
              )
            : const SizedBox(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.save_rounded,
                color: Colors.black,
              ),
              onPressed: _save,
            ),
            if (widget.task.id.isNotEmpty)
              IconButton(
                icon: const Icon(
                  Icons.delete_rounded,
                  color: Colors.black,
                ),
                onPressed: _delete,
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              flex: 1,
              child: TaskTextFormField(
                onChanged: _saveWithoutNotifying,
                controller: _titleController,
                label: 'Title',
                desc: false,
              ),
            ),
            Expanded(
              flex: 16,
              child: TaskTextFormField(
                onChanged: _saveWithoutNotifying,
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
