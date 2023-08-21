import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';

import '../widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
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
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Container(
                                  alignment: Alignment.center,
                                  width: 60,
                                  height: 60,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.buttonBackground),
                                  child: Text("${index + 1}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                )),
                      )
                    ]),
              )),
        ],
      ),
    ));
  }
}
