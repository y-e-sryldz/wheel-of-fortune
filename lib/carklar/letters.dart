import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rxdart/rxdart.dart';

class letters extends StatefulWidget {
  const letters({Key? key}) : super(key: key);

  @override
  _lettersState createState() => _lettersState();
}

class _lettersState extends State<letters> {
  final selected = BehaviorSubject<int>();

  String rewards = "";

  List<String> items = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
  ];

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1F173D),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Hangi Harf?",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/arka_plan.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 380,
                child: FortuneWheel(
                  selected: selected.stream,
                  animateFirst: false,
                  items: items
                      .map((item) => FortuneItem(
                            child: Text(
                              item,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                              ),
                            ),
                            style: FortuneItemStyle(
                              color: _getColorForItem(item),
                              borderWidth: 0,
                            ),
                          ))
                      .toList(),
                  onAnimationEnd: () {
                    setState(() {
                      switch (selected.value) {
                        case 0:
                          rewards = "A";
                          break;
                        case 1:
                          rewards = "B";
                          break;
                        case 2:
                          rewards = "C";
                          break;
                        case 3:
                          rewards = "D";
                          break;
                        case 4:
                          rewards = "E";
                          break;
                        case 5:
                          rewards = "F";
                          break;
                        case 6:
                          rewards = "G";
                          break;
                        case 7:
                          rewards = "H";
                          break;
                        case 8:
                          rewards = "I";
                          break;
                        case 9:
                          rewards = "J";
                          break;
                        case 10:
                          rewards = "K";
                          break;
                        case 11:
                          rewards = "L";
                          break;
                        case 12:
                          rewards = "M";
                          break;
                        case 13:
                          rewards = "N";
                          break;
                        case 14:
                          rewards = "O";
                          break;
                        case 15:
                          rewards = "P";
                          break;
                        case 16:
                          rewards = "Q";
                          break;
                        case 17:
                          rewards = "R";
                          break;
                        case 18:
                          rewards = "S";
                          break;
                        case 19:
                          rewards = "T";
                          break;
                        case 20:
                          rewards = "U";
                          break;
                        case 21:
                          rewards = "V";
                          break;
                        case 22:
                          rewards = "W";
                          break;
                        case 23:
                          rewards = "X";
                          break;
                        case 24:
                          rewards = "Y";
                          break;
                        case 25:
                          rewards = "Z";
                          break;
                      }
                    });
                    QuickAlert.show(
                        context: context,
                        type: QuickAlertType.loading,
                        title: "${rewards}",
                        text: 'Harfi Geldi',
                        confirmBtnText: "Tamam",
                        confirmBtnColor: Colors.green,
                      );
                  },
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(Fortune.randomInt(0, items.length));
                  });
                },
                child: Container(
                  height: 40,
                  width: 120,
                  margin: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Color(0xFF6A5ACD),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "ÇEVİR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
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

  Color _getColorForItem(String item) {
    switch (item) {
      case "A":
        return Color(0xFFfc1313);
      case "B":
        return Color(0xFF86bbfb);
      case "C":
        return Color(0xFFf3fb58);
      case "D":
        return Color(0xFF60d85b);
      case "E":
        return Color(0xFF42c399);
      case "F":
        return Color(0xFF898989);
      case "G":
        return Color(0xFF8014cb);
      case "H":
        return Color(0xFFe3fbe2);
      case "I":
        return Color(0xFFdbebfb);
      case "J":
        return Color(0xFFbf62f5);
      case "K":
        return Color(0xFFf1fc13);
      case "L":
        return Color(0xFF15b392);
      case "M":
        return Color(0xFFb61414);
      case "N":
        return Color(0xFFfb9340);
      case "O":
        return Color(0xFF1373de);
      case "P":
        return Color(0xFFfb15e1);
      case "Q":
        return Color(0xFFe6e7c6);
      case "R":
        return Color(0xFF8c1414);
      case "S":
        return Color(0xFF94d883);
      case "T":
        return Color(0xFF858585);
      case "U":
        return Color(0xFF99fb80);
      case "V":
        return Color(0xFF141db3);
      case "W":
        return Color(0xFF8945bd);
      case "X":
        return Color(0xFFe2cdfb);
      case "Y":
        return Color(0xFFf9fbe5);
      case "Z":
        return Color(0xFFe7f5fb);
      default:
        return Colors.black;
    }
  }
}
