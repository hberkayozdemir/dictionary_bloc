import 'package:dictionary_app_bloc/bussinies_logic/cubits/dictionary_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget getDict(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Dictionary App",
            style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 34,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Search any word you want quickly",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            controller: cubit.queryController,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: "Search a word",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide(color: Colors.transparent),
                )),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              cubit.getWordSearched();
            },
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      //rgb(245,147,26)
                      Color.fromRGBO(245, 147, 26, 1.0),
                      Color.fromRGBO(250, 100, 70, 1.0)
                    ]),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    SizedBox(width: 30, height: 30),
                    Text('Search Word',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  getLoadingWidget() {
    return Center(child: CircularProgressIndicator());
  }

  getErrorWidget(message) {
    return Text(message);
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DictionaryCubit>();

    return Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: cubit.state is WordSearchingState
            ? getLoadingWidget()
            : cubit.state is ErrorState
                ? getErrorWidget("Some error")
                : cubit.state is NoWordSearchedState
                    ? getDict(context)
                    : Container());
  }
}
