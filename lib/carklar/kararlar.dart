import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rxdart/rxdart.dart';

class kararlar extends StatefulWidget {
  const kararlar({Key? key}) : super(key: key);

  @override
  _kararlarState createState() => _kararlarState();
}

class _kararlarState extends State<kararlar> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  Orientation? _currentOrientation;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';
  final selected = BehaviorSubject<int>();
  TextEditingController textFieldController = TextEditingController();

  String rewards = "";
  bool _isPressed = false;

  List<String> items = [];

  @override
  void dispose() {
    selected.close();
    _bannerAd?.dispose();
    textFieldController.dispose();
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
          "Kararın Ne?",
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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height *0.07,),
                    SizedBox(
                      height: 380,
                      child: (items.length > 1)
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
                                          color: _getColorForItem(
                                              items.indexOf(item)),
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
                              child: Text(
                                "2 Seçenek Girince Çark Oluşacaktır",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
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
            Container(
              child: OrientationBuilder(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForItem(int item) {
    switch (item % 4) {
      case 0:
        return Color(0xFF3BAE69);
      case 1:
        return Color(0xFF678CC8);
      case 2:
        return Color(0xFFDA5B5B);
      case 3:
        return Color(0xFFEFC25F);
      default:
        return Colors.black;
    }
  }

  void reklam() {}
}
