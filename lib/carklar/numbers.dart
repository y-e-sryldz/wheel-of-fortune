import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rxdart/rxdart.dart';

class numbers extends StatefulWidget {
  const numbers({super.key});

  @override
  State<numbers> createState() => _numbersState();
}

class _numbersState extends State<numbers> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  Orientation? _currentOrientation;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';
  final selected = BehaviorSubject<int>();
  int rewards = 0;

  List<int> items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void dispose() {
    selected.close();
    _bannerAd?.dispose();
    super.dispose();
  }

  void _loadAd() async {
    final size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
        MediaQuery.sizeOf(context).width.truncate());

    if (size == null) {
      print("Bağlantılı banner'ın genişliği alınamıyor.");
      return;
    }

    BannerAd bannerAd = BannerAd(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      size: size,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("Bir reklam başarıyla alındığında çağrılır.");
          setState(() {
            _bannerAd = ad as BannerAd;
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print("Bir reklam isteği başarısız olduğunda çağrılır.");
          ad.dispose();
        },
        onAdOpened: (Ad ad) {},
        onAdClosed: (Ad ad) {},
        onAdImpression: (Ad ad) {},
      ),
    );

    bannerAd.load();
  }

  @override
  void initState() {
    super.initState();
    _loadAd();
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
          "Hangi Rakam?",
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.13,), // Ekran yüksekliğinin %10'u),
            SizedBox(
              height: 380,
              child: FortuneWheel(
                selected: selected.stream,
                animateFirst: false,
                items: [
                  FortuneItem(
                    child: Text(
                      "1",
                      style: TextStyle(
                        color: Color(0xFF15526D),
                        fontSize: 35,
                      ),
                    ),
                    style: FortuneItemStyle(
                      color: Color(0xFFF191B2),
                      borderWidth: 0,
                    ),
                  ),
                  FortuneItem(
                    child: Text("2",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFFA1B4BD), borderWidth: 0),
                  ),
                  FortuneItem(
                    child: Text("3",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFFAD8679), borderWidth: 0),
                  ),
                  FortuneItem(
                    child: Text("4",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFFFBC87D), borderWidth: 0),
                  ),
                  FortuneItem(
                    child: Text("5",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFFFBF6C9), borderWidth: 0),
                  ),
                  FortuneItem(
                    child: Text("6",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFFC6E0A9), borderWidth: 0),
                  ),
                  FortuneItem(
                    child: Text("7",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFF15DAC7), borderWidth: 0),
                  ),
                  FortuneItem(
                    child: Text("8",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFF72CFF8), borderWidth: 0),
                  ),
                  FortuneItem(
                    child: Text("9",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                      color: Color(0xFF919CD6),
                      borderWidth: 0,
                    ),
                  ),
                  FortuneItem(
                    child: Text("10",
                        style: TextStyle(
                            color: Color(0xFF15526D), fontSize: 35)),
                    style: FortuneItemStyle(
                        color: Color(0xFFCA68DA), borderWidth: 0),
                  ),
                ],
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
              ),
            ),
            SizedBox(
                height:
                    10), // Add some space between the wheel and the button
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
            Expanded(child: Container()),
            OrientationBuilder(
              builder: (context, orientation) {
                if (_currentOrientation != orientation) {
                  _isLoaded = false;
                  _loadAd();
                  _currentOrientation = orientation;
                }

                return Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50, // Örnek olarak 50 birimlik bir yükseklik
                    child: _bannerAd != null && _isLoaded
                        ? SafeArea(
                            child: AdWidget(ad: _bannerAd!),
                          )
                        : SizedBox.shrink(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
