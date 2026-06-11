import 'package:flutter/material.dart';

class SaveButtons extends StatelessWidget{
  final VoidCallback onSave;
  final String text;

 const SaveButtons({
  super.key,
  required this.onSave,
  required this.text,
 });

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
          child: const Text('戻る'),
        ),

        ElevatedButton(
          onPressed: onSave, 
          child: Text(text),
        ),

      ],
    );
  }
}