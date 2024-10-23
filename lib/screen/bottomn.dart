import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:securent/onbording/color.dart';
import 'package:securent/screen/favourite.dart';
import 'package:securent/screen/home.dart';
import 'package:securent/screen/message.dart';
import 'package:securent/screen/profile.dart';

class Bottomn extends StatefulWidget {
  const Bottomn({super.key});

  @override
  State<Bottomn> createState() => _BottomnState();
}

class _BottomnState extends State<Bottomn> {
  int myIndex = 0;
  List<Widget> widgetList = [Home(), Favourite(), Message(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedFontSize: 15,
        selectedFontSize: 16,

        selectedIconTheme: IconThemeData(color: primaryColor),

        selectedLabelStyle: TextStyle(color: primaryColor),
        // selectedItemColor: Colors.blue,
        // selectedIconTheme: IconThemeData(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {});
          myIndex = value;
        },
        currentIndex: myIndex,

        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: primaryColor,
            ),
            icon: Icon(
              IconlyLight.home,
              color: primaryColor,
            ),
            label: "Home",
            // backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.favorite,
              color: primaryColor,
            ),
            icon: Icon(
              Icons.favorite_border,
              color: primaryColor,
            ),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_outlined,
              color: primaryColor,
            ),
            activeIcon: Icon(Icons.message),
            label: "Message",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: primaryColor,
            ),
            activeIcon: Icon(Icons.person_2),
            label: "Profile",
          ),
        ],
      ),
      body: widgetList[myIndex],
    );
  }
}
