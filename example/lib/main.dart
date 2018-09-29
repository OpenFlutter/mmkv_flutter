import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:mmkv_flutter/mmkv_flutter.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  _incrementCounter() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    int counter = await mmkv.getInt('intKey') + 1;
    print('GetSetIntTest is $counter ');
    await mmkv.setInt('intKey', counter);
  }

  _incrementString() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    String stringtest = await mmkv.getString('stringKey') + '1';
    print('GetSetStringTest is $stringtest');
    await mmkv.setString('stringKey', stringtest);
  }

  _setBool() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    mmkv.setBool('boolKey', true);
  }

  _getBool() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    print('get bool value is ${await mmkv.getBool('boolKey')}');
  }

  _clear() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    await mmkv.clear();
  }

  _setNullTest() async {
    MmkvFlutter mmkv = await MmkvFlutter.getInstance();
    await mmkv.setString('boolKey', null);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Column(
          children: <Widget>[
            new RaisedButton(
              onPressed: _incrementCounter,
              child: new Text('GetSetIntTest'),
            ),
            new RaisedButton(
              onPressed: _incrementString,
              child: new Text('GetSetStringTest'),
            ),
            new RaisedButton(
              onPressed: _clear,
              child: new Text('clear'),
            ),
            new RaisedButton(
              onPressed: _getBool,
              child: new Text('GetBoolTest'),
            ),
            new RaisedButton(
              onPressed: _setBool,
              child: new Text('SetBoolTest'),
            ),
            new RaisedButton(
              onPressed: _setNullTest,
              child: new Text('SetNullTest'),
            )
          ],
        ),
      ),
    );
  }
}
