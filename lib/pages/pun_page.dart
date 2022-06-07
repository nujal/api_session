import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jokes_api/api_calling.dart';
import 'package:jokes_api/pages/models/pun_model.dart';

class PunPage extends StatefulWidget {
  const PunPage({Key? key}) : super(key: key);

  static const routeName = '/pun-page';

  @override
  State<PunPage> createState() => _PunPageState();
}

class _PunPageState extends State<PunPage> {
  PunJokeModel? pun;
  bool isloaded = false;

  @override
  void didChangeDependencies() async {
    Response? response =
        await ApiCall().getData('https://v2.jokeapi.dev/joke/Pun');
    setState(() {
      pun = PunJokeModel.fromJson(ApiCall().decodeJson(response!)!);
      isloaded = true;
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
        title: const Text('Puns'),
        centerTitle: true,
      ),
      body: !isloaded
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(pun!.setup.toString(),
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(pun!.delivery.toString(),
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
    );
  }
}
