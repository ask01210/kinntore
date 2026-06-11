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

  final WorkoutRecord? record;

  const RecordPage({
    super.key,
    required this.exerciseName,
    required this.selectedDate,
    this.record,
  });

  @override
  State<RecordPage> createState() => _RecordPageState();
}
class _RecordPageState extends State<RecordPage> {
  late TextEditingController weightController;
  late DateTime selectedDate;
  

  late int count;
  late int setNum;

@override
void initState() {
  super.initState();

selectedDate = widget.selectedDate;

  if(widget.record != null){
    weightController = TextEditingController(
      text: widget.record!.weight.toString(),
    );

    count = widget.record!.count;
    setNum = widget.record!.setNum;
  }

  //新規作成モード
  else {
    weightController = TextEditingController(
      text: '',
    );

    count = 10;
    setNum = 3;
  }
}

  @override
  void dispose() {
    weightController.dispose();
    super.dispose();
  }

void saveRecord() {

  final weight = double.tryParse(weightController.text);

  if(weight == null || weight <= 0){
    showDialog(
      context: context,
      builder: (_) => const AlertDialog(
        content: Text('正しい重量を入力してください'),
      ),
    );

    Future.delayed(
      const Duration(milliseconds: 500),
      (){
        Navigator.of(context).pop();
      },
    );

    return;
  }

  final isEditMode = widget.record != null;

  //編集
  if(isEditMode){

    widget.record!.date = selectedDate;
    widget.record!.weight = weight;
    widget.record!.count = count;
    widget.record!.setNum = setNum;
  }

  //新規作成
  else{

    RecordRepository.records.add(
      WorkoutRecord(
        date: selectedDate,
        exerciseName: widget.exerciseName,
        weight: weight,
        count: count,
        setNum: setNum,
      ),
    );
  }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context){
        return AlertDialog(
          content: Text(
            isEditMode
              ?'更新しました' : '記録しました'
          ),
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

  @override
  Widget build(BuildContext context) {

    final isEditMode = widget.record != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditMode ? '記録編集' : '記録',
        ),
      ),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            DateSelector(
              selectedDate: selectedDate,
              
               onDateChanged: (newDate){
                setState(() {
                  selectedDate = newDate;
                });
               },
            ),

            const SizedBox(height: 20),

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
              text: isEditMode ? '更新' : '保存',
              onSave: saveRecord,
            ),
          ],
        ),
      ),
    );
  }
}