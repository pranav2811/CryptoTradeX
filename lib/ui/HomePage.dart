import 'package:cryptotradex/ui/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[Watchlist()];
  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_border),
                label: 'Watchlist',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.suitcase),
                label: 'Portfolio',
                backgroundColor: Colors.blue,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
                backgroundColor: Colors.blue,
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: onItemTapped,
          ),
          body: Container(
            color: const Color(0xFFEEEEEE),
            child: Column(children: <Widget>[
              Expanded(child: _widgetOptions.elementAt(_selectedIndex)),
            ]),
          )),
    );
  }
}
