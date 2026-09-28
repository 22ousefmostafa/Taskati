import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../widgets/task_card_widget.dart';
import 'add_task_screen.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // قائمة المهام (تبدأ فارغة)
  List<Task> tasks = [];

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // العدادات الذكية للكونتينر العلوي
    int totalTasks = tasks.length;
    int doneTasks = tasks.where((t) => t.status == 'Done').length;
    int pendingTasks = tasks.where((t) => t.status == 'Pending').length;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFFE2E4F0),
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );

          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        icon: const Icon(Icons.add, color: Color(0xFF5A5D9D)),
        label: const Text(
          'Task',
          style:
              TextStyle(color: Color(0xFF5A5D9D), fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // الهيدر
              Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Color(0xFF5A5D9D),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Good Morning 👋',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text(widget.userName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  const Icon(Icons.notifications_none),
                ],
              ),
              const SizedBox(height: 20),

              // كونتينر الإحصائيات
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFF5A5D9D),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStatColumn('$totalTasks', 'Tasks'),
                    _buildStatColumn('$doneTasks', 'Done'),
                    _buildStatColumn('$pendingTasks', 'Pending'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Today\'s Tasks',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),

              // قائمة المهام
              Expanded(
                child: tasks.isEmpty
                    ? const Center(
                        child: Text(
                          'No tasks yet. Add some!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return TaskCardWidget(
                            task: tasks[index],
                            onDelete: () => deleteTask(index),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }
}
