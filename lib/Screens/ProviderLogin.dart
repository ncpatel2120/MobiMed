import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_health/ProviderHelper/ProviderState.dart';
import 'package:m_health/Screens/ForgotPassword.dart';
import 'package:m_health/Screens/ProviderDashboard.dart';
import 'package:m_health/Screens/ProviderRegistration.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_health/Screens/Selection.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:email_validator/email_validator.dart';


class ProviderLogin extends StatefulWidget {
  @override
  _ProviderLoginState createState() => _ProviderLoginState();
}

class _ProviderLoginState extends State<ProviderLogin> {

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/homepage2.jpg'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          width: 100,
                          child: SvgPicture.asset("assets/img/logo.svg")
                      ),
                      HeightBox(10),
                      "Welcome".text.color(Colors.white).size(30).make(),
                      HeightBox(
                          20
                      ),
                      "Please login to your account".text.color(Colors.black)
                          .size(20)
                          .make(),
                      HeightBox(
                          20
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.black
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.blue[400]
                                )
                            ),
                            isDense: true,
                            // Added this
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),

                      HeightBox(
                          20
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: TextFormField(
                          controller: pass,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            hintStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                  color: Colors.black
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.blue[400]
                                )
                            ),
                            isDense: true,
                            // Added this
                            contentPadding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                          ),
                          obscureText: true,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      HeightBox(20),

                      // GestureDetector(onTap: () {
                      //   Get.to(ForgotPassword());
                      // },
                      //   child: Text("Forgot Password ? Reset Now",
                      //     style: TextStyle(color: Colors.black),),),

                      HeightBox(10),
                      GestureDetector(
                          onTap: () {
                            print("Login Clicked Event");
                            final close = context.showLoading(msg: "Loading");
                            Future.delayed(Duration(seconds: 4), close);

                            _login(email.text, pass.text);
                          },
                          child: "Login".text.black.light.xl
                              .makeCentered()
                              .box
                              .black
                              .shadowOutline(outlineColor: Colors.grey)
                              .color(Color(0XFFFF0772))
                              .roundedLg
                              .make()
                              .w(150)
                              .h(40)),
                      HeightBox(160),


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => ProviderRegistration()));
          },
          child: RichText(text: TextSpan(
            text: 'New User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black),
            children: <TextSpan>[
              TextSpan(
                text: ' Register Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          )
          ).pLTRB(20, 0, 0, 15),
        )
    );
  }

  void _login(String email, String password) async {
    ProviderState _providerState = Provider.of<ProviderState>(
        context, listen: false);

    try {
      if (await _providerState.LoginUser(email, password)) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Selection()));
      }

    } catch (e) {
      print(e);
    }
  }


}


