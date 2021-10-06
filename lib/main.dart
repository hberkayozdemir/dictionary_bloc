//@ dart=2.9
import 'package:dictionary_app_bloc/bussinies_logic/cubits/dictionary_cubit.dart';
import 'package:dictionary_app_bloc/data/repository/word_repo.dart';
import 'package:dictionary_app_bloc/presentation/pages/home/home_page.dart';
import 'package:dictionary_app_bloc/presentation/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        child: HomePage(),
        create: (context) => DictionaryCubit(WordRepository()),
      ),
    );
  }
}
