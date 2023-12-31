import 'package:flutter/material.dart';
import 'package:itmc311/Pages/LogInPageAdmin.dart';
import 'package:itmc311/Pages/SVBottomNav.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 247, 255, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Image.asset(
              'assets/Logo.png',
            ),
            // Image.network(
            //     'https://lh3.googleusercontent.com/drive-viewer/AK7aPaC_5HKXZOTr7orv4IneSsqrP263_shCLT_Cuufr123ydUSvoQuboK1KGfJYcW-W-wT9dq3cAJvYs8Aa0WWuNeH2UDuwHQ=s2560'),
            const Text(
              'Welcome to',
              style: TextStyle(
                fontFamily: 'BubbleboddyNeue',
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(10, 10, 31, 1),
              ),
            ),
            const Text(
              'Park-In',
              style: TextStyle(
                fontFamily: 'BubbleboddyNeue',
                fontSize: 70.0,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 215, 0, 1),
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Continue As:',
              style: TextStyle(
                fontFamily: 'BubbleboddyNeue',
                fontSize: 20.0,
                color: Color.fromRGBO(10, 10, 31, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const StudentScreen();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 0, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(60.0, 15.0, 60.0, 15.0),
                  child: Text(
                    'Student/Visitor',
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
              padding: const EdgeInsets.all(5.0),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LogInPageAdmin();
                      },
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: Color.fromRGBO(0, 0, 255, 1),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(100.0, 15.0, 100.0, 15.0),
                  child: Text(
                    'Admin',
                    style: TextStyle(
                      fontFamily: 'BubbleboddyNeue',
                      fontSize: 20.0,
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110.0),
              child: Image.asset('assets/landingpage.png'),
            ),
            const Text(
              '© 2023 Cho P. Ltd, Inc. All Rights Reserved',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10.0,
                color: Color.fromRGBO(10, 10, 31, 1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
