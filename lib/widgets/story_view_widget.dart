import 'package:dashed_circle/dashed_circle.dart';
import 'package:flutter/material.dart';

class StoryViewWidget extends StatefulWidget {
  const StoryViewWidget({Key? key}) : super(key: key);

  @override
  _StoryViewWidgetState createState() => _StoryViewWidgetState();
}

class _StoryViewWidgetState extends State<StoryViewWidget> with TickerProviderStateMixin {

  late Animation gap;
  late Animation<double> base;
  late Animation<double> reverse;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: const Duration(seconds: 4));
    base = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    reverse = Tween<double>(begin: 0.0, end: -1.0).animate(base);
    gap = Tween<double>(begin: 0.0, end: 3.0).animate(base)
      ..addListener(() {
        setState(() {});
      });
  }

  /// Dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        controller.forward().whenComplete((){
          print("animation completed");
        });
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        child: RotationTransition(
          turns: base,
          child: DashedCircle(
            gapSize: gap.value,
            dashes: 40,
            color: const Color(0XFFED4634),
            child: RotationTransition(
              turns: reverse,
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    "data:image/png;base64,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"
                      // "https://64.media.tumblr.com/7c3fc9624caaf4b682fbe79f20e32c9e/35dc70d76d65d7fc-26/s250x400/890c088d49a589bff3452362d8f5a857d1c23dd4.pnj"
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
