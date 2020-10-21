import 'package:flutter/material.dart';
import 'package:news_app/api/authentication_api.dart';
import 'package:news_app/screens/home_screen.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool loginError = false;

  AuthenticationAPI authenticationAPI = new AuthenticationAPI();


  TextEditingController _username_controller;
  TextEditingController _password_controller;

  String username;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _username_controller = TextEditingController();
    _password_controller = TextEditingController();


  }
  @override
  void dispose() {

    _username_controller.dispose();
    _password_controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: (isLoading) ? _drawLoading() : _drawLoadingForm(),
      ),
    );
  }

  Widget _drawLoadingForm() {
    if (loginError) {
      return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Login Error!"),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    loginError = false;
                  });
                },
                color: Colors.blueAccent,
                child: Text(
                  "Try Again",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _username_controller,
            decoration: InputDecoration(labelText: 'Username'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter your Username!';
              } else {
                return null;
              }
            },
          ),
          SizedBox(
            height: 8,
          ),
          TextFormField(
            controller: _password_controller,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter your Password!';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  setState(() {
                    isLoading = true;
                  });


                  username = _username_controller.text;
                  password = _password_controller.text;

                  var response = await authenticationAPI.login(username, password);

                  if (response) {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ));
                  } else {
                    setState(() {
                      loginError = true;
                    });
                  }

                  setState(() {
                    isLoading = false;
                  });
                }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _drawLoading() {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
