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
  List images = ["welcome-one.png", "welcome-two.png", "welcome-three.png"];
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
                          fit: BoxFit.cover)),
                  child: Container(
                    margin:
                        const EdgeInsets.only(top: 150, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppLargeText(
                              text: "Trips",
                            ),
                            AppText(
                              text: "Mountain",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 250,
                              child: AppText(
                                text:
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                                size: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            ResponsiveButton(width: 120)
                          ],
                        ),
                        Column(
                          children: List.generate(
                              images.length,
                              (index) => Container(
                                    width: 8,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: AppColors.mainColor),
                                  )),
                        )
                      ],
                    ),
                  ),
                )));
  }
}
