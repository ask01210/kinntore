import 'package:flutter/material.dart';
import 'second.dart';
import 'histry.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  }

  class _HomePageState extends State<HomePage>{

    int selectedIndex = 0;

    final pages = [
      const ExerciseListPage(),
      const HistoryPage(),
    ];

    @override
    Widget build(BuildContext context){
      return Scaffold(

        body: pages[selectedIndex],

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,

          onTap: (index){
            setState(() {
              selectedIndex = index;
            });
          },

          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center),
              label: '種目一覧'
              ),

              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: '記録'
                ),
          ],
        ),
      );
    }
  }
