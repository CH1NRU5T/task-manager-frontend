import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/widgets/task_container.dart';
import 'package:task_manager_app/features/home/services/home_service.dart';
import 'package:task_manager_app/models/task.dart';
import 'package:task_manager_app/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Task> _tasks = [];

  List<Task> getTasks(int zerone) {
    if (zerone == 0) {
      List<Task> oddTasks =
          _tasks.where((element) => element.counter % 2 == 1).toList();
      return oddTasks;
    } else {
      List<Task> evenTasks =
          _tasks.where((element) => element.counter % 2 == 0).toList();
      return evenTasks;
    }
  }

  void _getTasksFromApi() {
    HomeService()
        .getAllTasks(context.read<UserProvider>().username, context)
        .then((value) {
      if (value != null) {
        setState(() {
          _tasks = value;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getTasksFromApi();
  }

  @override
  Widget build(BuildContext context) {
    List<Task> oddTasks = getTasks(0);
    List<Task> evenTasks = getTasks(1);

    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            List<Task>? tasks = await HomeService()
                .getAllTasks(context.read<UserProvider>().username, context);
            if (tasks != null) {
              setState(() {
                _tasks = tasks;
              });
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: oddTasks.map((e) {
                        return TaskContainer(
                          title: e.title,
                          description: e.description,
                        );
                      }).toList(),
                    ),
                  ),
                  10.width,
                  Expanded(
                    child: Column(
                      children: evenTasks.map((e) {
                        return TaskContainer(
                          title: e.title,
                          description: e.description,
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
