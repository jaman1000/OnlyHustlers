import 'package:flutter/material.dart';

class Goals extends StatefulWidget {  
  @override
  _Goals createState() => new _Goals();
}

class _Goals extends State<Goals> {
    @override
    Widget build(BuildContext context){
      return new Scaffold(
        resizeToAvoidBottomInset: false,
        body: ListView(
          children:<Widget> [
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 110.0, 0, 0),
                    child: Text(
                      'Tell Us About',
                      style: TextStyle(
                        fontSize: 50.0, fontWeight: FontWeight.bold)
                    ),
                    ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 175.0, 0, 0),
                    child: Text(
                      'Yourself',
                      style: TextStyle(
                        fontSize: 50.0, fontWeight: FontWeight.bold)
                    ),
                    )
                  ]
              )
              ),
                  Container(
                    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'What is Your Occupation?',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                            )
                          )
                        ),
                        SizedBox(height: 20.0),
                         TextField(
                          decoration: InputDecoration(
                            labelText: 'What is Your Goal? (EX: Become 1st in sales)',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                            )
                          ),
                        ),
                       SizedBox(height: 20.0),
                         TextField(
                          decoration: InputDecoration(
                            labelText: 'What Motivates You? (EX: Family, Success, Friends)',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                            )
                          ),
                        ),
                         SizedBox(height: 20.0),
                         TextField(
                          decoration: InputDecoration(
                            labelText: 'What Quote do You Live by?',
                            labelStyle: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green)
                            )
                          ),
                        ),
                            SizedBox(height: 40.0),
                            Container(
                              height:40.0, 
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.greenAccent,
                                color: Colors.green,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                            SizedBox(height:20.0),
                           Container(
                              height:40.0, 
                              child: Material(
                                borderRadius: BorderRadius.circular(20.0),
                                shadowColor: Colors.blueAccent,
                                color: Colors.blue,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'BACK',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                            SizedBox(height:30.0),
                            Container(
                              child:Text('Only Hustlers Hustle Only',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Montserrat' 
                              ))
                            )

                      ], 
                    )
                  )
        ],
        )
      );
    }
}