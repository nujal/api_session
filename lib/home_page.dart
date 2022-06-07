import 'package:flutter/material.dart';
import 'package:jokes_api/assetPath.dart';
import 'package:jokes_api/drawer.dart';
import 'package:jokes_api/pages/music_page.dart';
import 'package:jokes_api/pages/program_page.dart';
import 'package:jokes_api/pages/models/pages_model.dart';
import 'package:jokes_api/pages/pun_page.dart';
import 'package:jokes_api/pages/spooky_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home-screen';

  final List<PageModel> pages = [
    PageModel(
        namePath: NameClass.firstname.toString(),
        imagePath: AssetPath.programming,
        navigationPath: ProgramPage.routeName),
    PageModel(
        namePath: NameClass.secondname.toString(),
        imagePath: AssetPath.musically,
        navigationPath: MusicPage.routeName),
    PageModel(
        namePath: NameClass.thirdname.toString(),
        imagePath: AssetPath.punny,
        navigationPath: PunPage.routeName),
    PageModel(
        namePath: NameClass.fourthname.toString(),
        imagePath: AssetPath.spoooky,
        navigationPath: SpookyPage.routeName),
  ];

  // final List<Image> images = [
  //   Image.asset('),
  //   Image.asset('assets/images/music.jpeg'),
  //   Image.asset('assets/images/pun.jpeg'),
  //   Image.asset('assets/images/spooky.jpeg'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      // drawer: const Drawer(),

      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text('Jokes API'),
        centerTitle: true,
        backgroundColor: Colors.purple[900],
      ),
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: pages.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 12.0,
          ),
          itemBuilder: (context, i) {
            return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(pages[i].navigationPath);
                  //routes use garepaxi pushNamed use garna parxa natra muniko
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Programming()));
                },
                child: Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.all(18),
                    child: Column(
                      children: [
                        Image.asset(
                          pages[i].imagePath,
                          height: 108,
                          width: 108,
                        ),
                        Text(pages[i].namePath),
                      ],
                    )));
          },
        ),
      ),
    );
  }
}
