import 'package:flutter/material.dart';
import 'vocab.dart';

void main() {
  runApp(const VocabApp());
}

class VocabApp extends StatelessWidget {
  const VocabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocabulary App',
      home: const VocabScreen(),
    );
  }
}

class VocabScreen extends StatefulWidget {
  const VocabScreen({super.key});

  @override
  State<VocabScreen> createState() => _VocabScreenState();
}

class _VocabScreenState extends State<VocabScreen> {
  int index = 0;
  bool showMeaning = false;

  void nextWord() {
  setState(() {
    index++;
    showMeaning = false;
  });
}

  @override
  Widget build(BuildContext context) {
    if (index >= vocabList.length) {
  return Scaffold(
    appBar: AppBar(title: const Text("Vocabulary")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "🎉 Συγχαρητήρια! 🎉",
            style: TextStyle(fontSize: 32),
          ),
          const SizedBox(height: 20),
          const Text(
            "Μελέτησες όλες τις λέξεις!",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              setState(() {
                index = 0;
                showMeaning = false;
                vocabList.shuffle();
              });
            },
            child: const Text("Ξανά!"),
          ),
        ],
      ),
    ),
  );
}
    final word = vocabList[index];

    return Scaffold(
      appBar: AppBar(title: const Text("Vocabulary")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
  onTap: () {
    setState(() {
      showMeaning = !showMeaning;
    });
  },
  child: Column(
    children: [
      Text(word.word,
        style: const TextStyle(fontSize: 32),
      ),
      const SizedBox(height: 10),
      if (showMeaning)
        Text(
          word.meaning,
          style: const TextStyle(fontSize: 30, color: Color.fromARGB(255, 221, 31, 31)),
        )
      else
        const Text(
          "Δες τη λύση",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
    ],
  ),
),
            const SizedBox(height: 50), 
            ElevatedButton(
              onPressed: nextWord,
              child: const Text("Επόμενη"),
            ),
          ],
        ),
      ),
    );
  }
}
