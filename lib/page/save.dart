import 'package:flutter/material.dart';
import '../widgets/day.dart';
import '../models/record.dart';
import '../data/record_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../widgets/weight_input.dart';
import '../widgets/number_selector.dart';
import '../widgets/save_buttons.dart';

class RecordPage extends StatefulWidget {
  final String exerciseName;
  final DateTime selectedDate;

  const RecordPage({
    super.key,
    required this.exerciseName,
    required this.selectedDate,
  });

  @override
  State<RecordPage> createState() => _RecordPageState();
}
class _RecordPageState extends State<RecordPage> {
  late TextEditingController weightController;
  late DateTime selectedDate;
  

  int count = 10;
  int setNum = 3;

@override
void initState() {
  super.initState();

  selectedDate = widget.selectedDate;

  weightController = TextEditingController(
    text: '60',
  );
}

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

void saveRecord() {

  RecordRepository.records.add(
    WorkoutRecord(
      date: selectedDate,
      exerciseName: widget.exerciseName,
      weight: double.parse(weightController.text),
      count: count,
      setNum: setNum,
    ),
  );
  //画面に記録したと表示
  // Fluttertoast.showToast( //chromeだと表示されんかった
  //   msg: "記録しました",
  //   toastLength: Toast.LENGTH_SHORT,
  //   gravity:ToastGravity.CENTER,
  // );
//   ScaffoldMessenger.of(context).showSnackBar(
//   const SnackBar(
//     content: Center(
//       child: Text('記録しました'),
//     ),
//     behavior: SnackBarBehavior.floating,
//     duration: Duration(seconds: 2),
//   ),
// );
//   print("押されたよ");
  showDialog(
    context: context,
    barrierDismissible: false,
     builder: (context){
      return const AlertDialog(
        content: Text('記録しました'),
      );
     },
    );
    Future.delayed(
      const Duration(seconds: 1),
      (){
        Navigator.of(context).pop();
      },
    );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('記録'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DateSelector(
            selectedDate: selectedDate,

            onDateChanged: (newDate) {
              setState(() {
                selectedDate = newDate;
              });
            },
          ),


            Text(
              widget.exerciseName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // 重量入力
            WeightInput(controller: weightController),

            const SizedBox(height: 20),

            // 回数
            NumberSelector(
              value: count,
              label: '回',
              onMinus: (){
                setState(() {
                  if (count > 1) count--;
                });
              },
              onPlus: (){
                setState(() {
                  count++;
                });
              }),

            const SizedBox(height: 20),

            //セット
            NumberSelector(
              value: setNum,
              label: 'セット',
              onMinus: (){
                setState(() {
                  if (setNum > 1) setNum--;
                });
              },
              onPlus: (){
                setState(() {
                  setNum++;
                });
              }),              


            const SizedBox(height: 40),

            SaveButtons(
              onSave: saveRecord,
            ),
          ],
        ),
      ),
    );
  }
}