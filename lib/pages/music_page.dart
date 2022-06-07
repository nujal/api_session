import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jokes_api/api_calling.dart';
import 'package:jokes_api/pages/models/music_model.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  static const routeName = '/music-page';

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  MusicJokeModel? music;
  bool isLoaded = false;

  @override
  void didChangeDependencies() async {
    Response? response =
        await ApiCall().getData('https://v2.jokeapi.dev/joke/Miscellaneous');
    setState(() {
      music = MusicJokeModel.fromJson(ApiCall().decodeJson(response!)!);
      isLoaded = true;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        // automaticallyImplyLeading: false,
        title: const Text('Music Joke'),
        centerTitle: true,
      ),
      body: !isLoaded
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    music!.setup.toString(),
                    maxLines: 2,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    music!.delivery.toString(),
                    maxLines: 2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
    );
  }
}
