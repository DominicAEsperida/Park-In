import 'package:flutter/material.dart';
import 'package:itmc311/Pages/GuidePage.dart';
import 'package:firebase_database/firebase_database.dart';

class HomeSVPage extends StatefulWidget {
  const HomeSVPage({Key? key}) : super(key: key);

  @override
  _HomeSVPageState createState() => _HomeSVPageState();
}

class _HomeSVPageState extends State<HomeSVPage> {
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    super.initState();
    updateAvailableSpaces();
  }

  Future<void> updateAvailableSpaces() async {
    int? alingalAAvailableSpaces = await fetchDataFromDatabase("Alingal A");
    ParkingAreaSpaceManager.updateAvailableSpaces(
        "Alingal A", alingalAAvailableSpaces);
    int? alingalBAvailableSpaces = await fetchDataFromDatabase("Alingal B");
    ParkingAreaSpaceManager.updateAvailableSpaces(
        "Alingal B", alingalBAvailableSpaces);
    int? burnsAvailableSpaces = await fetchDataFromDatabase("Burns");
    ParkingAreaSpaceManager.updateAvailableSpaces(
        "Burns", burnsAvailableSpaces);
    int? cocoCafeAvailableSpaces = await fetchDataFromDatabase("Coco Cafe");
    ParkingAreaSpaceManager.updateAvailableSpaces(
        "Coco Cafe", cocoCafeAvailableSpaces);
    int? ccavailableSpaces = await fetchDataFromDatabase("CC");
    ParkingAreaSpaceManager.updateAvailableSpaces("CC", ccavailableSpaces);
    int? libraryAvailableSpaces = await fetchDataFromDatabase("Library");
    ParkingAreaSpaceManager.updateAvailableSpaces(
        "Library", libraryAvailableSpaces);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  child: IconButton(
                    icon: const Icon(Icons.help_outline_rounded),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const GuidePage();
                          },
                        ),
                      );
                    },
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
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            Container(
                              alignment: Alignment.topRight,
                              child: IconButton(
                                icon: Icon(
                                  Icons.refresh_rounded,
                                  size: 25,
                                  color: Color.fromRGBO(234, 247, 255, 1),
                                ), // Use any icon you prefer
                                onPressed: () {
                                  // Call yrour updateDatabase function here
                                  updateAvailableSpaces();
                                },
                              ),
                            ),
                          ],
                        ),
                        const Divider(
                          color: Color.fromRGBO(235, 235, 235, 1.0),
                          thickness: 2.0,
                        ),
                        Text(
                          ParkingAreaSpaceManager.totalAvailableParkingSpaces
                              .toString(),
                          style: const TextStyle(
                            fontFamily: 'Arista',
                            fontSize: 105,
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
                              fontSize: 10.0,
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
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: const Text(
                      'Parking Areas',
                      style: TextStyle(
                        fontFamily: "BubbleboddyNeue",
                        color: Color.fromRGBO(10, 10, 31, 1),
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: Tooltip(
                      message:
                          "The numbers represent the \n available parking spaces",
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.info_outline_rounded),
                      ),
                      waitDuration: Duration(milliseconds: 0),
                      showDuration: Duration(seconds: 5),
                      textAlign: TextAlign.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              offset: Offset(6.0, 6.0),
                            ),
                          ],
                          color: Colors.grey[800]),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  width: 100,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(35),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Alingal-A.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 30),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: ParkingArea(ParkingAreaSpaceManager
                                          .availableParkingSpacesAlingalA ??
                                      0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Alingal A',
                                    style: TextStyle(
                                      fontFamily: "BubbleboddyNeue",
                                      color: Color.fromRGBO(10, 10, 31, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    height: 125,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  width: 90,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(35),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Alingal-B.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 30),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: ParkingArea(ParkingAreaSpaceManager
                                          .availableParkingSpacesAlingalB ??
                                      0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Alingal B',
                                    style: TextStyle(
                                      fontFamily: "BubbleboddyNeue",
                                      color: Color.fromRGBO(10, 10, 31, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  width: 100,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(35),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Burns.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 30),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: ParkingArea(ParkingAreaSpaceManager
                                          .availableParkingSpacesBurns ??
                                      0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Burns',
                                    style: TextStyle(
                                      fontFamily: "BubbleboddyNeue",
                                      color: Color.fromRGBO(10, 10, 31, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    height: 125,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  width: 100,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(35),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Coco.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 30),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: ParkingArea(ParkingAreaSpaceManager
                                          .availableParkingSpacesCocoCafe ??
                                      0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Coco',
                                    style: TextStyle(
                                      fontFamily: "BubbleboddyNeue",
                                      color: Color.fromRGBO(10, 10, 31, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Colors.white,
                  elevation: 10,
                  shadowColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                  child: SizedBox(
                    height: 125,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  width: 110,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(35),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/CC.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 30),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: ParkingArea(ParkingAreaSpaceManager
                                          .availableParkingSpacesCC ??
                                      0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Covered Court',
                                    style: TextStyle(
                                      fontFamily: "BubbleboddyNeue",
                                      color: Color.fromRGBO(10, 10, 31, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
                    height: 125,
                    width: 150,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  alignment: Alignment.bottomRight,
                                  width: 130,
                                  height: 80,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(35),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/Library.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, bottom: 30),
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  alignment: Alignment.centerLeft,
                                  child: ParkingArea(ParkingAreaSpaceManager
                                          .availableParkingSpacesLibrary ??
                                      0),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 30),
                                  alignment: Alignment.topLeft,
                                  child: const Text(
                                    'Library',
                                    style: TextStyle(
                                      fontFamily: "BubbleboddyNeue",
                                      color: Color.fromRGBO(10, 10, 31, 1),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

class ParkingArea extends StatelessWidget {
  final int availableSpaces;

  ParkingArea(this.availableSpaces);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            availableSpaces.toString(),
            style: const TextStyle(
              fontFamily: 'Arista',
              fontSize: 50.0,
              color: Color.fromRGBO(10, 10, 31, 1),
            ),
          ),
        ),
      ],
    );
  }
}

class ParkingAreaSpaceManager {
  static int? totalAvailableParkingSpaces;
  static int? availableParkingSpacesAlingalA;
  static int? availableParkingSpacesAlingalB;
  static int? availableParkingSpacesCC;
  static int? availableParkingSpacesBurns;
  static int? availableParkingSpacesCocoCafe;
  static int? availableParkingSpacesLibrary;

  static void updateAvailableSpaces(String parkingArea, int? availableSpaces) {
    switch (parkingArea) {
      case "Alingal A":
        availableParkingSpacesAlingalA = availableSpaces;
        break;
      case "Alingal B":
        availableParkingSpacesAlingalB = availableSpaces;
        break;
      case "CC":
        availableParkingSpacesCC = availableSpaces;
        break;
      case "Burns":
        availableParkingSpacesBurns = availableSpaces;
        break;
      case "Coco Cafe":
        availableParkingSpacesCocoCafe = availableSpaces;
        break;
      case "Library":
        availableParkingSpacesLibrary = availableSpaces;
        break;
    }
    calculateTotalAvailableSpaces();
  }

  static void calculateTotalAvailableSpaces() {
    totalAvailableParkingSpaces = 0;

    totalAvailableParkingSpaces = (totalAvailableParkingSpaces ?? 0) +
        (availableParkingSpacesAlingalA ?? 0) +
        (availableParkingSpacesAlingalB ?? 0) +
        (availableParkingSpacesCC ?? 0) +
        (availableParkingSpacesBurns ?? 0) +
        (availableParkingSpacesCocoCafe ?? 0) +
        (availableParkingSpacesLibrary ?? 0);
  }
}

Future<int?> fetchDataFromDatabase(String parkingAreaName) async {
  try {
    DatabaseEvent event =
        await FirebaseDatabase.instance.ref().child(parkingAreaName).once();
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
