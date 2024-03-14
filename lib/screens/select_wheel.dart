import 'package:draw_app/carklar/colors.dart';
import 'package:draw_app/carklar/kar_zarar.dart';
import 'package:draw_app/carklar/kararlar.dart';
import 'package:draw_app/carklar/letters.dart';
import 'package:draw_app/carklar/meals.dart';
import 'package:draw_app/carklar/numbers.dart';
import 'package:draw_app/carklar/profit_loss.dart';
import 'package:draw_app/carklar/yes_no.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class select_wheel extends StatefulWidget {
  const select_wheel({super.key});

  @override
  State<select_wheel> createState() => _select_wheelState();
}

class _select_wheelState extends State<select_wheel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Hangi Çark ?",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => kararlar()),
                          );
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/kararlar.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Kararın ne ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      //VCard
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const meals()),
                          );
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/yemekler.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Ne Yemeli ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const kar_zarar()),
                          );
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/kar_zarar.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Kim Karlı ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      //wi-fi
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const yes_no()),
                          );
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/evet_hayir.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "Evetmi  Hayırmı ?",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //E-Mail
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const numbers()),
                          );
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/rakamlar.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Hangi Rakam ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      //SMS
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const colors()),
                          );
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/renkler.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Hangi renk ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //etkinlik
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const profit_loss()),
                          );
                          ;
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/yazı_tura.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Yazımı Turamı ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      //Metin
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const letters()),
                          );
                        },
                        child: Container(
                          height: 225,
                          width: 170,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/harfler.png"),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Text(
                                  "Hangi Harf ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
