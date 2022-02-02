// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

// import 'package:brewapp/Screens/Home/profile.dart';
// import 'package:brewapp/Screens/Home/setting.dart';
import 'package:brewapp/Screens/Services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final List<Widget> _options = [
  //   Home(),
  //   Profile(),
  //   Settings(),
  // ];
  int _selectedIndex = 0;

  final AuthService _auth = AuthService();
  _onItemtap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffe6fffa),
        appBar: AppBar(
          title: const Text('Home Manager'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: const Icon(Icons.home),
          actions: [
            TextButton.icon(
              onPressed: () async {
                await _auth.SignOut();
              },
              icon: Icon(Icons.logout),
              label: Text('Logout'),
            ),
          ],
        ),
        body: Column(
          children: [
            // _options[_selectedIndex],
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(18),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: Icon(Icons.emoji_objects,
                        size: 50, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Icon(Icons.monetization_on,
                      size: 50, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width / 2.3,
                    child:
                        Icon(Icons.electric_car, size: 50, color: Colors.white),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 5,
                  width: MediaQuery.of(context).size.width / 2.3,
                  child: Icon(Icons.chat, size: 50, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemtap,
        ));
  }
}
