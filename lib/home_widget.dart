import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';
import 'featured_widget.dart';
import 'placeholder_widget.dart';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    FeaturedContainer(),
    PlaceholderWidget(Colors.yellow),
    PlaceholderWidget(Colors.white),

  ];

  @override
  void initState() {
    super.initState();
    final QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) {
      if (shortcutType == 'action_decrement') {
        print('The user tapped on the "decrement" action.');
        main();
      } else {
        print('The user tapped on the "increment" action.');
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
          type: 'action_decrement', localizedTitle: 'decrement', icon: 'minus'),
      const ShortcutItem(
          type: 'action_increment', localizedTitle: 'increment', icon: 'plus')
    ]);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter App'),
      ),
      body: _children[_currentIndex], // new, // new
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            title: Text('Stores'),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}