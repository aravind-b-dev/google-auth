import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(GoogleLoginApp());
}

class GoogleLoginApp extends StatefulWidget {
  const GoogleLoginApp({ Key key }) : super(key: key);

  @override
  _GoogleLoginAppState createState() => _GoogleLoginAppState();
}

class _GoogleLoginAppState extends State<GoogleLoginApp> {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount user = _googleSignIn.currentUser;
    return MaterialApp(
      theme: ThemeData(
          primaryColor : Colors.green
        ,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Auth (Logged ' + (user == null ? 'out' : 'in') + ')'),
        ), // AppBar
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(child: Text('Sign In'), onPressed: user != null ? null : () async {
                await _googleSignIn.signIn();
                setState(() {});
              },
              ),
              SizedBox(height: 35,),

              ElevatedButton(child: Text('Sign Out'), onPressed: user == null ? null : () async {
                await _googleSignIn.signOut();
                setState(() {});
              }),

              SizedBox(height: 35,),

              user == null ? Text("Please Login") :
                  Text("You are Logged in"),

            ],
          ), // Column
        ), // Center
      ),
    );
  }
}
