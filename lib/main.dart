import 'package:flutter/material.dart';

import 'quiz_page.dart'; // Importing the quiz page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  void _navigateToQuizPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QuizPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('A & Q '),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              // Handle favorite action
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Favorite')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Handle share action
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Share')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Handle settings action
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Quiz App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20), // Space between text and image
            Image.network(
              'https://www.filsantejeunes.com/wp-content/uploads/2020/10/Quiz2LG.jpg', // Replace with your image URL
              width: 300, // Set width as needed
              height: 200, // Set height as needed
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Space between image and button
            ElevatedButton(
              onPressed: () => _navigateToQuizPage(context),
              child: const Text("Let's Start"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 23),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
