import 'package:flutter/material.dart';
import 'package:my_schedule/models/task.dart';

class TaskController extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => List.unmodifiable(_tasks);

  void removedTask(Task task) {
    _tasks.remove(task);
    _ordenarTarefas();
    notifyListeners();
  }

  void addTask(Task task) {
    _tasks.add(task);
    _ordenarTarefas();
    notifyListeners();
  }

  void _ordenarTarefas() {
    _tasks.sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  void showTaskDetails(BuildContext context, Task task) {
    final date =
        '${task.dateTime.day.toString().padLeft(2, '0')}/${task.dateTime.month.toString().padLeft(2, '0')}/${task.dateTime.year}';
    final time = '${task.dateTime.hour.toString().padLeft(2, '0')}:00';

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(task.title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Descrição: ${task.description}'),
              SizedBox(height: 8),
              Text('Data: $date'),
              Text('Hora: $time'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
