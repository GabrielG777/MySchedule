import 'package:flutter/material.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Schedule"),
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
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Bem-vindo ao painel!",
          style: TextStyle(
            fontSize: 20,
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
