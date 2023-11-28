import 'package:flutter/material.dart';
//import 'package:my_project/homepage.dart';

/* Authored by: Mathew Talagtag
Company: CHO P LTD.
Project: Park-In
Feature: [PRK-006] Success Page
Description: Success page for success parking reservation
 */

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(234, 247, 255, 1),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 140.0, 20.0, 1.0),
            child: Image.network(
              'https://lh3.googleusercontent.com/drive-viewer/AK7aPaByWMLpdM4rYjXfKd4Dwzcc2lJQNCuXtebZUuJ9jyd7k0O2ktNkg4ZT8T5b05GmpScWEMjRqXCR_O8hykPAzL68pE-y=s2560',
              height: 75,
              width: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0.5, 10, 1),
            child: Image.network(
              'https://lh3.googleusercontent.com/drive-viewer/AK7aPaAlOCkDbScpoXcQTzo87KVRWe3RrPwI4J4uZoFrX_3OlNyzLbd1OCz2lPnZx8RbnxOgmSQqMgCa29fTHxgfs7_ORGUVgg=s2560',
              height: 220,
              width: 240,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(1, 1, 1, 7),
            child: Text(
              'Success',
              style: TextStyle(
                fontFamily: 'AristaBold',
                fontSize: 55.0,
                color: Color.fromRGBO(50, 205, 50, 1),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 5, 30, 10),
            child: Text(
              'Awesome! You have successfully logged in to your account.\nHave a safe Park-In!',
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
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 110),
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
                  'Return',
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
              padding: EdgeInsets.fromLTRB(1, 55, 1, 1),
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
