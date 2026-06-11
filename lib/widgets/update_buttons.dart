import 'package:flutter/material.dart';

class UpdateButtons extends StatelessWidget{
  const({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          child: Text('戻る')),

        ElevatedButton(
          onPressed: (){
            
          },
          child: Text('更新する')),
      ],
    )
  }
}