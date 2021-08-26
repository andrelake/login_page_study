import 'package:flutter/material.dart';
import 'package:login_page_study/models/user.model.dart';
import 'package:login_page_study/pages/home.page.dart';
import 'package:login_page_study/services/login.service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  bool founded = false;

  List<User> list = LoginService.userList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    email = text;
                  },
                ),
                SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text) {
                    password = text;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () {

                    _loginOrCreateUser();

                    founded = false;
                  },
                ),
                ElevatedButton(
                  child: Text('Print List'),
                  onPressed: () {
                    
                    for (var user in list) {
                        print(user.email);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//utils
  void _loginOrCreateUser() {
    for (var user in list) {
      if(email == user.email && password == user.password) {
        founded = true;
        print('User encontrado - $email');
      }
    }
    
    if(founded == false) {
      list.add(User(email: email, password: password));
      print('New User - $email');
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
