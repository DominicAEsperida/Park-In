import 'package:flutter/material.dart';
import 'package:itmc311/Pages/AdminBottomNav.dart';

class LogInPageAdmin extends StatelessWidget {
  const LogInPageAdmin({super.key});

  @override
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
        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 50.0,
              ),
              Image.asset('assets/admin.png',
                height: 200.0,
                width: 200.0,
              ),
              const Text(
                'Log In',
                style: TextStyle(
                  fontFamily: 'BubbleboddyNeue',
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ),
              Padding(
                //TextFormField
                padding: const EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Username',
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
                  onPressed: () {
                    //Pag connect
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AdminBottomNav();
                        },
                      ),
                    );
                  },
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
            ],
          ),
        ),
      ),
    );
  }
}
