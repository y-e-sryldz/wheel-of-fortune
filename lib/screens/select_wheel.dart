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
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/arka_plan.jpg"),
          fit: BoxFit.cover,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //URL
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 125,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 6, 85, 131),
                        borderRadius: BorderRadius.circular(
                            10), // Köşe yarıçapını ayarlayın
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withOpacity(0.2), // Gölgelendirme rengi
                            blurRadius: 10, // Gölgelendirme belirginliği
                            offset: Offset(0, 3), // Gölgenin konumu
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .link_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                            color: Colors.white,
                            size: 48, // İkonun boyutunu ayarlayabilirsiniz
                          ),
                          SizedBox(
                              height:
                                  8), // İkon ile metin arasında bir boşluk ekleyin
                          Text(
                            "URL",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16, // Metin boyutunu ayarlayabilirsiniz
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
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 85, 131),
                          borderRadius: BorderRadius.circular(
                              10), // Köşe yarıçapını ayarlayın
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Gölgelendirme rengi
                              blurRadius: 10, // Gölgelendirme belirginliği
                              offset: Offset(0, 3), // Gölgenin konumu
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .account_box_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                              color: Colors.white,
                              size: 48, // İkonun boyutunu ayarlayabilirsiniz
                            ),
                            SizedBox(
                                height:
                                    8), // İkon ile metin arasında bir boşluk ekleyin
                            Text(
                              "VCard",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, // Metin boyutunu ayarlayabilirsiniz
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Konum
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 85, 131),
                          borderRadius: BorderRadius.circular(
                              10), // Köşe yarıçapını ayarlayın
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Gölgelendirme rengi
                              blurRadius: 10, // Gölgelendirme belirginliği
                              offset: Offset(0, 3), // Gölgenin konumu
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .location_on_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                              color: Colors.white,
                              size: 48, // İkonun boyutunu ayarlayabilirsiniz
                            ),
                            SizedBox(
                                height:
                                    8), // İkon ile metin arasında bir boşluk ekleyin
                            Text(
                              "Konum",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, // Metin boyutunu ayarlayabilirsiniz
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 35,
                  ),
                  //wi-fi
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 85, 131),
                          borderRadius: BorderRadius.circular(
                              10), // Köşe yarıçapını ayarlayın
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Gölgelendirme rengi
                              blurRadius: 10, // Gölgelendirme belirginliği
                              offset: Offset(0, 3), // Gölgenin konumu
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .wifi_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                              color: Colors.white,
                              size: 48, // İkonun boyutunu ayarlayabilirsiniz
                            ),
                            SizedBox(
                                height:
                                    8), // İkon ile metin arasında bir boşluk ekleyin
                            Text(
                              "Wi-Fi",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, // Metin boyutunu ayarlayabilirsiniz
                              ),
                            ),
                          ],
                        ),
                      )),
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
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 85, 131),
                          borderRadius: BorderRadius.circular(
                              10), // Köşe yarıçapını ayarlayın
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Gölgelendirme rengi
                              blurRadius: 10, // Gölgelendirme belirginliği
                              offset: Offset(0, 3), // Gölgenin konumu
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .mail_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                              color: Colors.white,
                              size: 48, // İkonun boyutunu ayarlayabilirsiniz
                            ),
                            SizedBox(
                                height:
                                    8), // İkon ile metin arasında bir boşluk ekleyin
                            Text(
                              "E-Mail",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, // Metin boyutunu ayarlayabilirsiniz
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 35,
                  ),
                  //SMS
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 85, 131),
                          borderRadius: BorderRadius.circular(
                              10), // Köşe yarıçapını ayarlayın
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Gölgelendirme rengi
                              blurRadius: 10, // Gölgelendirme belirginliği
                              offset: Offset(0, 3), // Gölgenin konumu
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .sms_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                              color: Colors.white,
                              size: 48, // İkonun boyutunu ayarlayabilirsiniz
                            ),
                            SizedBox(
                                height:
                                    8), // İkon ile metin arasında bir boşluk ekleyin
                            Text(
                              "SMS",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, // Metin boyutunu ayarlayabilirsiniz
                              ),
                            ),
                          ],
                        ),
                      )),
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
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 85, 131),
                          borderRadius: BorderRadius.circular(
                              10), // Köşe yarıçapını ayarlayın
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Gölgelendirme rengi
                              blurRadius: 10, // Gölgelendirme belirginliği
                              offset: Offset(0, 3), // Gölgenin konumu
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .local_activity_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                              color: Colors.white,
                              size: 48, // İkonun boyutunu ayarlayabilirsiniz
                            ),
                            SizedBox(
                                height:
                                    8), // İkon ile metin arasında bir boşluk ekleyin
                            Text(
                              "Etkinlik",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, // Metin boyutunu ayarlayabilirsiniz
                              ),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    width: 35,
                  ),
                  //Metin
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 125,
                        width: 150,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 6, 85, 131),
                          borderRadius: BorderRadius.circular(
                              10), // Köşe yarıçapını ayarlayın
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.2), // Gölgelendirme rengi
                              blurRadius: 10, // Gölgelendirme belirginliği
                              offset: Offset(0, 3), // Gölgenin konumu
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons
                                  .file_copy_outlined, // İstediğiniz bir ikonu seçebilirsiniz
                              color: Colors.white,
                              size: 48, // İkonun boyutunu ayarlayabilirsiniz
                            ),
                            SizedBox(
                                height:
                                    8), // İkon ile metin arasında bir boşluk ekleyin
                            Text(
                              "Metin",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    16, // Metin boyutunu ayarlayabilirsiniz
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          ),
          ],
          
        ),
      ),
    );
  }
}
