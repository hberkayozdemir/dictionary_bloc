import 'package:flutter/material.dart';

Widget getDict(context) {
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
          onTap: () {},
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
