import 'package:flutter/material.dart';

class SaveButtons extends StatelessWidget{
  final VoidCallback onSave;

 const SaveButtons({
  super.key,
  required this.onSave,
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
          child: const Text('保存'),
        ),

      ],
    );
  }
}