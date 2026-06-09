import 'package:flutter/material.dart';
import '../data/record_repository.dart';
import '../models/record.dart';
import '../utils/delete.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {

    final Map<String, List<WorkoutRecord>> groupedRecords = {};

    for (final record in RecordRepository.records) {//日付ごとに変更

      final key =
          '${record.date.year}/'
          '${record.date.month}/'
          '${record.date.day}';

      groupedRecords.putIfAbsent(
        key,
        () => [],
      );

      groupedRecords[key]!.add(record);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('記録一覧'),
      ),

      body: ListView(
        children: groupedRecords.entries.map((entry) {

          final Map<String, List<WorkoutRecord>> exerciseGroups = {};

          for(final record in entry.value){
            exerciseGroups.putIfAbsent(
              record.exerciseName,
              () => [],
        );

            exerciseGroups[record.exerciseName]!.add(record);
          }

          return Card(
            child: ExpansionTile(



              title: Text(entry.key),
              

              children: exerciseGroups.entries.map((exerciseEntry) {

                return ExpansionTile(

                  title: Text(
                    exerciseEntry.key,
                  ),
                  trailing: IconButton(
                        icon: const Icon(Icons.delete),

                        onPressed: () async {
                          final result = await showDeleteDialog(context);

                          if (result) {
                            setState(() {
                              RecordRepository.records.removeWhere(
                                (r) =>
                                    r.exerciseName == exerciseEntry.key &&
                                    r.date.year == entry.value.first.date.year &&
                                    r.date.month == entry.value.first.date.month &&
                                    r.date.day == entry.value.first.date.day,
                              );
                            });
                          }
                        },
                        ),

                  children: exerciseEntry.value.map((record) {

                    return ListTile(
                      title: Text(
                        '${record.weight}kg '
                        '${record.count}回 '
                        '${record.setNum}セット',
                      ),

/*
TODO画面を押したときに編集画面に移行するようにする。
それと編集画面をsave.dartを活用してコードを減らす。

                      onTap(){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => EditRecordPage(
                              record: record,
                            ),
                          ),
                        ).then((_){
                          setState(() {
                            
                          });
                        })
                      },
*/

                      trailing: IconButton(
                        icon: const Icon(Icons.delete),

                        onPressed: () async {

                          final result = await showDeleteDialog(context);

                          if (result == true){
                            setState(() {
                            RecordRepository.records.remove(record);
                            });
                          }
                          
                        },
                        ),
                    );

                  }).toList(),
                );

              }).toList(),
            ),
          );

        }).toList(),
      ),
    );
  }
}