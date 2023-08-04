import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_yt_channel_app/screens/about.dart';
import 'package:flutter_yt_channel_app/screens/home_screen.dart';
import 'package:flutter_yt_channel_app/screens/setting.dart';

import 'Home.dart';

class HomeViewScreen extends StatefulWidget {
  final selectedIndex;
  const HomeViewScreen({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<HomeViewScreen> createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  int _currentIndex = 0;
  @override
  void initState() {
    _currentIndex = widget.selectedIndex;
  }

  final List<Widget> _widgetOptions = <Widget>[
    About(),
    HomeScreen(),
    Home(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Alert'),
                content: const Text('Do you really want to exit'),
                actions: [
                  ElevatedButton(
                    child: const Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Yes'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          //elevation: 1,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              //backgroundColor: Colors.red,
              backgroundColor: Colors.amberAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow),
              label: 'youtube',

              // backgroundColor: Colors.green,
              backgroundColor: Colors.amberAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.web),
              label: 'website',
              // backgroundColor: Colors.purple,
              backgroundColor: Colors.amberAccent,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'about',
              // backgroundColor: Colors.pink,
              backgroundColor: Colors.amberAccent,
            ),
          ],
          currentIndex: _currentIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}
