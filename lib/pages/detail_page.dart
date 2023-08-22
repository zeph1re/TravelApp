import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/cubit/app_cubits.dart';
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
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        print(detail.place.toString());
        return Scaffold(
            body: SizedBox(
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
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                          fit: BoxFit.cover)),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  )),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
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
                              text: detail.place.location,
                              color: Colors.black45.withOpacity(0.8),
                              size: 22,
                            ),
                            AppLargeText(
                              text: "\$ " + detail.place.price.toString(),
                              color: AppColors.mainColor,
                              size: 20,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_pin),
                            AppText(
                                text: detail.place.location.toString(),
                                color: AppColors.textColor1)
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(
                                        Icons.star,
                                        color: detail.place.stars > index
                                            ? AppColors.starColor
                                            : Colors.grey.withOpacity(0.6),
                                      )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppText(
                                text: "(${detail.place.stars},0)",
                                color: AppColors.textColor1)
                          ],
                        ),
                        const SizedBox(
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
                        const SizedBox(
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
                              size: 50,
                              borderColor: AppColors.buttonBackground,
                            ),
                          ),
                        )),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          size: 25,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppText(text: detail.place.description)
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
      },
    );
  }
}
