import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:draw_app/screens/select_wheel.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rxdart/rxdart.dart'; // Assuming this is the correct path

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  String rewards = "";

  final selected = BehaviorSubject<int>();

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/arka_plan.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: FortuneWheel(
                    selected: selected.stream,
                    animateFirst: false,
                    items: items
                        .map((item) => FortuneItem(
                              child: Text(
                                item,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 0.1,
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
                Text(
                  'Neyi Seçmeli ?',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  height: 222,
                  width: 360,
                  decoration: BoxDecoration(
                    color: Colors.white
                        .withOpacity(0.4), // Arka planı şeffaf beyaz yap
                    borderRadius:
                        BorderRadius.circular(30), // Kenarları yuvarla
                  ),
                  padding: EdgeInsets.all(20), // Kenar boşlukları ayarla
                  child: Column(
                    children: [
                      Text(
                        "Eğer bir secim yapmak zorundaysan ve\n"
                        "birden cok secenek varsa bunu sansa bırak!",
                        style: GoogleFonts.permanentMarker(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Text(
                        "Hangi Restoran?, Hangi Numara?, Ne Yemeli...\n"
                        "Limitleri sen koy!",
                        style: GoogleFonts.permanentMarker(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => select_wheel()),
                    );
                  },
                  child: Container(
                    height: 55,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurpleAccent.withOpacity(0.40),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'BAŞLA',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
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
