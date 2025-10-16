import 'package:flutter/material.dart';
import '../routes.dart';
import 'detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _counter = 0;

  // Список изображений для горизонтального ListView
  final List<String> _images = [
    'assets/images/C.png',
    'assets/images/java.png',
    'assets/images/kotlin.png',
    'assets/images/python.png',
  ];

  // Список пунктов для вертикального ListView/GridView
  final List<Map<String, dynamic>> _menuItems = [
    {
      'title': 'Java',
      'description': 'Объектно-ориентированный язык программирования',
      'icon': Icons.code,
      'year': '1995',
      'developer': 'James Gosling',
      'typing': 'Статическая',
      'paradigm': 'ООП',
    },
    {
      'title': 'Kotlin',
      'description': 'Современный язык для Android разработки',
      'icon': Icons.android,
      'year': '2011',
      'developer': 'JetBrains',
      'typing': 'Статическая',
      'paradigm': 'ООП, Функциональная',
    },
    {
      'title': 'C++',
      'description': 'Язык программирования для системного программирования',
      'icon': Icons.computer,
      'year': '1985',
      'developer': 'Bjarne Stroustrup',
      'typing': 'Статическая',
      'paradigm': 'ООП, Процедурная',
    },
    {
      'title': 'Python',
      'description': 'Высокоуровневый язык с простым синтаксисом',
      'icon': Icons.psychology,
      'year': '1991',
      'developer': 'Guido van Rossum',
      'typing': 'Динамическая',
      'paradigm': 'ООП, Функциональная',
    },
    {
      'title': 'Dart',
      'description': 'Язык для создания кроссплатформенных приложений',
      'icon': Icons.flutter_dash,
      'year': '2011',
      'developer': 'Google',
      'typing': 'Статическая',
      'paradigm': 'ООП, Функциональная',
    },
    {
      'title': 'JavaScript',
      'description': 'Язык для веб-разработки и интерактивных страниц',
      'icon': Icons.language,
      'year': '1995',
      'developer': 'Brendan Eich',
      'typing': 'Динамическая',
      'paradigm': 'ООП, Функциональная',
    },
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _navigateToDetail(Map<String, dynamic> item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(item: item),
      ),
    );
  }

  void _navigateToProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 1) {
      _navigateToProfile();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isWideScreen = MediaQuery.of(context).size.width > 600;
    final double verticalSpacing = isWideScreen ? 16.0 : 8.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Programming Languages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _navigateToProfile,
            tooltip: 'Профиль',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kotlin",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              "Kotlin — современный язык программирования, "
                  "который используется для Android-разработки и backend-сервисов.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
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
                    margin: const EdgeInsets.only(right: 12),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(
                        _images[index],
                        width: 150,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 150,
                            height: 100,
                            color: Colors.grey[300],
                            child: const Icon(Icons.image, size: 40),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.account_circle_sharp, color: Colors.purple, size: 40),
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
            const Text(
              'Меню:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: isWideScreen
                  ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 3,
                ),
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(item['icon'], color: Colors.deepPurple),
                      title: Text(
                        item['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['description']),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        _navigateToDetail(item);
                      },
                    ),
                  );
                },
              )
                  : ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: verticalSpacing),
                    child: ListTile(
                      leading: Icon(item['icon'], color: Colors.deepPurple),
                      title: Text(
                        item['title'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item['description']),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        _navigateToDetail(item);
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}