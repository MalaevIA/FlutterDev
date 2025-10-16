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

class ImageSwitcher extends StatefulWidget {
  @override
  _ImageSwitcherState createState() => _ImageSwitcherState();
}

class _ImageSwitcherState extends State<ImageSwitcher> {
  // список картинок
  final List<String> _images = [
    'lib/assets/images/C.png',
    'lib/assets/images/java.png',
    'lib/assets/images/kotlin.png',
    'lib/assets/images/python.png',
  ];

  int _currentIndex = 0;

  void _nextImage() {
    setState(() {
      // если последний — возвращаемся к первому
      _currentIndex = (_currentIndex + 1) % _images.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          _images[_currentIndex],
          width: 200,
          height: 150,
        ),
        ElevatedButton(
          onPressed: _nextImage,
          child: Text('Следующая картинка'),
        ),
      ],
    );
  }
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
                // Используем ImageSwitcher вместо статичной картинки
                ImageSwitcher(),
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

            // Добавляем счетчик для демонстрации
            const SizedBox(height: 16),
            Text(
              'Счетчик: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}