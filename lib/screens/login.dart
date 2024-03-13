import 'package:draw_app/screens/select_wheel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/arka_plan.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.center, // Öğeleri yatay olarak ortalamak için
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Neyi Seçmeli ?',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Eğer bir seçim yapmak  zorundaysan ve\nbirden  çok seçenek varsa bunu şansa bırak!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Hangi Restoran?, Hangi Numara?, Ne Yemeli...\nLimitleri sen koy!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => select_wheel()));
                  },
                  icon: Icon(
                    CupertinoIcons.play_arrow,
                    size: 80,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
