import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shoping_app/shoping_app_ui/screens/home_screen.dart';

class ButtonNavBar extends StatefulWidget {
  const ButtonNavBar({super.key});

  @override
  State<ButtonNavBar> createState() => _ButtonNavBarState();
}

class _ButtonNavBarState extends State<ButtonNavBar> {
  int selectedIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page=[
      HomePage(),
      navBarPage(Icons.favorite),
      navBarPage(Icons.shopping_cart),
      navBarPage(Icons.person),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: GNav(
             padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10), // 15 side padding, 20 bottom,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,),
              color: Colors.white,
              activeColor: Colors.black,
              gap: 6,
              tabBackgroundGradient: LinearGradient(colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 176, 210, 238)
              ]),
              tabShadow: [BoxShadow(
                color: Colors.black,
                blurRadius: 7
              )],
              onTabChange: (index){
               setState(() {
                 selectedIndex = index;
               });
              },
              tabs: [
            GButton(icon: Icons.home, text: 'Home',),
            GButton(icon: Icons.favorite, text: 'Favorite',),
            GButton(icon: Icons.shopping_cart, text: 'Shoping',),
            GButton(icon: Icons.person, text: 'Profile',),
          ]),
        ),
      ),body: page[selectedIndex],
    );
  }
  navBarPage(iconName){
    return Center(child: Icon(iconName, size: 100, color:Colors.black,));
  }
}
