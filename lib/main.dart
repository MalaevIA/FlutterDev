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

  // Список изображений для горизонтального ListView
  final List<String> _images = [
    'lib/assets/images/C.png',
    'lib/assets/images/java.png',
    'lib/assets/images/kotlin.png',
    'lib/assets/images/python.png',
  ];

  // Список пунктов для вертикального ListView
  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Java',
      'description': 'Объектно-ориентированный язык программирования',
      'icon': Icons.code,
      'trailingIcon': Icons.arrow_forward_ios,
    },
    {
      'title': 'Kotlin',
      'description': 'Современный язык для Android разработки',
      'icon': Icons.android,
      'trailingIcon': Icons.arrow_forward_ios,
    },
    {
      'title': 'C++',
      'description': 'Язык программирования для системного программирования',
      'icon': Icons.computer,
      'trailingIcon': Icons.arrow_forward_ios,
    },
    {
      'title': 'Python',
      'description': 'Высокоуровневый язык с простым синтаксисом',
      'icon': Icons.psychology,
      'trailingIcon': Icons.arrow_forward_ios,
    },
    {
      'title': 'Dart',
      'description': 'Язык для создания кроссплатформенных приложений',
      'icon': Icons.flutter_dash,
      'trailingIcon': Icons.arrow_forward_ios,
    },
  ];

  void _showSnackBar(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Вы выбрали: $title'),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
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
          crossAxisAlignment: CrossAxisAlignment.start,
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

            // 3. Горизонтальный ListView с изображениями со скругленными углами
            Text(
              'Языки программирования:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        _images[index],
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // 4. Аватарка пользователя + текст
            Row(
              children: [
                Icon(Icons.account_circle_sharp, color: Colors.purple, size: 40),
                const SizedBox(width: 12),
                const Expanded(
                  child: Text(
                    "Малаев Илья Александрович ИКБО-35-22",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 5. Вертикальный ListView с карточками
            Text(
              'Меню:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      leading: Icon(item['icon'], color: Colors.deepPurple),
                      title: Text(
                        item['title'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['description']),
                      trailing: Icon(item['trailingIcon'], size: 16),
                      onTap: () {
                        _showSnackBar(context, item['title']);
                      },
                    ),
                  );
                },
              ),
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