import 'package:flutter/material.dart';
import 'second.dart';
import '../widgets/Button.dart';
import '../widgets/Password.dart';
import '../widgets/User.dart';
import 'save.dart';
import 'home.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _TextFieldExampleState();
}


class _TextFieldExampleState extends State<First> {
  late TextEditingController _controller1;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

void _next()  {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HomePage()),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            User(controller: _controller1),

            const SizedBox(height: 20),

            Password(
              controller: _controller2
            ),

            const SizedBox(height: 20),
            
            Button(
              onPressed: _next,
            ),
          ],
        ),
      ),
    );
  }
}
