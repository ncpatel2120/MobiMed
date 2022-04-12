import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_health/pages/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:m_health/ProviderHelper/ProviderState.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>ProviderState())],
        child: MyApp(),

      )

  );

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: HomePage(),
    );
  }
}
