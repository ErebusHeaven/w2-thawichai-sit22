import 'package:flutter/material.dart';
import 'rectengle_page.dart';
import 'kilogramstopounds_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.deepPurple.shade50,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/rectanglecal_page': (context) => const RecTanglePage(),
        '/kilogramstopounds_page': (context) =>
        const KiloGramsToPoundsPage(),
      },
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Calculator"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _menuButton(
              context,
              title: "Rectangle Area",
              icon: Icons.crop_square,
              route: '/rectanglecal_page',
            ),
            const SizedBox(height: 20),
            _menuButton(
              context,
              title: "Kg → Pounds",
              icon: Icons.scale,
              route: '/kilogramstopounds_page',
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuButton(
      BuildContext context, {
        required String title,
        required IconData icon,
        required String route,
      }) {
    return SizedBox(
      width: 260,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: () => Navigator.pushNamed(context, route),
        icon: Icon(icon),
        label: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 4,
        ),
      ),
    );
  }
}
