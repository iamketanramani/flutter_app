import 'package:flutter/material.dart';

class FirstFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstFragmentState();
  }
}

class FirstFragmentState extends State<FirstFragment> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode fnEmail, fnPassword;

  @override
  void initState() {
    super.initState();
    fnEmail = FocusNode();
    fnPassword = FocusNode();
  }

  @override
  void dispose() {
    fnEmail.dispose();
    fnPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                focusNode: fnEmail,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    //hintText: "Enter Email",
                    labelText: "Email",
                    hintStyle:
                        TextStyle(fontSize: 12.0, color: Colors.blueGrey)),
              ),
              TextFormField(
                focusNode: fnPassword,
                controller: _passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: new InputDecoration(
                    hasFloatingPlaceholder: true,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    labelText: "Password",
                    hintStyle:
                        TextStyle(fontSize: 12.0, color: Colors.blueGrey)),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                    elevation: 5.0,
                    color: Colors.deepPurple,
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Text('Submit',
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                    onPressed: validateData),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validateData() {
    String email, password;

    email = _emailController.text;
    password = _passwordController.text;

    if (email.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Email Required'),
        duration: Duration(seconds: 3),
      ));
      FocusScope.of(context).requestFocus(fnEmail);
    } else if (password.isEmpty) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Password Required'),
        duration: Duration(seconds: 3),
      ));
      FocusScope.of(context).requestFocus(fnPassword);
    } else {
      print("Email: " + email);
      print("Password: " + password);
      displayDialog(email, password);
    }
  }

  void displayDialog(String email, String password) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Data"),
            content: new Text("Email: $email \nPassword: $password"),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text("OK"))
            ],
          );
        });
  }
}
