import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nexus/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final TextStyle textStyle = const TextStyle(
      color: kMainColor, fontSize: 18, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              isLastPage = (index == 2);
            });
          },
          children: [
            Container(
              color: kBackgroundColor,
              child: Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/onBoardingOne.svg",
                        height: 300,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(23),
                        child: Text(
                          ' "Nexus" a central point linking many things together. We strive to make your life easier and have all your important events in one place',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kMainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: kBackgroundColor,
              child: Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/onBoardingTwo.svg",
                        height: 300,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(23),
                        child: Text(
                          ' Get connected with your friends and make new ones',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kMainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: kBackgroundColor,
              child: Center(
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        "assets/onBoardingThree.svg",
                        height: 300,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(23),
                        child: Text(
                          ' All from the comfort of your own anywhere!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kMainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: kBackgroundColor,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: isLastPage
              ? Center(
                  child: Text(
                    "Get Started",
                    style: textStyle,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(2,
                            curve: Curves.easeInOut,
                            duration: const Duration(milliseconds: 300));
                      },
                      child: Text(
                        "Skip",
                        style: textStyle,
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        effect: const WormEffect(
                          spacing: 16,
                          dotHeight: 12,
                          dotWidth: 12,
                          dotColor: kSecondaryColor,
                          activeDotColor: kMainColor,
                        ),
                        onDotClicked: (index) => _controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut);
                      },
                      child: Text(
                        "Next",
                        style: textStyle,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
