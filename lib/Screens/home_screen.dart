import 'package:flutter/material.dart';
import 'package:hostel_management/Screens/HomeView/complain_screen.dart';
import 'package:hostel_management/Screens/HomeView/leave_screen.dart';
import 'package:hostel_management/Screens/HomeView/profile_screen.dart';
import 'package:hostel_management/Screens/HomeView/vote_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.blueGrey,
          textStyle: TextStyle(color: Colors.white)
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.run_circle),
        title: ("leave"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.blueGrey,
          textStyle: TextStyle(color: Colors.white)
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.note),
        title: ("complain"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.blueGrey,
        textStyle: TextStyle(color: Colors.white)
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.how_to_vote),
        title: ("vote"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.blueGrey,
          textStyle: TextStyle(color: Colors.white)
      ),
    ];
  }

  List<Widget> _buildScreen() {
    return [ProfileScreen(), LeaveScreen(), ComplainScreen(), VoteScreen()];
  }



  PersistentTabController _Tabcontroller =
  PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: _buildScreen(),
      controller: _Tabcontroller,
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style1,
    );
  }

}


