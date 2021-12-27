import 'package:arcore_flutter_plugin_example/screens/drone_detect_plane.dart';
import 'package:arcore_flutter_plugin_example/screens/utka_detect_plane.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  Widget item({@required Image child, @required Function onPressed}) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: child,
      ),
    );
  }

  BoxDecoration decoration = const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Color(0xffBE6CFF),
        Color(0xff2ED2E9),
      ],
    ),
  );

  Widget appBar = Padding(
    padding: const EdgeInsets.only(left: 16.0),
    child: SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          RichText(
              text: const TextSpan(
                text: "",
                style: TextStyle(fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                    text: "Оживи\nУтк",
                    // textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: " у",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                      color: Colors.amber,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            width: 28,
            height: 100,
          ),
          Positioned(
            top: 0,
            right: -36,
            child: Image.asset(
              'assets/images/duck.png',
              height: 100,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: const EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: NavbarButton(
                onPressed: () {},
                icon: const Icon(
                  Ionicons.cube_outline,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: NavbarButton(
                onPressed: () {},
                icon: const Icon(
                  Ionicons.qr_code_outline,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
      // appBar: AppBar(),
      body: Container(
        decoration: decoration,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                appBar,
                const Expanded(child: SizedBox()),
                SizedBox(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                      viewportFraction: 0.65,
                      aspectRatio: 2.5 / 2,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      item(
                        child: Image.asset("assets/images/drone.gif"),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => DroneDetectPlane()));

                        },
                      ),
                      item(
                        child: Image.asset("assets/TocoToucan.gif"),
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => UtkaDetectPlane()));

                        },
                      ),
                      item(
                        child: Image.asset(
                          "assets/images/unicorn.png",
                          width: 100,
                        ),
                        onPressed: () {
                          //TODO: implement logic
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 71,
                ),
                const Expanded(
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavbarButton extends StatelessWidget {
  const NavbarButton({Key key, @required this.onPressed, @required this.icon})
      : super(key: key);
  final Function onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      borderRadius: BorderRadius.circular(12.0),
      onPressed: onPressed(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white.withOpacity(0.8),
        ),
        height: 55,
        child: icon,
      ),
    );
  }
}