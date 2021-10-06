import 'package:dictionary_app_bloc/presentation/widgets/get_dictionary.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getDict(context),
      backgroundColor: Colors.blueGrey[900],
    );
  }
}
