import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_chat/pages/home_page.dart';
import 'package:one_chat/providers/auth_provider.dart';
import 'package:one_chat/widgets/loading_view.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:provider/provider.dart';
import '../widgets/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userEmail = "";
  String name = "";
  String birth = "";

  @override
  Widget build(BuildContext context) {
    Color color1 = HexColor("#377eab");

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    switch (authProvider.status) {
      case Status.authenticateError:
        Fluttertoast.showToast(msg: "Sign in fail");
        break;
      case Status.authenticateCanceled:
        Fluttertoast.showToast(msg: "Sign in canceled");
        break;
      case Status.authenticated:
        Fluttertoast.showToast(msg: "Sign in success");
        break;
      default:
        break;
    }
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Container(
            child: Column(children: [
          ClipPath(
              clipper: ProsteThirdOrderBezierCurve(
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
                  color: Color.fromARGB(255, 52, 84, 109),
                ),
                height: MediaQuery.of(context).size.height*0.24,
              )),
          Container(
            height: MediaQuery.of(context).size.height *0.13,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "asset/images/chat.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ])),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextButton(
            child: Container(
              height: MediaQuery.of(context).size.height*0.10,
              width: MediaQuery.of(context).size.width * 0.75,
              decoration: BoxDecoration(image: DecorationImage(
                  image: AssetImage("asset/images/Gbutton.png"),fit: BoxFit.cover)),),
            // child: Container(
            //   // height: MediaQuery.of(context).size.height/4,
            //   height: MediaQuery.of(context).size.height / 16,
            //   width: MediaQuery.of(context).size.width * 0.70,
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(4),
            //       color: Colors.indigoAccent),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: MediaQuery.of(context).size.height / 5 / 5,
            //         width: MediaQuery.of(context).size.width / 5 / 2.10,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: AssetImage("asset/images/gogle.png"),
            //                 fit: BoxFit.cover)),
            //       ),
            //       Text(
            //         "Sign in with Google",
            //         style: TextStyle(fontSize: 20, color: Colors.white),
            //       )
            //     ],
            //   ),
            // ),
            onPressed: () async {
              authProvider.handleSignIn().then((isSuccess) {
                if (isSuccess) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                }
              }).catchError((error, stackTrace) {
                Fluttertoast.showToast(msg: error.toString());
                authProvider.handleException();
                print(error.toString());
              });
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              child: Container(
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/images/f.png"),
                        fit: BoxFit.cover)),
              ),
              onTap: () async {
                authProvider.signInWithFacebook().then((isSuccess) {
                  if (isSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  }
                }).catchError((error, stackTrace) {
                  Fluttertoast.showToast(msg: error.toString());
                  authProvider.handleException();
                  print(error.toString());
                });
              },
            )),
        authProvider.status == Status.authenticating
            ? LoadingView()
            : SizedBox.shrink(),
        SizedBox(
          height:MediaQuery.of(context).size.height*0.20,
        ),
        Text("@2001Read User License Agrement",style: TextStyle(color: Colors.blue[500],
            fontWeight: FontWeight.bold),),
      ],
    )));
  }

}
