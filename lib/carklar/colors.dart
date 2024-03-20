import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quickalert/quickalert.dart';
import 'package:rxdart/rxdart.dart';

class colors extends StatefulWidget {
  const colors({Key? key}) : super(key: key);

  @override
  _colorsState createState() => _colorsState();
}

class _colorsState extends State<colors> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  Orientation? _currentOrientation;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
            ), // Ekran yüksekliğinin %10'u),
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
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.loading,
                    title: "${rewards}",
                    text: 'Kararınız Belli Oldu',
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
