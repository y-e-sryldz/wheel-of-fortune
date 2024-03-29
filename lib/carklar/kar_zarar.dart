import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:rxdart/rxdart.dart';

class kar_zarar extends StatefulWidget {
  const kar_zarar({Key? key}) : super(key: key);

  @override
  _kar_zararState createState() => _kar_zararState();
}

class _kar_zararState extends State<kar_zarar> {
  BannerAd? _bannerAd;
  bool _isLoaded = false;
  Orientation? _currentOrientation;

  final String _adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/9214589741'
      : 'ca-app-pub-3940256099942544/2435281174';
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
          "Kim Karlı?",
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
                        rewards = "+1000";
                        break;
                      case 8:
                        rewards = "+5000";
                        break;
                      case 9:
                        rewards = "+10000";
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
                        rewards = "-1000";
                        break;
                      case 18:
                        rewards = "-5000";
                        break;
                      case 19:
                        rewards = "-10000";
                        break;
                      default:
                        rewards = "Hataaa";
                    }
                  });
                  if (rewards == "Hiçbir şey")
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.info,
                      title: "${rewards}",
                      text: 'Kararınız Belli Oldu',
                      confirmBtnText: "Tamam",
                      confirmBtnColor: Colors.green,
                    );
                  if (int.parse(rewards) > 0)
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      title: "${rewards}",
                      text: 'Kararınız Belli Oldu',
                      confirmBtnText: "Tamam",
                      confirmBtnColor: Colors.green,
                    );
                  if (int.parse(rewards) < 0)
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
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
