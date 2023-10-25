import 'package:flutter/material.dart';

/* Authored by: Emmanuel Dominic A. Esperida
Company: CHO P LTD.
Project: Park-In
Feature: [PRK-009] Admin Page
Description: This is where the Admin can add and deduct the number available parking slots in the campus.
 */

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Park In',
      theme:
          ThemeData(primarySwatch: Colors.blue, fontFamily: 'BubbleboddyNeue'),
      home: AdminPage(),
    );
  }
}

class ParkingSpaceManager {
  static int availableParkingSpaces = 69;
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  void incrementSpaces() {
    setState(() {
      ParkingSpaceManager.availableParkingSpaces++;
    });
  }

  void decrementSpaces() {
    if (ParkingSpaceManager.availableParkingSpaces > 0) {
      setState(() {
        ParkingSpaceManager.availableParkingSpaces--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 247, 255, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                child: const Text(
                  'Home',
                  style: TextStyle(
                    fontFamily: 'Arista',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Color.fromRGBO(10, 10, 31, 1),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 260,
            width: 320,
            margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 20.0),
            child: Card(
              color: Colors.transparent,
              elevation: 10,
              shadowColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(0, 0, 255, 1.0),
                      Color.fromRGBO(0, 0, 255, 0.80),
                      Color.fromRGBO(0, 0, 255, 0.30),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Available Parking Spaces',
                          style: TextStyle(
                            color: Color.fromRGBO(235, 235, 235, 1.0),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color.fromRGBO(235, 235, 235, 1.0),
                        thickness: 2.0,
                      ),
                      Text(
                        ParkingSpaceManager.availableParkingSpaces.toString(),
                        style: const TextStyle(
                          fontFamily: 'Arista',
                          fontSize: 125,
                          color: Color.fromRGBO(235, 235, 235, 1.0),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5.0),
                        alignment: Alignment.bottomRight,
                        child: const Text(
                          '**Approximately',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(235, 235, 235, 0.50),
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(0, 0, 255, 1.0),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    iconSize: 30.0,
                    onPressed: decrementSpaces,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Minus',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(0, 0, 255, 1.0),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    iconSize: 30.0,
                    onPressed: incrementSpaces,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            color: Colors.white,
            elevation: 10,
            shadowColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: SizedBox(
              height: 260,
              width: 320,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Text(
                        'Parking Areas',
                        style: TextStyle(
                          color: Color.fromRGBO(10, 10, 31, 1),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color.fromRGBO(10, 10, 31, 1),
                      thickness: 2.0,
                    ),
                    Column(
                      children: [
                        ParkingArea('Alingal A', 10),
                        ParkingArea('Alingal B', 5),
                        ParkingArea('Church', 15),
                        ParkingArea('Coco Cafe', 8),
                        ParkingArea('CC', 12),
                        ParkingArea('Library', 20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ParkingArea extends StatelessWidget {
  final String name;
  final int availableSpaces;

  ParkingArea(this.name, this.availableSpaces);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color.fromRGBO(10, 10, 31, 1),
            ),
          ),
        ),
        Text(
          availableSpaces.toString(),
          style: const TextStyle(
            fontFamily: 'Arista',
            fontSize: 24.0,
            color: Color.fromRGBO(10, 10, 31, 1),
          ),
        ),
      ],
    );
  }
}
