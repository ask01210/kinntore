
import 'dart:nativewrappers/_internal/vm/lib/ffi_native_type_patch.dart';

import 'package:flutter/material.dart';

import '../widgets/day.dart';
import '../widgets/weight_input.dart';
import '../widgets/number_selector.dart';
import '../widgets/save_buttons.dart';

class Edit extends StatefulWidget{
  String  day;
  final String name;
  int weight;
  int count;
  int set;

  const Edit({
    super.key,
    required this.day,
    required this.name,
    required this.weight,
    required this.count,
    required this.set,
  });

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('編集'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DateSelector(//日付選択
              selectedDate: day, 
              onDateChanged: (newdate){
                setState(() {
                  day = newdate;
                });
              },
              ),
              
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(height: 30),

              WeightInput(controller: controller),//重量選択

              const SizedBox(height: 28),

              NumberSelector(//回数選択
                value: value, 
                label: label, 
                onPlus: (){
                  setState(() {
                    count++;
                  });
                }, 
                onMinus: (){
                  if(count > 1){
                    count--;
                  };
                }),

                NumberSelector(//セット選択
                  value: value,
                  label: label,
                  onPlus: (){
                    setState(() {
                      set++;
                    });
                  },
                  onMinus: (){
                    if(set > 1){
                      set--;
                    };
                  }),



          ],
        )
      ),
    );
  }
}