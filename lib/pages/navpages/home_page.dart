import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "kayaking.png": "Kayaking",
    "hiking.png": "Hiking",
    "balloning.png": "Balloning",
    "snorkling.png": "Snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 30, color: Colors.black54),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.withOpacity(0.5)),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: AppLargeText(
                text: "Discover",
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            //Tab Bar
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey.withOpacity(0.5),
                    labelPadding: const EdgeInsets.only(left: 20, right: 20),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: Colors.transparent,
                    indicator: CircleTabIndicator(
                        color: AppColors.mainColor, radius: 4),
                    controller: tabController,
                    tabs: [
                      const Tab(
                        text: "Places",
                      ),
                      const Tab(
                        text: "Inspiration",
                      ),
                      const Tab(
                        text: "Emotions",
                      ),
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(left: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("img/mountain.jpeg"),
                                fit: BoxFit.cover)),
                      );
                    },
                  ),
                  const Text("There"),
                  const Text("Hello"),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppLargeText(
                    text: "Explore More",
                    size: 22,
                  ),
                  AppText(
                    text: "See All",
                    color: AppColors.textColor1,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
                height: 120,
                width: double.maxFinite,
                // decoration: BoxDecoration(color: Colors.red),
                child: ListView.builder(
                  itemCount: 4,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 30),
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "img/${images.keys.elementAt(index)}"),
                                    fit: BoxFit.cover)),
                          ),
                          AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor1,
                          )
                        ]);
                  },
                ))
          ],
        ),
      ]),
    );
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
