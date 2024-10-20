import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  // List of questions and answers
  final List<Map<String, Object>> _questions = [
    {'question': 'What does HTML stand for?',
      'answers': [
        'Hypertext Markup Language',
        'High-level Text Markup Language',
        'Hyperlink and Text Markup Language',
        'Hypertext Machine Language'
      ],
      'correct': 'Hypertext Markup Language',
    },
    {
      'question': 'What is the purpose of a web server?',
      'answers': [
        'To store files on the internet',
        'To serve web pages to users',
        'To provide database access',
        'To manage user accounts'
      ],
      'correct': 'To serve web pages to users',
    },
    {
      'question': 'What does CSS stand for?',
      'answers': [
        'Creative Style Sheets',
        'Cascading Style Sheets',
        'Computer Style Sheets',
        'Colorful Style Sheets'
      ],
      'correct': 'Cascading Style Sheets',
    },
    {
      'question': 'What does API stand for?',
      'answers': [
        'Application Programming Interface',
        'Application Programming Internet',
        'Application Protocol Interface',
        'Application Platform Interface'
      ],
      'correct': 'Application Programming Interface',
    },
    {
      'question': 'Which HTTP status code indicates that the requested resource could not be found?',
      'answers': [
        '200',
        '403',
        '404',
        '500'
      ],
      'correct': '404',
    },
  ];

  int _currentQuestionIndex = 0;
  Map<int, String> _selectedAnswers = {};

  void _submitQuiz() {
    int score = 0;
    _selectedAnswers.forEach((index, answer) {
      if (_questions[index]['correct'] == answer) {
        score++;
      }
    });

    // Show result in a dialog
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Quiz Completed'),
        content: Text('You scored $score out of ${_questions.length}'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(); // Close the dialog
              Navigator.of(context).popUntil((route) => route.isFirst); // Navigate back to the welcome page
            },
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question['question'] as String,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...(question['answers'] as List<String>).map((answer) {
              return ListTile(
                title: Text(answer),
                leading: Radio<String>(
                  value: answer,
                  groupValue: _selectedAnswers[_currentQuestionIndex],
                  onChanged: (value) {
                    setState(() {
                      _selectedAnswers[_currentQuestionIndex] = value!;
                    });
                  },
                ),
              );
            }).toList(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_currentQuestionIndex == _questions.length - 1) {
                  _submitQuiz();
                } else {
                  setState(() {
                    _currentQuestionIndex++;
                  });
                }
              },
              child: Text(
                _currentQuestionIndex == _questions.length - 1 ? 'Submit' : 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

