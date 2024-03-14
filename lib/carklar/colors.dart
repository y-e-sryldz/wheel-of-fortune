import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class colors extends StatefulWidget {
  const colors({Key? key}) : super(key: key);

  @override
  _colorsState createState() => _colorsState();
}

class _colorsState extends State<colors> {
  final selected = BehaviorSubject<int>();

  String rewards = "";

  List<String> items = [
    "Yeşil",
    "Turkuaz",
    "Camgöbeği",
    "Açık mavi",
    "Mavi",
    "Çivit mavisi",
    "Koyu mor",
    "Mor",
    "Pembe",
    "Kırmızı",
    "Koyu turuncu",
    "Turuncu",
    "Kehribar",
    "Sarı",
    "Kireç",
    "Açık yeşil"
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
          "Hangi Renk?",
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
                                color: Colors.white,
                                fontSize: 16,
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
                          rewards = "Yeşil";
                          break;
                        case 1:
                          rewards = "Turkuaz";
                          break;
                        case 2:
                          rewards = "Camgöbeği";
                          break;
                        case 3:
                          rewards = "Açık mavi";
                          break;
                        case 4:
                          rewards = "Mavi";
                          break;
                        case 5:
                          rewards = "Çivit mavisi";
                          break;
                        case 6:
                          rewards = "Koyu mor";
                          break;
                        case 7:
                          rewards = "Mor";
                          break;
                        case 8:
                          rewards = "Pembe";
                          break;
                        case 9:
                          rewards = "Kırmızı";
                          break;
                        case 10:
                          rewards = "Koyu turuncu";
                          break;
                        case 11:
                          rewards = "Turuncu";
                          break;
                        case 12:
                          rewards = "Kehribar";
                          break;
                        case 13:
                          rewards = "Sarı";
                          break;
                        case 14:
                          rewards = "Kireç";
                          break;
                        case 15:
                          rewards = "Açık yeşil";
                          break;

                        default:
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
      case "Yeşil":
        return Color(0xFF59B35C);
      case "Turkuaz":
        return Color(0xFF159C90);
      case "Camgöbeği":
        return Color(0xFF14BED4);
      case "Açık mavi":
        return Color(0xFF17ACF0);
      case "Mavi":
        return Color(0xFF319BF0);
      case "Çivit mavisi":
        return Color(0xFF4E5EB8);
      case "Koyu mor":
        return Color(0xFF7149BA);
      case "Mor":
        return Color(0xFFA237B4);
      case "Pembe":
        return Color(0xFFE7306E);
      case "Kırmızı":
        return Color(0xFFF15146);
      case "Koyu turuncu":
        return Color(0xFFFB6333);
      case "Turuncu":
        return Color(0xFFFB9E14);
      case "Kehribar":
        return Color(0xFFFBC31A);
      case "Sarı":
        return Color(0xFFFBE949);
      case "Kireç":
        return Color(0xFFCEDB47);
      case "Açık yeşil":
        return Color(0xFF92C558);
      default:
        return Colors.black;
    }
  }
}
