import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/constants/constants.dart';
import 'package:task_manager_app/constants/extensions/extension.dart';
import 'package:task_manager_app/constants/widgets/task_container.dart';
import 'package:task_manager_app/features/home/services/home_service.dart';
import 'package:task_manager_app/features/login/screens/login_screen.dart';
import 'package:task_manager_app/features/task/screens/task_screen.dart';
import 'package:task_manager_app/models/task.dart';
import 'package:task_manager_app/providers/task_provider.dart';
import 'package:task_manager_app/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TaskProvider provider;
  late List<Task> _tasks = [];

  List<Task> getTasks(int zerone) {
    if (zerone == 0) {
      List<Task> oddTasks =
          _tasks.where((element) => element.counter! % 2 == 1).toList();
      return oddTasks;
    } else {
      List<Task> evenTasks =
          _tasks.where((element) => element.counter! % 2 == 0).toList();
      return evenTasks;
    }
  }

  _getTasksFromApi() {
    HomeService().getAllTasks(context.read<UserProvider>().username, context);
  }

  _createTask() {
    Navigator.pushNamed(context, TaskScreen.routeName, arguments: {
      'task': Task(
        title: '',
        description: '',
        id: '',
        counter: 0,
      ),
    });
  }

  @override
  void initState() {
    super.initState();
    _getTasksFromApi();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = context.watch<TaskProvider>();
  }

  _logout() {
    context.read<UserProvider>().logout();
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    _tasks = provider.tasks;
    List<Task> oddTasks = getTasks(0);
    List<Task> evenTasks = getTasks(1);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              tooltip: 'Logout',
              icon: const Icon(
                Icons.logout_rounded,
              ),
              onPressed: _logout,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: fabColor,
          foregroundColor: Colors.white,
          onPressed: () {
            _createTask();
          },
          child: const Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            HomeService()
                .getAllTasks(context.read<UserProvider>().username, context);
          },
          child: (oddTasks.isEmpty && evenTasks.isEmpty)
              ? Center(
                  child: Text(
                    emptyStrings[Random().nextInt(emptyStrings.length)],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: oddTasks.map(
                                (e) {
                                  return TaskContainer(task: e);
                                },
                              ).toList(),
                            ),
                          ),
                          10.width,
                          Expanded(
                            child: Column(
                              children: evenTasks.map(
                                (e) {
                                  return TaskContainer(task: e);
                                },
                              ).toList(),
                            ),
                          ),
                        ]),
                  ),
                ),
        ),
      ),
    );
  }
}
