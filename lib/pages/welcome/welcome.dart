import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/text_widgets.dart';
import 'package:ulearning_app/pages/notifier/welcome_notifier.dart';
import 'package:ulearning_app/pages/welcome/widgets.dart';

class Welcome extends ConsumerWidget {
  Welcome({super.key});
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexDotProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.only(top: 30),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // Showing our three welcome pages
                PageView(
                  controller: _controller,
                  scrollDirection: Axis.horizontal,
                  children: [
                    // first page
                    appOnboardingPage(
                      controller: _controller,
                      index: 1,
                      imagePath: "assets/images/reading.png",
                      title: "First See Learning",
                      subTitle:
                          "Forget about the paper, now learnin all in one place",
                      context: context,
                    ),

                    // second page
                    appOnboardingPage(
                      controller: _controller,
                      index: 2,
                      imagePath: "assets/images/man.png",
                      title: "Connect with Everyone",
                      subTitle:
                          "Always keep in touch with your tutor and friends. Let's get connected",
                      context: context,
                    ),

                    appOnboardingPage(
                      controller: _controller,
                      index: 3,
                      imagePath: "assets/images/boy.png",
                      title: "Always Facinated Learning",
                      subTitle:
                          "Anywhere, anytime. The tie is at your discretion. So study wherever you can",
                      context: context,
                    ),
                  ],
                  onPageChanged: (value) {
                    ref.read(indexDotProvider.notifier).changeIndex(value);
                  },
                ),
                Positioned(
                  child: DotsIndicator(
                    position: index,
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(24.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                  bottom: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
