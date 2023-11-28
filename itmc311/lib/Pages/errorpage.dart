import 'package:flutter/material.dart';
//import 'package:my_project/homepage.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(234, 247, 255, 1),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 160, 10, 5),
            child: Image.network(
              'https://lh3.googleusercontent.com/drive-viewer/AK7aPaA7ycGZ3IaAsevwHG9F32OwT1C1uCvFAcUNuS-8XXRWmOC_t6Q23ecVkxNYwXAsl7wcwQaJG6w8M2v3Y27kPw5fTxdlow=s2560',
              height: 250,
              width: 270,
            ),
          ),
          const Padding(
            //text "Error"
            padding: EdgeInsets.fromLTRB(1, 1, 1, 1),
            child: Text(
              'Connection Error',
              style: TextStyle(
                fontFamily: 'AristaBold',
                fontSize: 45.0,
                color: Color.fromRGBO(212, 28, 0, 28),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
            child: Text(
              'Oops! Something went wrong.\n Make sure you’re connected to a network.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'lighttrial',
                fontSize: 15,
                color: Color.fromRGBO(10, 10, 31, 1),
              ),
            ),
          ),
          Padding(
            /////////////Routing. plus import sa taas
            padding: const EdgeInsets.fromLTRB(10, 60, 10, 40),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const HomePage();
                //     },
                //   ),
                // ); //////////////
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
                padding: EdgeInsets.fromLTRB(120.0, 15.0, 120.0, 15.0),
                child: Text(
                  'Reload',
                  style: TextStyle(
                    fontFamily: 'BubbleboddyNeue',
                    fontSize: 20.0,
                    color: Color.fromRGBO(235, 235, 235, 1),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(1, 110, 1, 1),
              child: Text(
                '© 2023 Cho P. Ltd, Inc. All Rights Reserved',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10.0,
                  color: Color.fromRGBO(10, 10, 31, 1),
                ),
              ))
        ])));
  }
}
