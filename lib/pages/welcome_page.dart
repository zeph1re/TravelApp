import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["welcome_one.png", "welcome_two.png", "welcome_three.png"];
  List text = ["Trips", "Mountain"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            itemBuilder: (_, index) => Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 12, 65, 39),
                      image: DecorationImage(
                        image: AssetImage('img/' + images[index]),
                      )),
                  child: Container(
                    margin: EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: "Trips",
                              color: Colors.white,
                            ),
                            AppText(
                              text: "Mountain",
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child: AppText(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            ResponsiveButton(width: 100)
                          ],
                        )
                      ],
                    ),
                  ),
                )));
  }
}
