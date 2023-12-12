import 'package:flutter/material.dart';
import 'package:itmc311/Pages/AdminBottomNav.dart';
import 'package:itmc311/Pages/AdminPage.dart';
import 'package:itmc311/Pages/LandingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itmc311/auth.dart';


class LogInPageAdmin extends StatefulWidget {
  const LogInPageAdmin({super.key});

  @override
  State<LogInPageAdmin> createState() => _LogInPageAdminState();
}

class _LogInPageAdminState extends State<LogInPageAdmin> {

  final Authentication _auth = Authentication();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  @override
  
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 247, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Back',
          style: TextStyle(
            color: Color.fromRGBO(10, 10, 31, 1),
            fontSize: 15.0,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            color: Color.fromRGBO(10, 10, 31, 1),
          ),
        ),
      ),
      body: Container(
        padding:  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/admin.png',
                height: 150.0,
                width: 150.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: const Text(
                  'Log In Your Account',
                  style: TextStyle(
                    fontFamily: 'BubbleboddyNeue',
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(10, 10, 31, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: const Text(
                  'Welcome back! Enter your admin details.',
                  style: TextStyle(
                    fontFamily: 'BubbleboddyNeue',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(10, 10, 31, 1),
                  ),
                ),
              ),
              Padding(
                //TextFormField
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    helperText: "Ex: Admin@gmail.com",
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      // color: Color.fromRGBO(0, 0, 255, 1),
                      fontSize: 15.0,
                      fontFamily: 'Inter',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Padding(
                //TextFormField
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      // color: Color.fromRGBO(0, 0, 255, 1),
                      fontSize: 15.0,
                      fontFamily: 'Inter',
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: _Login,
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.black,
                    elevation: 10,
                    backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(108.0, 15.0, 108.0, 15.0),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        fontFamily: 'BubbleboddyNeue',
                        fontSize: 20.0,
                        color: Color.fromRGBO(235, 235, 235, 1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Text(
                '© 2023 Cho P. Ltd, Inc. All Rights Reserved',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10.0,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
                          ),
              )
            ],
          ),
        ),
      ),
    );
  }


void _Login() async {
  String email = _emailController.text;
  String password = _passwordController.text;
  
  User? user = await _auth.signInWithEmailAndPassword(email, password);

  // Basic validation
  if (email.isEmpty || password.isEmpty) {
    print("Unsuccessful Sign In");
    return;
  }

  if (user != null) {
    print("User successfully Login");
    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AdminBottomNav();
                      },
                    ),
                  );
  } else {
    print("Error Wrong Credentials");
  }
} }