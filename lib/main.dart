import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Second practice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Second practice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 1. Название ЯП
            const Text(
              "Kotlin",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // 2. Описание ЯП
            const Text(
              "Kotlin — современный язык программирования, "
                  "который используется для Android-разработки и backend-сервисов.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),

            // 3. Картинка + 4 наименования
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  'https://blog.sosafeapp.com/content/images/size/w2000/2020/04/blog---mi-primera-app-en-Kotlin.png',
                  width: 200,
                  height: 150,
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text("Java"),
                    SizedBox(height: 8),
                    Text("Kotlin"),
                    SizedBox(height: 8),
                    Text("C++"),
                    SizedBox(height: 8),
                    Text("Python"),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 16),

            // 4. Аватарка пользователя + текст
            Row(
              children: [
                Icon(Icons.account_circle_sharp, color: Colors.purple),
                const SizedBox(width: 12),
                const Text(
                  "Малаев Илья Александрович ИКБО-35-22",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
