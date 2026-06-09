import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/save.dart';
import '../widgets/day.dart';

class ExerciseListPage extends StatefulWidget {
  const ExerciseListPage({super.key});

  @override
  State<ExerciseListPage> createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    final Map<String, List<String>> exercises = {
      '胸': [
        'ベンチプレス',
        'バーベルプレス',
        'ダンベルフライ',
      ],
      '肩': [
        'ショルダープレス',
        'サイドレイズ',
      ],
      '背中': [
        'ラットプルダウン',
        'デッドリフト',
      ],
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('種目一覧'),
      ),
      body: Column(
        children: [
          DateSelector(
            selectedDate: selectedDate,

            onDateChanged: (newDate) {
              setState(() {
                selectedDate = newDate;
              });
            },
          ),

          Expanded(
            child: ListView(
              children: exercises.entries.map((entry) {
                return ExpansionTile(
                  title: Text(
                    entry.key,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  children: entry.value.map((exercise) {
                    return ListTile(
                      title: Text(exercise),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecordPage(
                              exerciseName: exercise,
                              selectedDate: selectedDate,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}