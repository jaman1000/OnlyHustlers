import 'dart:ui';
import 'dart:io';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:only_hustlers_app/services/stopwatch.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class Dashboard extends StatefulWidget {
  @override
  _Dashboard createState() => new _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  int timeNow = 0;
  int _itemCount = 0;
  int _itemCount1 = 0;
  int _itemCount2 = 0;
  int _clientTime = 0;
  String userImageUrl = '';
  File _imageFile;
  int _counter = 0;
  int _hours = 0;
  Timer _timer;
  Timer _timerHours;
  TextEditingController dailyGoalController = new TextEditingController();

  void _startTimer() {
    _counter = 0;
    if (_timer != null) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(minutes: 1), (timer) {
      setState(() {
        if (_counter < 200) {
          _counter++;
        }
      });
    });
  }

  void _startTimerHours() {
    _hours = 0;
    if (_timer != null) {
      _timer.cancel();
    }
    _timerHours = Timer.periodic(Duration(hours: 1), (timer) {
      if (_hours < 24) {
        _hours++;
      } else {
        _hours = 0;
      }
    });
  }

  void _endTimer() {
    _timer.cancel();
  }

  _imgFromGallery() async {
    final pickedImageFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImageFile != null) {
        _imageFile = File(pickedImageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future _imgFromCamera() async {
    final pickedImageFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImageFile != null) {
        _imageFile = File(pickedImageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime today = new DateTime(now.year, now.month, now.day);
    DateTime endDate = new DateTime(now.year, 8, 30);
    final daysLeft = endDate.difference(now).inDays;
    String _goal = dailyGoalController.text;

    Widget tyButton = ElevatedButton(
      child: Text("I Got This"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
        _startTimerHours();
      },
    );

    Widget ok = ElevatedButton(
      child: Text("Great!"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue,
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 15.0, bottom: 0),
          child: SizedBox.expand(
            child: Container(
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25.0)),
              child: Stack(
                children: <Widget>[
                  //Profile Overview
                  SizedBox(
                    height: 15,
                  ),
                  Positioned(
                    top: 8,
                    left: 70,
                    child: Text(
                      'That Boy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    top: 28,
                    left: 60,
                    child: Container(
                      height: 36,
                      width: 115,
                      decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        border: Border.all(
                          color: Colors.deepOrange,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          ' Date: ' + '$today',
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    left: 52,
                    child: Container(
                      height: 20,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '$daysLeft ' + 'days left of season',
                          style: TextStyle(color: Colors.white, fontSize: 11.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Positioned(
                    top: 75,
                    left: 35,
                    child: Container(
                        height: 20,
                        width: 65,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          shadowColor: Colors.blueAccent,
                          color: Colors.blueAccent,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: new Text('First Door'),
                                        content: Text('Good Luck Today!'),
                                        actions: [
                                          tyButton,
                                        ],
                                      ));
                            },
                            child: Center(
                              child: Text(
                                'First Door',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 5,
                    width: 10,
                  ),
                  Positioned(
                    top: 75,
                    left: 110,
                    child: Container(
                        alignment: Alignment(100, 10),
                        height: 20,
                        width: 65,
                        child: Material(
                          borderRadius: BorderRadius.circular(10.0),
                          shadowColor: Colors.deepOrange,
                          color: Colors.deepOrange,
                          elevation: 7.0,
                          child: GestureDetector(
                            onTap: () {
                              _endTimer();
                              showDialog(
                                  context: context,
                                  builder: (_) => AlertDialog(
                                        title: new Text(
                                            'Here is a recap of your day'),
                                        content: Text('\n'
                                                'Daily goal: ' +
                                            '$_goal' +
                                            '\n\n'
                                                'Sales made: ' +
                                            '$_itemCount' +
                                            '\n\n'
                                                'Doors knocked: ' +
                                            '$_itemCount1' +
                                            '\n\n'),
                                        actions: [ok],
                                      ));
                            },
                            child: Center(
                              child: Text(
                                'Last Door',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                        radius: 32,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          /* child: Image.file(
                            _imageFile,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ), */
                        )),
                  ),

                  // first row boxes
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            height: 80,
                            width: 90,
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepOrange,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // Daily Goals
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Daily Goal',
                                    style: TextStyle(
                                        wordSpacing: 3,
                                        color: Colors.blueAccent,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 3,
                                        decorationColor: Colors.deepOrange,
                                        fontSize: 14.0),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  height: 45,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: TextField(
                                        controller: dailyGoalController,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20),
                                            hintText: '0'),
                                      )),
                                )
                              ],
                            )),
                        SizedBox(width: 15),
                        // Sales Made
                        Container(
                          height: 80,
                          width: 90,
                          padding: EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepOrange,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  'Sales Made',
                                  style: TextStyle(
                                      wordSpacing: 3,
                                      color: Colors.blueAccent,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 3,
                                      decorationColor: Colors.deepOrange,
                                      fontSize: 14.0),
                                ),
                              ),
                              Container(
                                width: 30,
                                height: 35,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text('$_itemCount',
                                      style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              // Buttons
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                        height: 15,
                                        width: 35,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (_itemCount > 0) _itemCount--;
                                            });
                                          },
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            shadowColor: Colors.deepOrange,
                                            color: Colors.deepOrange,
                                            elevation: 7.0,
                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ),
                                          ),
                                        )),
                                    SizedBox(width: 5),
                                    Container(
                                        alignment: Alignment(100, 10),
                                        height: 15,
                                        width: 35,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _itemCount++;
                                            });
                                          },
                                          child: Material(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            shadowColor: Colors.blueAccent,
                                            color: Colors.blueAccent,
                                            elevation: 7.0,
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat'),
                                              ),
                                            ),
                                          ),
                                        )),
                                  ])
                            ],
                          ),
                        )
                      ]),
                  // SECOND ROW
                  Padding(
                    padding: EdgeInsets.only(top: 125, right: 0, left: 0),
                    child: Container(
                      height: 150,
                      width: 600,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.deepOrange),
                      ),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                  height: 120,
                                  width: 110,
                                  padding: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blueAccent,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  // Number of doors knocked
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          'Doors Knocked',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              wordSpacing: 3,
                                              letterSpacing: 1,
                                              color: Colors.black,
                                              decoration:
                                                  TextDecoration.underline,
                                              decorationThickness: 3,
                                              decorationColor: Colors.grey,
                                              fontSize: 12.0),
                                        ),
                                      ),
                                      Container(
                                        width: 35,
                                        height: 65,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            '$_itemCount1',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                        ),
                                      ),
                                      Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                                height: 20,
                                                width: 35,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (_itemCount1 > 0)
                                                        _itemCount1--;
                                                    });
                                                  },
                                                  child: Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    shadowColor:
                                                        Colors.deepOrange,
                                                    color: Colors.deepOrange,
                                                    elevation: 7.0,
                                                    child: Center(
                                                      child: Text(
                                                        '-',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Montserrat'),
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                            SizedBox(width: 5),
                                            Container(
                                                alignment: Alignment(100, 10),
                                                height: 20,
                                                width: 35,
                                                child: GestureDetector(
                                                  onTap: () => setState(
                                                      () => _itemCount1++),
                                                  child: Material(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                    shadowColor:
                                                        Colors.blueAccent,
                                                    color: Colors.blueAccent,
                                                    elevation: 7.0,
                                                    child: Center(
                                                      child: Text(
                                                        '+',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                'Montserrat'),
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ])
                                    ],
                                  )),
                            ),
                            SizedBox(width: 15),
                            // sales made part 2
                            Container(
                              height: 120,
                              width: 110,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Leads',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          wordSpacing: 3,
                                          letterSpacing: 1,
                                          color: Colors.black,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          decorationColor: Colors.grey,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    height: 50,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$_itemCount2',
                                        style: TextStyle(fontSize: 30),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            height: 20,
                                            width: 35,
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  if (_itemCount2 > 0)
                                                    _itemCount2--;
                                                });
                                              },
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                shadowColor: Colors.deepOrange,
                                                color: Colors.deepOrange,
                                                elevation: 7.0,
                                                child: Center(
                                                  child: Text(
                                                    '-',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        SizedBox(width: 5),
                                        Container(
                                            alignment: Alignment(100, 10),
                                            height: 20,
                                            width: 35,
                                            child: GestureDetector(
                                              onTap: () =>
                                                  setState(() => _itemCount2++),
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                shadowColor: Colors.blueAccent,
                                                color: Colors.blueAccent,
                                                elevation: 7.0,
                                                child: Center(
                                                  child: Text(
                                                    '+',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ])
                                ],
                              ),
                            ),
                            SizedBox(width: 15),
                            Container(
                              height: 120,
                              width: 110,
                              padding:
                                  EdgeInsets.only(right: 10, left: 10, top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Client Time',
                                      style: TextStyle(
                                          wordSpacing: 3,
                                          letterSpacing: 1,
                                          color: Colors.black,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          decorationColor: Colors.grey,
                                          fontSize: 12.0),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: 120,
                                    height: 50,
                                    child: Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '1)' +
                                            ' $_clientTime' +
                                            'm' +
                                            '\n' '2)' +
                                            ' $_clientTime' +
                                            'm' +
                                            '\n' '3)' +
                                            ' $_clientTime' +
                                            'm',
                                        textAlign: TextAlign.left,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Align(
                                          alignment:
                                              FractionalOffset.bottomCenter,
                                          child: Container(
                                              height: 20,
                                              width: 35,
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                shadowColor: Colors.deepOrange,
                                                color: Colors.deepOrange,
                                                elevation: 7.0,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Center(
                                                    child: Text(
                                                      'Start',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 11,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily:
                                                              'Montserrat'),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ),
                                        SizedBox(width: 5),
                                        Container(
                                            alignment: Alignment(100, 10),
                                            height: 20,
                                            width: 35,
                                            child: Material(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              shadowColor: Colors.blueAccent,
                                              color: Colors.blueAccent,
                                              elevation: 7.0,
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Center(
                                                  child: Text(
                                                    'Stop',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ])
                                ],
                              ),
                            ),
                          ]),
                    ),
                  ),
                  // Third Row
                  Row(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                height: 90,
                                width: 150,
                                padding: EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Text(
                                        'Affirmations',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            wordSpacing: 3,
                                            color: Colors.blueAccent,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationThickness: 3,
                                            decorationColor: Colors.deepOrange,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    Container(
                                        width: 130,
                                        height: 60,
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: TextField(
                                            textAlign: TextAlign.left,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: 3,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12),
                                                hintText:
                                                    ' 1) I love my job \n 2) I love to work hard \n 3) I love the grind'),
                                          ),
                                        )),
                                  ],
                                )),
                            SizedBox(height: 15),
                            Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Reminders/Feedback',
                                      style: TextStyle(
                                          wordSpacing: 3,
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          decorationColor: Colors.blueAccent,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 60,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: TextField(
                                        textAlign: TextAlign.left,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                            hintText:
                                                'I am not only doing this for myself, but for my team'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 15),
                            Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Inspirational Quote',
                                      style: TextStyle(
                                          wordSpacing: 3,
                                          color: Colors.deepOrange,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          decorationColor: Colors.deepOrange,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 45,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: TextField(
                                        textAlign: TextAlign.left,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                            hintText:
                                                'Quiters never win and winners never win'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'My Why',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          wordSpacing: 3,
                                          color: Colors.deepOrange,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          decorationColor: Colors.deepOrange,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 60,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: TextField(
                                        textAlign: TextAlign.left,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 12),
                                            hintText:
                                                ' 1) Car \n 2) Bills \n 3) Vacation'),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(height: 15),
                          Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      'Break',
                                      style: TextStyle(
                                          wordSpacing: 3,
                                          color: Colors.blueAccent,
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 3,
                                          decorationColor: Colors.blueAccent,
                                          fontSize: 14.0),
                                    ),
                                  ),
                                  Container(
                                    width: 130,
                                    height: 40,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$_counter ' + ' min',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                            height: 15,
                                            width: 35,
                                            child: GestureDetector(
                                              onTap: () {
                                                _endTimer();
                                              },
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                shadowColor: Colors.deepOrange,
                                                color: Colors.deepOrange,
                                                elevation: 7.0,
                                                child: Center(
                                                  child: Text(
                                                    'End',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ),
                                              ),
                                            )),
                                        SizedBox(width: 5),
                                        Container(
                                            alignment: Alignment(100, 10),
                                            height: 15,
                                            width: 35,
                                            child: GestureDetector(
                                              onTap: () {
                                                _startTimer();
                                              },
                                              child: Material(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                shadowColor: Colors.blueAccent,
                                                color: Colors.blueAccent,
                                                elevation: 7.0,
                                                child: Center(
                                                  child: Text(
                                                    'Begin',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Montserrat'),
                                                  ),
                                                ),
                                              ),
                                            )),
                                      ]),
                                ],
                              )),
                          SizedBox(height: 15),
                          Container(
                            height: 90,
                            width: 150,
                            padding: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    'Sales I Have Left',
                                    style: TextStyle(
                                        wordSpacing: 3,
                                        color: Colors.deepOrange,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 3,
                                        decorationColor: Colors.deepOrange,
                                        fontSize: 14.0),
                                  ),
                                ),
                                Container(
                                    width: 30,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: TextField(
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 30),
                                            hintText: '0'),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ])
                  ]),
                  Positioned(
                    top: 120.0,
                    left: 170.0,
                    child: Container(
                      width: 70,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 270.0,
                    left: 170.0,
                    child: Container(
                      width: 80,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: new CircleButton(
                        onTap: () => print("Cool"), iconData: Icons.timer),
                    top: 265.0,
                    left: 240.0,
                    width: 20,
                    height: 20,
                  ),
                  Positioned(
                    child: new CircleButton(
                        onTap: () => print("Cool"), iconData: Icons.timer),
                    top: 115.0,
                    left: 150.0,
                    width: 20,
                    height: 20,
                  ),
                  Positioned(
                    top: 0.0,
                    left: 185.0,
                    child: Container(
                      width: 5,
                      height: 80,
                      color: Colors.blue,
                    ),
                  ),
                  Positioned(
                    top: 30.0,
                    left: 180.0,
                    height: 25,
                    width: 15,
                    child: InkResponse(
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.deepOrange,
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.blueAccent, width: 3)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ButtonTheme(
              minWidth: 100,
              height: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  'Hours Worked: ' + '$_hours',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
            SizedBox(width: 50),
            ButtonTheme(
              minWidth: 100,
              height: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ),
          ]),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
