import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:firebase_database/firebase_database.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key});

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
  static int availableParkingSpaces = 0;
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  void incrementSpaces() {
    setState(() {
      ParkingSpaceManager.availableParkingSpaces++;
      updateDatabase();
    });
  }

  void decrementSpaces() {
    if (ParkingSpaceManager.availableParkingSpaces > 0) {
      setState(() {
        ParkingSpaceManager.availableParkingSpaces--;
        updateDatabase();
      });
    }
  }

  void updateDatabase() {
    databaseReference
        .child('availableParkingSpaces')
        .set(ParkingSpaceManager.availableParkingSpaces);
  }

  void calculateTotalAvailableSpaces() async {
    int totalAvailableSpaces = 0;

    List<String> parkingAreaNames = [
      'Alingal A',
      'Alingal B',
      'Burns',
      'Coco Cafe',
      'CC',
      'Library',
    ];

    for (String parkingAreaName in parkingAreaNames) {
      int? spaces = await fetchDataFromDatabase(parkingAreaName);
      if (spaces != null) {
        totalAvailableSpaces += spaces;
      }
    }

    setState(() {
      ParkingSpaceManager.availableParkingSpaces = totalAvailableSpaces;
    });
  }

  void initTotalAvailableSpaces() {
    calculateTotalAvailableSpaces();
  }

  @override
  void initState() {
    super.initState();
    initTotalAvailableSpaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(234, 247, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
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
                        fontSize: 26,
                        color: Color.fromRGBO(10, 10, 31, 1),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.fromLTRB(40.0, 0.0, 40.0, 0.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        customButton: const Icon(
                          Icons.more_vert_rounded,
                          size: 30,
                          color: Color.fromRGBO(10, 10, 31, 1),
                        ),
                        items: [
                          ...MenuItems.firstItems.map(
                            (item) => DropdownMenuItem<MenuItem>(
                              value: item,
                              child: MenuItems.buildItem(item),
                            ),
                          ),
                          const DropdownMenuItem<Divider>(
                              enabled: false, child: Divider()),
                          ...MenuItems.secondItems.map(
                            (item) => DropdownMenuItem<MenuItem>(
                              value: item,
                              child: MenuItems.buildItem(item),
                            ),
                          ),
                        ],
                        onChanged: (value) {
                          MenuItems.onChanged(context, value! as MenuItem);
                        },
                        dropdownStyleData: DropdownStyleData(
                          width: 160,
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromRGBO(234, 247, 255, 1),
                          ),
                          offset: const Offset(0, 8),
                        ),
                        menuItemStyleData: MenuItemStyleData(
                          customHeights: [
                            ...List<double>.filled(
                                MenuItems.firstItems.length, 48),
                            8,
                            ...List<double>.filled(
                                MenuItems.secondItems.length, 48),
                          ],
                          padding: const EdgeInsets.only(left: 16, right: 16),
                        ),
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
                            ParkingSpaceManager.availableParkingSpaces
                                .toString(),
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
              Card(
                color: Colors.white,
                elevation: 10,
                shadowColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: SizedBox(
                  height: 400,
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
                            FutureBuilder(
                              future: fetchDataFromDatabase('Alingal A'),
                              builder: (BuildContext context,
                                  AsyncSnapshot<int?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  int initialAvailableSpaces =
                                      snapshot.data ?? 0;
                                  return ParkingArea(
                                    name: 'Alingal A',
                                    initialAvailableSpaces:
                                        initialAvailableSpaces,
                                    onIncrement: incrementSpaces,
                                    onDecrement: decrementSpaces,
                                  );
                                }
                              },
                            ),
                            FutureBuilder(
                              future: fetchDataFromDatabase('Alingal B'),
                              builder: (BuildContext context,
                                  AsyncSnapshot<int?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  int initialAvailableSpaces =
                                      snapshot.data ?? 0;
                                  return ParkingArea(
                                    name: 'Alingal B',
                                    initialAvailableSpaces:
                                        initialAvailableSpaces,
                                    onIncrement: incrementSpaces,
                                    onDecrement: decrementSpaces,
                                  );
                                }
                              },
                            ),
                            FutureBuilder(
                              future: fetchDataFromDatabase('Burns'),
                              builder: (BuildContext context,
                                  AsyncSnapshot<int?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  int initialAvailableSpaces =
                                      snapshot.data ?? 0;
                                  return ParkingArea(
                                    name: 'Burns',
                                    initialAvailableSpaces:
                                        initialAvailableSpaces,
                                    onIncrement: incrementSpaces,
                                    onDecrement: decrementSpaces,
                                  );
                                }
                              },
                            ),
                            FutureBuilder(
                              future: fetchDataFromDatabase('Coco Cafe'),
                              builder: (BuildContext context,
                                  AsyncSnapshot<int?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  int initialAvailableSpaces =
                                      snapshot.data ?? 0;
                                  return ParkingArea(
                                    name: 'Coco Cafe',
                                    initialAvailableSpaces:
                                        initialAvailableSpaces,
                                    onIncrement: incrementSpaces,
                                    onDecrement: decrementSpaces,
                                  );
                                }
                              },
                            ),
                            FutureBuilder(
                              future: fetchDataFromDatabase('CC'),
                              builder: (BuildContext context,
                                  AsyncSnapshot<int?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  int initialAvailableSpaces =
                                      snapshot.data ?? 0;
                                  return ParkingArea(
                                    name: 'CC',
                                    initialAvailableSpaces:
                                        initialAvailableSpaces,
                                    onIncrement: incrementSpaces,
                                    onDecrement: decrementSpaces,
                                  );
                                }
                              },
                            ),
                            FutureBuilder(
                              future: fetchDataFromDatabase('Library'),
                              builder: (BuildContext context,
                                  AsyncSnapshot<int?> snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Error: ${snapshot.error}');
                                } else {
                                  int initialAvailableSpaces =
                                      snapshot.data ?? 0;
                                  return ParkingArea(
                                    name: 'Library',
                                    initialAvailableSpaces:
                                        initialAvailableSpaces,
                                    onIncrement: incrementSpaces,
                                    onDecrement: decrementSpaces,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Future<int?> fetchDataFromDatabase(String parkingAreaName) async {
    try {
      DatabaseEvent event =
          await databaseReference.child(parkingAreaName).once();
      DataSnapshot snapshot = event.snapshot;

      if (snapshot.value != null) {
        int parsedValue = int.parse(snapshot.value.toString());
        return parsedValue;
      } else {
        return null;
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }
}

class ParkingArea extends StatefulWidget {
  final String name;
  final int initialAvailableSpaces;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  ParkingArea({
    required this.name,
    required this.initialAvailableSpaces,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  _ParkingAreaState createState() => _ParkingAreaState();
}

class _ParkingAreaState extends State<ParkingArea> {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
  late int availableSpaces;

  @override
  void initState() {
    super.initState();
    availableSpaces = widget.initialAvailableSpaces;
    databaseReference.child(widget.name).set(widget.initialAvailableSpaces);
  }

  void incrementSpaces() {
    setState(() {
      int maxLimit = getMaxLimitForParkingArea(widget.name);

      if (availableSpaces < maxLimit) {
        availableSpaces++;
        widget.onIncrement();
        updateDatabase();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Parking spaces limit ($maxLimit) reached for ${widget.name}.'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  int getMaxLimitForParkingArea(String parkingAreaName) {
    switch (parkingAreaName) {
      case 'Alingal A':
        return 35;
      case 'Alingal B':
        return 13;
      case 'Burns':
        return 15;
      case 'Coco Cafe':
        return 16;
      case 'CC':
        return 19;
      case 'Library':
        return 9;
      default:
        return 20; // Default to 20 if the parking area is not specified
    }
  }

  void decrementSpaces() {
    if (availableSpaces > 0) {
      setState(() {
        availableSpaces--;
        widget.onDecrement();
        updateDatabase();
      });
    }
  }

  void updateDatabase() {
    databaseReference.child(widget.name).set(availableSpaces);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Color.fromRGBO(10, 10, 31, 1),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(0, 0, 255, 1.0),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    iconSize: 20.0,
                    onPressed: decrementSpaces,
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  availableSpaces.toString(),
                  style: const TextStyle(
                    fontFamily: 'Arista',
                    fontSize: 24.0,
                    color: Color.fromRGBO(10, 10, 31, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: Color.fromRGBO(0, 0, 255, 1.0),
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    iconSize: 20.0,
                    onPressed: incrementSpaces,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const AdminScreen());
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [user, help];
  static const List<MenuItem> secondItems = [logout];

  static const user = MenuItem(text: 'User', icon: Icons.person);
  static const help = MenuItem(text: 'Help', icon: Icons.help);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: const Color.fromRGBO(10, 10, 31, 1), size: 22),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Color.fromRGBO(10, 10, 31, 1),
            ),
          ),
        ),
      ],
    );
  }

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.user:
        //Do something
        break;
      case MenuItems.help:
        Navigator.pushNamed(context, '/help');
        break;
      case MenuItems.logout:
        Navigator.pushNamed(context, '/logout');
        break;
    }
  }
}
