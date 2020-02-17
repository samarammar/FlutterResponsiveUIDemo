import 'dart:async';
import 'package:login_bloc/models/login_model.dart';
import 'package:login_bloc/utils/NetworkUtils.dart';

import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rxdart/streams.dart';
import 'package:http/http.dart';


class Bloc extends Object with Validators{
//  final Future<LoginModel> post;
  static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';

  //controllers
//  final _email = StreamController<String>.broadcast();
  final _email = BehaviorSubject<String>(); // it's by default broadcast StreamController
//  final _password = StreamController<String>.broadcast();
  final _password = BehaviorSubject<String>();


    //Add data to stream
    Stream<String> get email => _email.stream.transform(validateEmail);
    Stream<String> get password => _password.stream.transform(validatePassword);
    Stream<bool> get submitValid => Rx.combineLatest2(email, password, (e,p)=>true);

  //Change data
    Function(String) get changeEmail => _email.sink.add;
    Function(String) get changePassword => _password.sink.add;

    submit() async{
      final validEmail= _email.value;
      final validPassword =_password.value;

      LoginModel newPost = new LoginModel(
          userId: "123", id: 0, title:  _email.value, body: _password.value);
      LoginModel p = await NetworkUtils.createPost(CREATE_POST_URL,
          body: newPost.toMap());
      print(p.title);
      print(p.title);

      print('email is $validEmail');
      print('Password is $validPassword');
    }

    //clean StreamController
    dispose(){
      _email.close();
      _password.close();
    }

}

//Single Global Instance
//final bloc =Bloc();

