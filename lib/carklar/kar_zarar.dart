import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class kar_zarar extends StatefulWidget {
  const kar_zarar({Key? key}) : super(key: key);

  @override
  _kar_zararState createState() => _kar_zararState();
}

class _kar_zararState extends State<kar_zarar> {
  final selected = BehaviorSubject<int>();

  String rewards = "";

  List<String> items = [
    "Hiçbir şey",
    "+1",
    "+5",
    "+10",
    "+50",
    "+100",
    "+500",
    "+1,000",
    "+5,000",
    "+10,000",
    "Hiçbir şey",
    "-1",
    "-5",
    "-10",
    "-50",
    "-100",
    "-500",
    "-1,000",
    "-5,000",
    "-10,000",
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
        title: Text(
          "Renkler",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/arka_plan.jpg"),
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
                                fontSize: 18,
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
                          rewards = "Hiçbir şey";
                          break;
                        case 1:
                          rewards = "+1";
                          break;
                        case 2:
                          rewards = "+5";
                          break;
                        case 3:
                          rewards = "+10";
                          break;
                        case 4:
                          rewards = "+50";
                          break;
                        case 5:
                          rewards = "+100";
                          break;
                        case 6:
                          rewards = "+500";
                          break;
                        case 7:
                          rewards = "+1,000";
                          break;
                        case 8:
                          rewards = "+5,000";
                          break;
                        case 9:
                          rewards = "+10,000";
                          break;
                        case 10:
                          rewards = "Hiçbir şey";
                          break;
                        case 11:
                          rewards = "-1";
                          break;
                        case 12:
                          rewards = "-5";
                          break;
                        case 13:
                          rewards = "-10";
                          break;
                        case 14:
                          rewards = "-50";
                          break;
                        case 15:
                          rewards = "-100";
                          break;
                        case 16:
                          rewards = "-500";
                          break;
                        case 17:
                          rewards = "-1,000";
                          break;
                        case 18:
                          rewards = "-5,000";
                          break;
                        case 19:
                          rewards = "-10,000";
                          break;
                        default:
                          rewards = "Hataaa";
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Kazanan: $rewards")),
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
                  color: Colors.blue,
                  child: Center(child: Text("ÇEVİR")),
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
      case "Hiçbir şey":
        return Color(0xFFe3e3e3);
      case "+1":
        return Color(0xFF90fb13);
      case "+5":
        return Color(0xFF90fb13);
      case "+10":
        return Color(0xFF90fb13);
      case "+50":
        return Color(0xFF90fb13);
      case "+100":
        return Color(0xFF90fb13);
      case "+500":
        return Color(0xFF90fb13);
      case "+1,000":
        return Color(0xFF90fb13);
      case "+5,000":
        return Color(0xFF90fb13);
      case "+10,000":
        return Color(0xFF90fb13);
      case "-1":
        return Color(0xFFfb2415);
      case "-5":
        return Color(0xFFfb2415);
      case "-10":
        return Color(0xFFfb2415);
      case "-50":
        return Color(0xFFfb2415);
      case "-100":
        return Color(0xFFfb2415);
      case "-500":
        return Color(0xFFfb2415);
      case "-1,000":
        return Color(0xFFfb2415);
      case "-5,000":
        return Color(0xFFfb2415);
      case "-10,000":
        return Color(0xFFfb2415);
      default:
        return Colors.black;
    }
  }
}
