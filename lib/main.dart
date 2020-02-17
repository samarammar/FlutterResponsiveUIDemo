import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'blocs/provider.dart';
import 'package:device_preview/device_preview.dart';


void main(){

  runApp(

      DevicePreview(
          child:App()));
}

class App extends StatelessWidget {
  build(BuildContext context) {
    return Provider(
      child:MaterialApp(
        title: 'Login Screen',
        home: Scaffold(
          body: LoginScreen(context: context),
        ),
      ) ,
    );
  }
}