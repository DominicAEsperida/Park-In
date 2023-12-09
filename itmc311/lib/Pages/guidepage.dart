import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(234, 247, 255, 1),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(1, 5, 1, 7),
              child: Text(
                'Need Help?',
                style: TextStyle(
                  fontFamily: 'Arista',
                  fontSize: 47.0,
                  color: Color.fromRGBO(12, 12, 255, 1),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'BubbleboddyNeue',
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Choose a Suitable Spot:",
                      style: TextStyle(
                        color: Color.fromRGBO(
                            12, 12, 255, 1), // Set the color to blue
                        fontFamily:
                            'BubbleboddyNeue', // Set the font family to 'BubbleboddyNeue'
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text:
                          " Look for a parking\nspace that matches the size of your vehicle.",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'BubbleboddyNeue',
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Leave Adequate Space:",
                      style: TextStyle(
                        color: Color.fromRGBO(
                            12, 12, 255, 1), // Set the color to blue
                        fontFamily:
                            'BubbleboddyNeue', // Set the font family to 'BubbleboddyNeue'
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text:
                          " Leave enough\nspace between your vehicle and others to\nallow for easy entry and exit. Be\nconsiderate of neighboring cars.",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'BubbleboddyNeue',
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Turn Off Engine and Lock the Car:",
                      style: TextStyle(
                        color: Color.fromRGBO(
                            12, 12, 255, 1), // Set the color to blue
                        fontFamily:
                            'BubbleboddyNeue', // Set the font family to 'BubbleboddyNeue'
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text:
                          " Before\nleaving your vehicle, turn off the engine,\nremove the keys, and lock the doors.",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'BubbleboddyNeue',
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Secure Valuables:",
                      style: TextStyle(
                        color: Color.fromRGBO(
                            12, 12, 255, 1), // Set the color to blue
                        fontFamily:
                            'BubbleboddyNeue', // Set the font family to 'BubbleboddyNeue'
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text:
                          " If you must leave\nvaluables in your vehicle, secure them out\nof sight to deter theft.",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(6),
              alignment: Alignment.center,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'BubbleboddyNeue',
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Respect Reserved Spaces:",
                      style: TextStyle(
                        color: Color.fromRGBO(
                            12, 12, 255, 1), // Set the color to blue
                        fontFamily:
                            'BubbleboddyNeue', // Set the font family to 'BubbleboddyNeue'
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text:
                          " If a parking\nspot is marked as reserved for specific\nindividuals or purposes, respect those\nreservations.",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(top: 6),
              alignment: Alignment.center,
              width: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 255, 255, 255),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'BubbleboddyNeue',
                      color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Adhere to Posted Speed Limits:",
                      style: TextStyle(
                        color: Color.fromRGBO(
                            12, 12, 255, 1), // Set the color to blue
                        fontFamily:
                            'BubbleboddyNeue', // Set the font family to 'BubbleboddyNeue'
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    TextSpan(
                      text:
                          " Always\nfollow the posted speed limits on road\nsigns.",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 80),
            Container(
                alignment: Alignment.bottomCenter,
                child: const Text(
                  '© 2023 Cho P. Ltd, Inc. All Rights Reserved',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10.0,
                    color: Color.fromRGBO(10, 10, 31, 1),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
