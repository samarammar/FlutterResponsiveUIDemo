
import 'package:flutter/material.dart';
import 'package:login_bloc/models/login_model.dart';
import 'package:login_bloc/screens/sizing_information.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';
import '../screens/base_widget.dart';



class LoginScreen extends StatelessWidget{
  const LoginScreen({Key key,BuildContext context}) : super(key: key);

  Widget build(context) {
//   bloc.changeEmail('samar@email.com');
 final bloc= Provider.of(context);
 final media = MediaQuery.of(context).size;
 print(media);// Width and Height of current screen

 return BaseWidget(builder: (context, sizingInformation)

 {
   return Container(

     margin: EdgeInsets.all(media.width/20), //20.0
     child: Column(
       mainAxisSize: MainAxisSize.min,
       children: [
          Container(margin: EdgeInsets.only(top: media.height/27.3)),//25.0
         Expanded(flex: 1,child: Image.asset('images/flu.png')),
          emailField(bloc,sizingInformation),
         passwordField(bloc,sizingInformation),
         Container(margin: EdgeInsets.only(top: media.height/27.3)),//25.0
          submitButton(bloc,media),
//         Text(sizingInformation.toString())
       ],
     ),
   );
 }
 );
  }


  Widget emailField(Bloc bloc,SizingInformation size){
   return StreamBuilder(
     stream: bloc.email,
     builder: (context,snapshot){
       return Flexible(

           child:Container(
           width: (size.orientation==Orientation.portrait)||size.screenSize.width>400 ? 400:size.screenSize.width,

       child: TextField(

         onChanged:  bloc.changeEmail,
         keyboardType: TextInputType.emailAddress,
         decoration: InputDecoration(

           hintText: 'Email@email.com',
           labelText: 'Email Address',
        errorText: snapshot.error
         ),
       ),
           ),
       );
     },
   );


  }

  Widget passwordField(Bloc bloc,SizingInformation size){
   return StreamBuilder(
     stream: bloc.password,
     builder: (context,snapshot){
       return Flexible(

       child:Container(
         width: (size.orientation==Orientation.portrait)||size.screenSize.width>400 ? 400:size.screenSize.width,
       child: TextField(
         onChanged: bloc.changePassword,
         obscureText: true,
         decoration: InputDecoration(
             hintText: 'Password',
             labelText: 'Password',
           errorText: snapshot.error
         ),
       ),
       ),
       );
     },
   );
  }

  Widget submitButton(Bloc bloc,Size size){
   return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context,snapshot){
        return Flexible(

        child:  RaisedButton(
          child: Text('Login'),
          color: Colors.green,
          onPressed: snapshot.hasData ?  (){
            bloc.submit();
          }:null,
        ),
        );
      },
   );
  }
}