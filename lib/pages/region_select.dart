import 'package:flutter/material.dart';

import '../funcs/mybar.dart';

class ChooseRegion extends StatelessWidget {
  const ChooseRegion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double boxheight = 50;
    return Scaffold(
        appBar: myBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < districtList.length; i++)
                cardRegion(context, boxheight, districtList[i]),
            ],
          ),
        ));
  }

  Card cardRegion(BuildContext context, double boxheight, String? text) {
    return Card(
      color: Colors.amber,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Column(
                children: [
                  SizedBox(
                    height: boxheight,
                  ),
                  Text(
                    text!,
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: boxheight,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> districtList = [
  "Qoraqalpog\'iston R.",
  "Andijon",
  "Buxoro",
  "Jizzax",
  "Qashqadaryo",
  "Navoiy",
  "Namangan ",
  "Samarqand ",
  "Surxondaryo ",
  "Sirdaryo",
  "Toshkent",
  "Farg\'ona",
  "Xorazm"
];
