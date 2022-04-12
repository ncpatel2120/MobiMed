import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../Screens/ProviderLogin.dart';

class HomePage extends StatefulWidget{
  @override
  State createState()=> HomePageState();
}

class HomePageState extends State<HomePage>{
  @override
  void initState(){
    super.initState();
    startTime();

  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route(){
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => ProviderLogin()
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: new BoxDecoration(image: DecorationImage(
                  image: AssetImage('assets/img/homepage2.jpg'), fit: BoxFit.fill)),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                    flex: 2,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 150,
                              width: 150,
                              child: SvgPicture.asset("assets/img/logo.svg")
                          ),
                          Padding(padding: EdgeInsets.only(top:60.0),
                          ),

                          Text('MobiMed', style: TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    )
                ),

                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(backgroundColor: Colors.purple,),
                      Padding(padding: EdgeInsets.only(top: 20.0),),
                      Text("Your Personalized Social Health Care Platform", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: 25.0,  fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),)
                    ],
                  ),
                )

              ],
            )
          ],
        )
    );
    throw UnimplementedError();
  }
}