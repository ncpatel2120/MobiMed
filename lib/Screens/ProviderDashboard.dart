import 'package:flutter/material.dart';

import 'package:m_health/ProviderHelper/ProviderState.dart';
import 'package:m_health/Screens/ProviderLogin.dart';
import 'package:provider/provider.dart';


class ProviderDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ProviderState _providerState = Provider.of<ProviderState>(context,listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("UID: ${_providerState.getUid}"),
            Text("Email : ${_providerState.getEmail}"),
            RaisedButton(onPressed: (){
              _providerState.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProviderLogin()));
            },child: Text("Sign Out "),),

          ],
        ),
      ),
    );
  }
}