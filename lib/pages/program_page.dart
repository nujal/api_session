import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:jokes_api/api_calling.dart';
import 'package:jokes_api/pages/models/program_model.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({Key? key}) : super(key: key);

  static const routeName = '/program-page';

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  ProgrammingJokeModel? model;
  bool isLoaded = false;

  @override
  void didChangeDependencies() async {
    Response? response =
        await ApiCall().getData('https://v2.jokeapi.dev/joke/Programming');
    setState(() {
      model = ProgrammingJokeModel.fromJson(ApiCall().decodeJson(response!)!);
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
        title: const Text('Programming joke'),
        centerTitle: true,
      ),
      body: !isLoaded
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(model!.setup.toString(),
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(model!.delivery.toString(),
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
    );
  }
}
