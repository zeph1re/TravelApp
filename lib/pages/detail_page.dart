import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_buttons.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/responsive_button.dart';

import '../widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("img/mountain.jpeg"),
                      fit: BoxFit.fitWidth)),
            ),
          ),
          Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  )
                ],
              )),
          Positioned(
            top: 320,
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Yosemite",
                          color: Colors.black45.withOpacity(0.8),
                        ),
                        AppLargeText(
                          text: "\$ 250",
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        AppText(
                            text: "USA, California",
                            color: AppColors.textColor1)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Wrap(
                          children: List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: gottenStars > index
                                        ? AppColors.starColor
                                        : Colors.grey.withOpacity(0.6),
                                  )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        AppText(text: "(4.0)", color: AppColors.textColor1)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.8),
                      size: 20,
                    ),
                    AppText(
                      text: "Number of people in your group",
                      color: AppColors.textColor1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                        children: List.generate(
                      5,
                      (index) => InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: AppButtons(
                          text: "${index + 1}",
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          backgroundColor: selectedIndex == index
                              ? Colors.black
                              : AppColors.buttonBackground,
                          size: 60,
                          borderColor: AppColors.buttonBackground,
                        ),
                      ),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.8),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppText(
                        text:
                            "Yosemite National Park is located in central Sierra Nevada in the US State of California. It is located newar the wild protected areas."),
                  ]),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                      isIcon: true,
                      icon: Icons.favorite_border_outlined,
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      size: 60,
                      borderColor: AppColors.textColor1),
                  ResponsiveButton(
                    isResponsive: true,
                    text: "Book Trip Now",
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
