import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rxdart/rxdart.dart';

class meals extends StatefulWidget {
  const meals({Key? key}) : super(key: key);

  @override
  _mealsState createState() => _mealsState();
}

class _mealsState extends State<meals> {
  final selected = BehaviorSubject<int>();
  TextEditingController textFieldController = TextEditingController();

  String rewards = "";
  bool _isPressed = false;

  List<String> items = [
    "Pizza",
    "Hamburger",
  ];

  @override
  void dispose() {
    selected.close();
    textFieldController.dispose();
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
          "Ne Yemeli?",
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    height: 380,
                    child: (items.length>1)
                        ? FortuneWheel(
                            selected: selected.stream,
                            animateFirst: false,
                            items: items
                                .map((item) => FortuneItem(
                                      child: Text(
                                        item,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                      style: FortuneItemStyle(
                                        color:
                                            _getColorForItem(items.indexOf(item)),
                                        borderWidth: 0,
                                      ),
                                    ))
                                .toList(),
                            onAnimationEnd: () {
                              setState(() {
                                rewards = items[selected.value];
                              });
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.success,
                                title: "${rewards}",
                                text: 'Kararınız Belli Oldu',
                                confirmBtnText: "Tamam",
                                confirmBtnColor: Colors.green,
                              );
                            },
                          )
                        : Center(
                            child: Text("2 Seçenek Girince Çark Oluşacaktır",style: TextStyle(color: Colors.white,fontSize: 25),
                            textAlign: TextAlign.center,),
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
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        child: SizedBox(
                          height: 50,
                          width: 280,
                          child: TextField(
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            controller: textFieldController,
                            decoration: InputDecoration(
                              hintText: "Seçenek Giriniz...",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              items.add(textFieldController.text);
                              textFieldController.clear();
                            });
                          },
                          icon: Icon(
                            Icons.add_circle,
                            size: 55,
                            color: Colors.white,
                          ))
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getColorForItem(int item) {
    switch (item %15) {
      case 0:
        return Color(0xFF59B35C);
      case 1:
        return Color(0xFF159C90);
      case 2:
        return Color(0xFF14BED4);
      case 3:
        return Color(0xFF17ACF0);
      case 4:
        return Color(0xFF319BF0);
      case 5:
        return Color(0xFF4E5EB8);
      case 6:
        return Color(0xFF7149BA);
      case 7:
        return Color(0xFFA237B4);
      case 8:
        return Color(0xFFE7306E);
      case 9:
        return Color(0xFFF15146);
      case 10:
        return Color(0xFFFB6333);
      case 11:
        return Color(0xFFFB9E14);
      case 12:
        return Color(0xFFFBC31A);
      case 13:
        return Color(0xFFFBE949);
      case 14:
        return Color(0xFFCEDB47);
      case 15:
        return Color(0xFF92C558);
      default:
        return Colors.black;
    }
  }
}