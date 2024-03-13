import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class yes_no extends StatefulWidget {
  const yes_no({Key? key}) : super(key: key);

  @override
  _yes_noState createState() => _yes_noState();
}

class _yes_noState extends State<yes_no> {
  final selected = BehaviorSubject<int>();

  String rewards = "";

  List<String> items = [
    "Evet",
    "Hayır",
    "Evet",
    "Hayır",
    "Evet",
    "Hayır",
    "Evet",
    "Hayır",
    "Evet",
    "Hayır",
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
                      switch (selected.value % 2) {
                        case 0:
                          rewards = "Evet";
                          break;
                        case 1:
                          rewards = "Hayır";
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
      case "Evet":
        return Color.fromARGB(255, 87, 94, 100);
      case "Hayır":
        return Color(0xFF7A2019);
      default:
        return Colors.black;
    }
  }
}
