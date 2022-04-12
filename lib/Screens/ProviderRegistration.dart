import 'package:flutter/material.dart';
import 'package:m_health/ProviderHelper/ProviderState.dart';
import 'package:m_health/Screens/ProviderDashboard.dart';
import 'package:m_health/Screens/ProviderLogin.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';
class ProviderRegistration extends StatefulWidget {
  @override
  _ProviderRegistrationState createState() => _ProviderRegistrationState();

}

class _ProviderRegistrationState extends State<ProviderRegistration> {
  final TextEditingController firstn = TextEditingController();
  final TextEditingController lastn = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  void _signUp(String email, String password, BuildContext context) async {
    ProviderState _providerState = Provider.of<ProviderState>(
        context, listen: false);
    try {
      if (await _providerState.signUpUser(email, password)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProviderLogin()));
      }
    } catch (e) {
      print(e);
    }

  }


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
                        "Please sign up your account".text.color(Colors.black)
                            .size(20)
                            .make(),
                        HeightBox(
                            20
                        ),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: firstn,
                            decoration: InputDecoration(
                              hintText: 'First Name',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                              ),
                              border: OutlineInputBorder(),
                              // <-- This is the key
                              labelText: "First Name",
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


                        HeightBox(20),


                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: lastn,
                            decoration: InputDecoration(
                              hintText: 'Last Name',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Last Name",
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
                        HeightBox(20),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: email,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Email",
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

                        HeightBox(20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: phone,
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                              ),
                              border: OutlineInputBorder(),
                              labelText: "Mobile Number",
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

                        HeightBox(20),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextField(
                            controller: password,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                    color: Colors.black
                                ),
                              ),
                              border: OutlineInputBorder(),
                              // <-- This is the key
                              labelText: "Password",
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
                        GestureDetector(
                            onTap: () {
                              final close = context.showLoading(msg: "Loading");
                              Future.delayed(Duration(seconds: 4),
                                  close); // Removes toast after 2 seconds
                              RegisterUser(email.text, password.text, firstn.text, lastn.text, phone.text);

                            },
                            child: "Sign-Up".text.black.light.xl
                                .makeCentered()
                                .box
                                .black
                                .shadowOutline(outlineColor: Colors.grey)
                                .color(Color(0XFFFF0772))
                                .roundedLg
                                .make()
                                .w(150)
                                .h(40)),
                        HeightBox(140),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProviderLogin()));
          },
          child: RichText(text: TextSpan(
            text: 'Already a User?',
            style: TextStyle(fontSize: 15.0, color: Colors.black,),
            children: <TextSpan>[
              TextSpan(
                text: ' Login Now',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Color(0XFF4321F5)),
              ),
            ],
          ),
          ).pLTRB(20, 0, 0, 15),
        )

    );
  }


  void RegisterUser(String email, String password, String firstn, String lastn, String phone) async {
    ProviderState providerState = Provider.of<ProviderState>(
        context, listen: false);
    try {
      if (await providerState.signUpUser(email, password)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProviderLogin()));
      }
    } catch (e) {

    }
  }
}