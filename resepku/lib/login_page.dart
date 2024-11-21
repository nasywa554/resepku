import 'package:flutter/material.dart';
import 'package:resepku/views/home_screen.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // final email = TextFormField(
    //   keyboardType: TextInputType.emailAddress,
    //   autofocus: false,
    //   initialValue: ' ',
    //   decoration: InputDecoration(
    //     hintText: 'Email',
    //     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
    //   ),
    // );

    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,

      controller:
          usernameController, // Associate the controller with the TextFormField
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            String usernameValue = usernameController.text;
            String passwordValue = passwordController.text;
            if (usernameValue == 'nasywa' && passwordValue == '1234') {
              Navigator.of(context)
                  .pushNamed(HomeScreenRecipe.tag, arguments: usernameValue);
            } else {
              String alertTitle = '-';
              String alertContent = '-';
              if (usernameValue != 'nasywa') {
                alertTitle = 'Username Salah';
                alertContent = 'Silakan masukkan Username yang benar.';
              } else if (passwordValue != '1234') {
                alertTitle = 'Password Salah';
                alertContent = 'Silakan masukkan password yang benar.';
              }
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(alertTitle),
                    content: Text(alertContent),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            }
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            username,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }
}
