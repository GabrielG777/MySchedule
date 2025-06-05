import 'package:flutter/material.dart';
import 'package:my_schedule/controller/task_controller.dart';
import 'package:my_schedule/controller/theme_controller.dart';
import 'package:my_schedule/models/task.dart';
import 'package:my_schedule/pages/inicial_page.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor;
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.black;
    final taskController = Provider.of<TaskController>(context);
    final tasks = List<Task>.from(taskController.tasks);
    final themeController = Provider.of<ThemeController>(context);

    tasks.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Schedule"),
        actions: [
          IconButton(
            icon: Icon(
              themeController.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeController.toggleTheme(),
          ),
        ],
        backgroundColor: primaryColor,
        foregroundColor: theme.appBarTheme.foregroundColor,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: const Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: primaryColor),
              title: Text('Início', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: primaryColor),
              title: Text('Configurações', style: TextStyle(color: textColor)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: primaryColor),
              title: Text('Sair', style: TextStyle(color: textColor)),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const InicialPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  "Bem-vindo ao painel!",
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      final date =
                          '${task.dateTime.day.toString().padLeft(2, '0')}/${task.dateTime.month.toString().padLeft(2, '0')}/${task.dateTime.year}';
                      final time =
                          '${task.dateTime.hour.toString().padLeft(2, '0')}:${task.dateTime.minute.toString().padLeft(2, '0')}';
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text('${task.title} - $date - $time'),
                          trailing: IconButton(
                            onPressed: () {
                              taskController.removedTask(task);
                            },
                            icon: Icon(Icons.delete),
                          ),
                          onTap: () {
                            Provider.of<TaskController>(
                              context,
                              listen: false,
                            ).showTaskDetails(context, task);
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Tooltip(
                message: 'Adicionar tarefa',
                child: FloatingActionButton(
                  onPressed: () async {
                    final newTask = await Navigator.pushNamed(
                      context,
                      '/nova-tarefa',
                    );
                    if (newTask != null && newTask is Task) {
                      taskController.addTask(newTask);
                    }
                  },
                  tooltip: 'Adicionar tarefa',
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
