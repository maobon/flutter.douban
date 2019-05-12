import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'MoviesData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: ContentListView(),
    );
  }
}

class ContentListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContentListViewState(['item_1', 'item_2']);
  }
}

class _ContentListViewState extends State<ContentListView> {
  List<String> _data = [];

  _ContentListViewState(this._data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter ListView'),
      ),
      body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int position) {
            return ListTile(
                title: Text(_data[position]),
                onTap: () {
                  print('hahhaha');
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _requestServer,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _requestServer() async {
    var url = "https://api.douban.com/v2/movie/in_theaters";

    var response = await http.get(url);

    if (response.statusCode == 200) {
      String decode = response.body;

      Map<String, dynamic> map = json.decode(decode);
      MoviesData data = MoviesData.fromJson(map);
      data.subjects.forEach((subject) {
        print('title is ${subject.title}');
      });
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }
}
