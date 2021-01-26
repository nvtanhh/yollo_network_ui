import 'package:flutter/material.dart';
import 'package:yollo_behance/ui/chat_screen.dart';
import 'package:yollo_behance/ui/discovery_screens.dart';
import 'package:yollo_behance/ui/profile_screen.dart';
import 'package:yollo_behance/ui/timeline_screen.dart';
import 'package:yollo_behance/ui/wallet_screen.dart';

class MyNavigator extends StatefulWidget {
  @override
  _MyNavigatorState createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator>
    with SingleTickerProviderStateMixin {
  // final autoSizeGroup = AutoSizeGroup();
  var _bottomNavIndex = 0; //default index of first screen

  final icons = <IconData>[
    Icons.home,
    Icons.disc_full,
    Icons.chat,
    Icons.wallet_giftcard_sharp,
    Icons.person,
  ];

  final bodies = <Widget>[
    TimeLineScreen(),
    DiscoveryScreen(),
    ChatScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> navItems;

  @override
  void initState() {
    super.initState();

    navItems = [
      BottomNavigationBarItem(icon: Icon(icons[0]), label: ''),
      BottomNavigationBarItem(icon: Icon(icons[1]), label: ''),
      BottomNavigationBarItem(icon: Icon(icons[2]), label: ''),
      BottomNavigationBarItem(icon: Icon(icons[3]), label: ''),
      BottomNavigationBarItem(icon: Icon(icons[4]), label: ''),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _bottomNavIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.black87),
          unselectedIconTheme: IconThemeData(color: Colors.black26),
          items: navItems,
          onTap: (value) {
            setState(() {
              _bottomNavIndex = value;
            });
          },
        ),
        body: bodies[_bottomNavIndex]);
  }
}
