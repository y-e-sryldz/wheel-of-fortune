import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class kararlar extends StatefulWidget {
  const kararlar({Key? key}) : super(key: key);

  @override
  _kararlarState createState() => _kararlarState();
}

class _kararlarState extends State<kararlar> {
  final selected = BehaviorSubject<int>();
  TextEditingController textFieldController = TextEditingController();

  String rewards = "";

  List<String> items = ["a", "b"];

  @override
  void dispose() {
    selected.close();
    textFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Örnek bir öğe ekleme
    items.add("Öğe 1");
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
          "Kararlar",
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
                  child: items.isNotEmpty
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Kazanan: $rewards")),
                            );
                          },
                        )
                      : Center(
                          child: Text("Lütfen en az bir öğe ekleyin"),
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
                          
                            color: Colors
                                .black, // Set a contrasting color for better readability
                            fontWeight: FontWeight
                                .bold, // Make text bolder for emphasis (optional)
                          ),
                          controller: textFieldController,
                          
                          decoration: InputDecoration(
                            filled: true,
                            fillColor:
                                Colors.white, // Set a clean background color
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Add rounded corners
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  width: 1.0), // Customize border
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            // Girilen metni items listesine ekle
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
    switch (item % 4) {
      case 0:
        return Color(0xFFDA5B5B);
      case 1:
        return Color(0xFF678CC8);
      case 2:
        return Color(0xFF3BAE69);
      case 3:
        return Color(0xFFEFC25F);
      default:
        return Colors.black;
    }
  }
}
