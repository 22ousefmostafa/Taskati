import 'package:flutter/material.dart';
import 'package:taskati/screens/task_screen.dart';
import 'package:taskati/widgets/task_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FC),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskScreen()),
          );
        },
        backgroundColor: const Color(0xFFE2E4FA),
        icon: const Icon(Icons.add, color: Color(0xFF4C589C)),
        label: const Text('Task',
            style: TextStyle(
                color: Color(0xFF4C589C), fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFF4C589C),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning 👋',
                          style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Text('Ahmed',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.notifications_none),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF4C589C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _StatItem(count: '12', label: 'Tasks'),
                    _StatItem(count: '5', label: 'Done'),
                    _StatItem(count: '7', label: 'Pending'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                "Today's Tasks",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const TaskCard(
                title: 'Flutter UI',
                subtitle: 'Build Register Screen',
                status: 'Pending',
                statusColor: Color(0xFF2196F3),
                statusBgColor: Color(0xFFE3F2FD),
                barColor: Colors.blue,
              ),
              const TaskCard(
                title: 'Workout',
                subtitle: 'Gym at 6 PM',
                status: 'Done',
                statusColor: Colors.green,
                statusBgColor: Color(0xFFE8F5E9),
                barColor: Colors.green,
              ),
              const TaskCard(
                title: 'Meeting',
                subtitle: 'Team Sync',
                status: 'In Progress',
                statusColor: Colors.orange,
                statusBgColor: Color(0xFFFFF3E0),
                barColor: Colors.orange,
              ),
              const TaskCard(
                title: 'Read Book',
                subtitle: 'Atomic Habits',
                status: 'Pending',
                statusColor: Colors.purple,
                statusBgColor: Color(0xFFF3E5F5),
                barColor: Colors.purple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}
