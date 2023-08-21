// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:listview/PAGES/HOMEPAGE.dart';

import '../PAGES/COUNTER.dart';
import '../PAGES/MY PROFILE.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  void getPage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Widget> screens = [
    const Homepage(),
    Counter(),
    const Profile(),
  ];

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
     
       bottomSheet:  Container(
        decoration: BoxDecoration(  
          borderRadius: BorderRadius.circular(30),
          color: Colors.blueGrey
          ),
          margin: EdgeInsets.symmetric(horizontal:25,vertical: 15 ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0 ,
          currentIndex: currentIndex,
          onTap: (index) {
            getPage(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: 'counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'profile',
            )
          ],
        ),
      ),
      
     
    );
  }
}
