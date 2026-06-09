import 'package:flutter/material.dart';

  Future<bool> showDeleteDialog(BuildContext context) async{

      final result = await showDialog<bool>(
      context: context,
        builder: (context){
        return AlertDialog(
          title: const Text('確認'),
          content: const Text('この記録を削除しますか？'),

          actions: [
            TextButton(
            onPressed: (){
              Navigator.pop(context,false);
            },
              child: const Text('キャンセル'),
              ),

              TextButton(
              onPressed: (){
                Navigator.pop(context, true);
              } ,
              child: const Text('削除'),
              ),
              ],
        );
        },
        );
    return result ?? false;
  }
