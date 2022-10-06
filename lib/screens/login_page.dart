import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import '../widgets/colors.dart';

class LoginPage extends StatelessWidget {
LoginPage({Key? key}) : super(key: key);
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Color color1= HexColor("#377eab");
    return Scaffold(
      body: SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Column(children: [
                  ClipPath(
                    clipper:ProsteThirdOrderBezierCurve(
                      position: ClipPosition.bottom,
                      list: [
                        ThirdOrderBezierCurveSection(
                          p1: Offset(0, 100),
                          p2: Offset(0, 210),
                          p3: Offset(MediaQuery.of(context).size.width, 120),
                          p4: Offset(MediaQuery.of(context).size.width, 200),
                        ),
                      ]),
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.cyan, Colors.indigo],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                        ),
                        // color: Color.fromARGB(255, 52, 84, 109),
                      ),
                      height: 200,
                    )),
                  Container(
                    height:MediaQuery.of(context).size.height/7,
                    width:MediaQuery.of(context).size.width/1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("asset/chat.jpeg",),fit:BoxFit.cover,),),
                  ),
                ])),
           SizedBox(height: 30,),
          Container(
            // height: MediaQuery.of(context).size.height/4,
            height: MediaQuery.of(context).size.height/16,
            width: MediaQuery.of(context).size.width*0.70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
                color: Colors.indigoAccent
            ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Container(
            height: MediaQuery.of(context).size.height/5/5,
            width: MediaQuery.of(context).size.width/5/2.10,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/gogle.png"),fit:BoxFit.cover)),
          ),
          Text("Sign in with Google",style: TextStyle(fontSize: 20,color: Colors.white),)
          ],),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: MediaQuery.of(context).size.height/8,
              width:MediaQuery.of(context).size.width*0.70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/f.png"),fit:BoxFit.cover)),
            ),
          ),


        ],)
      )
    );
  }
}
