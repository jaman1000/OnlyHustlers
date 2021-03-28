import 'dart:ui';

import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {  
  @override
  _Dashboard createState() => new _Dashboard();
}

class _Dashboard extends State<Dashboard> {
    @override
    Widget build(BuildContext context){
      return new Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue,
        body: Container(
        child:Padding(
        padding: EdgeInsets.only(top:10.0, bottom: 35.0),
          child: SizedBox.expand(
        child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25.0)
          ),
          child: Stack(
            children: <Widget>[
              //Profile Overview
              SizedBox(
                height: 15,),
                Positioned(
                  top: 8,
                  left: 70,
                  child: Text('That Boy',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,

                  ),
                ),
                Positioned(
                  top: 28,
                  left: 60,
                  child:Container(
                  height: 20,
                  width: 115,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    border: Border.all(
                      color: Colors.deepOrange,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text('Date: 03/27/2021',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0),
                    ),
                    ),
                  ),
                ),
                Positioned(
                  top:48,
                  left:52,
                  child:
                   Container(
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
                    child: Text('0 days left of season',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11.0),
                    ),
                    ),
                  ),
                ),
                  SizedBox(
                    height:5
                  ),
                  Positioned(
                    top: 70,
                    left: 35,
                    child:
                      Container(
                        height: 20,
                        width: 65,
                        child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                shadowColor: Colors.blueAccent,
                                color: Colors.blueAccent,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'First Door',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'
                                      ),
                                    ),
                                  ),
                                ),
                              )
                      ),
                  ),
                      SizedBox(height: 5,
                      width: 10,),
                      Positioned(
                        top: 70,
                        left: 110,
                        child:
                      Container(
                        alignment: Alignment(100,10),
                        height: 20,
                        width: 65,
                        child: Material(
                                borderRadius: BorderRadius.circular(10.0),
                                shadowColor: Colors.deepOrange,
                                color: Colors.deepOrange,
                                elevation: 7.0,
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Center(
                                    child: Text(
                                      'Last Door',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Montserrat'
                                      ),
                                    ),
                                  ),
                                ),
                              )
                      ),
                      ),
                      Positioned(child:
                      new Container(
                        width: 65.0, 
                        height: 65.0, 
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle, 
                          border: Border.all(
                            width: 3.5,
                            color: Colors.blueAccent
                            ),
                          image: new DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage ('https://i.imgur.com/BoN9kdC.png')
                          )
                        )
                        ),
                        ),
                        // first row boxes
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:[
                           Container(
                              height: 90,
                              width: 90,
                              padding: EdgeInsets.only(top:10),
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
                                  alignment:Alignment.topCenter,
                                child: Text('Daily Goal',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0),
                                ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 45,
                                  child: Align(
                                    alignment:Alignment.center,
                                  child: TextField(
                                     decoration: new InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.white, width: 0.0),
                                      )
                                      ),
                                    keyboardType: TextInputType.number,
                                  ),
                                )
                                  )
                                 ],
                                )
                            ),
                        SizedBox(
                          width:15
                        ),
                        // Sales Made
                        Container(
                              height: 90,
                              width: 90,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Sales Made',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0
                                  ),
                                  ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 35,
                                  child: Align(
                                    alignment:Alignment.center,
                                    child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                  ),
                                 // Buttons
                                 Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: Colors.deepOrange,
                                    color: Colors.deepOrange,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                          SizedBox(
                            width:5
                            ),
                           Container(
                                    alignment: Alignment(100,10),
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: Colors.blueAccent,
                                    color: Colors.blueAccent,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                          ]
                                )
                                 ],
                                ),

                              )
                          ]),
                          // SECOND ROW 
                        Padding(padding: EdgeInsets.only(bottom:190 ,right:20 ,left: 20),
                          child:Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                          Align(alignment: Alignment.center,
                          child:Container(
                              height: 120,
                              width: 110,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              // Number of doors knocked 
                               child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Number of Doors Knocked',
                                textAlign: TextAlign.center,
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0),
                                ),
                                  ),
                                  Container(
                                    width: 35,
                                  child: Align(
                                    alignment:Alignment.center,
                                   child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                )
                                  ),
                                 Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: Colors.deepOrange,
                                    color: Colors.deepOrange,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                          SizedBox(
                            width:5
                            ),
                           Container(
                                    alignment: Alignment(100,10),
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: Colors.blueAccent,
                                    color: Colors.blueAccent,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                          
                          ]
                                )
                                 ],
                                )
                          ),
                          ),
                        SizedBox(
                          width:15
                        ),
                        // sales made part 2 
                        Container(
                              height: 120,
                              width: 100,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                 children: <Widget>[
                                   
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Sales Made',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0
                                  ),
                                  ),
                                  ),
                                  Container(
                                    width: 30,
                                  child: Align(
                                    alignment:Alignment.center,
                                    child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                  ),
                                 SizedBox(height:10),
                                 Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                  Container(
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: Colors.deepOrange,
                                    color: Colors.deepOrange,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                          SizedBox(
                            width:5
                            ),
                           Container(
                                    alignment: Alignment(100,10),
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
                                    shadowColor: Colors.blueAccent,
                                    color: Colors.blueAccent,
                                    elevation: 7.0,
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                          
                          ]
                                )
                                 ],
                                ),

                              ),
                        SizedBox(
                          width:15
                        ),
                          Container(
                              height: 120,
                              width: 100,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Sales Made',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0
                                  ),
                                  ),
                                  ),
                                  Container(
                                    width: 30,
                                  child: Align(
                                    alignment:Alignment.center,
                                    child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                  ),
                                 
                                 Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: FractionalOffset.bottomCenter,
                                  child:Container(
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
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
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                                    ),
                          SizedBox(
                            width:5
                            ),
                           Container(
                                    alignment: Alignment(100,10),
                                    height: 20,
                                    width: 35,
                                    child: Material(
                                    borderRadius: BorderRadius.circular(5.0),
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
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat'
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                          ),
                          
                          ]
                                )
                                 ],
                                ),
                          ),
                          
                          ]),
                        ),
                          // Third Row
                        Row(children:<Widget>[
                        Padding(padding: EdgeInsets.only(right:20 ,left: 20),
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[ Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              
                               child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Affirmations',
                                textAlign: TextAlign.left,
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0),
                                ),
                                  ),
                                  Container(
                                    width: 30,
                                  child: Align(
                                    alignment:Alignment.center,
                                   child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                )
                                  ),
                                 ],
                                )
                            ),
                            
                        SizedBox(
                          height:15
                        ),
                        Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Reminders/Feedback',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.blueAccent,
                                  fontSize: 14.0
                                  ),
                                  ),
                                  ),
                                  Container(
                                    width: 30,
                                  child: Align(
                                    alignment:Alignment.center,
                                    child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                  ),
                                 
                                 
                                 ],
                                ),

                              ),
                        SizedBox(
                          height:15
                        ),
                          Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Inspirational Quote',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.deepOrange, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0
                                  ),
                                  ),
                                  ),
                                  Container(
                                    width: 30,
                                  child: Align(
                                    alignment:Alignment.center,
                                    child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                  ),
                                
                                 ],
                                ),
                          ),
                          ]  
                            ),
                        ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:[ Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              
                               child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('My Why',
                                textAlign: TextAlign.left,
                                style: TextStyle(wordSpacing: 3,
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
                                    alignment:Alignment.center,
                                   child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                )
                                  ),
                                 ],
                                )
                            ),
                            
                        SizedBox(
                          height:15
                        ),
                        Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.deepOrange,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Break',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.blueAccent, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.blueAccent,
                                  fontSize: 14.0
                                  ),
                                  ),
                                  ),
                                  Container(
                                    width: 30,
                                  child: Align(
                                    alignment:Alignment.center,
                                    child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                  ),
                                 
                                 
                                 ],
                                ),

                              ),
                        SizedBox(
                          height:15
                        ),
                          Container(
                              height: 90,
                              width: 150,
                              padding: EdgeInsets.only(top:10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blueAccent,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                 children: <Widget>[
                                  Align(
                                  alignment:Alignment.topCenter,
                                child: Text('Sales I Have Left',
                                style: TextStyle(wordSpacing: 3,
                                  color: Colors.deepOrange, 
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 3,
                                  decorationColor: Colors.deepOrange,
                                  fontSize: 14.0
                                  ),
                                  ),
                                  ),
                                  Container(
                                    width: 30,
                                  child: Align(
                                    alignment:Alignment.center,
                                    child: TextField(
                                   enabled: false,
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                  ),
                                
                                 ],
                                ),
                          ),
                          ]  
                            )
                        ]
                        )
            ]
            ),
              )
        ),
        ),
        
      )
      );
    }     
}