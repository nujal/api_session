import 'package:flutter/material.dart';
import 'package:jokes_api/pages/music_page.dart';
import 'package:jokes_api/pages/program_page.dart';
import 'package:jokes_api/pages/pun_page.dart';
import 'package:jokes_api/pages/spooky_page.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270,
      backgroundColor: Colors.purple[200],
      elevation: 5.0,
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.purple[600],
            ),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.purple[400],
              ),
              accountName: Text(
                'Nujal Acharya',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text('nujalacharya@gmail.com'),
              currentAccountPictureSize: Size.square(50),
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  'assets/images/harry.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text(
              'programming',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ProgramPage()));
            },
          ),
          ListTile(
            title: Text(
              'music',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MusicPage()));
            },
          ),
          ListTile(
            title: Text(
              'punny',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PunPage()));
            },
          ),
          ListTile(
            title: Text(
              'spooky',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 18.0),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SpookyPage()));
            },
          ),
        ],
      ),
    );
  }
}
