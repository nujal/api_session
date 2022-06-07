import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jokes_api/api_calling.dart';
import 'package:jokes_api/pages/models/spooky_model.dart';

class SpookyPage extends StatefulWidget {
  const SpookyPage({Key? key}) : super(key: key);

  static const routeName = '/spooky-page';

  @override
  State<SpookyPage> createState() => _SpookyPageState();
}

class _SpookyPageState extends State<SpookyPage> {
  SpookyJokeModel? spooky;
  bool isloaded = false;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    Response? response =
        await ApiCall().getData('https://v2.jokeapi.dev/joke/Spooky');

    setState(() {
      spooky = SpookyJokeModel.fromJson(ApiCall().decodeJson(response!)!);
      isloaded = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],

        // automaticallyImplyLeading: false,
        title: Text('Spooky jokes'),
        centerTitle: true,
      ),
      body: !isloaded
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(spooky!.setup.toString(),
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(spooky!.delivery.toString(),
                      maxLines: 2,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
    );
  }
}
