import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tetris/admop.dart';
import 'package:tetris/main.dart';
import 'package:tetris/panel/controller.dart';
import 'package:tetris/panel/screen.dart';

part 'page_land.dart';
class PagePortrait extends StatefulWidget {
  const PagePortrait({Key? key}) : super(key: key);

  @override
  State<PagePortrait> createState() => _PagePortraitState();
}

class _PagePortraitState extends State<PagePortrait> {
  @override
  void initState(){
    super.initState();
    loadInterstitialAd();
    loadRewardVideoAd();
    rewardedAd.load();
    interstitialAd.load();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final screenW = size.width * 0.8;

    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Column(
            children: <Widget>[
              // Spacer(flex: 1,),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("༺ 𝕋𝕖𝕥𝕣𝕚𝕤 𝟜𝕌 ༻",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white,fontStyle: FontStyle.italic),),
              ),
              _ScreenDecoration(child: Screen(width: screenW)),
              Spacer(flex: 2),
              GameController(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScreenDecoration extends StatelessWidget {
  final Widget child;

  const _ScreenDecoration({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
              color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          left: BorderSide(
              color: const Color(0xFF987f0f), width: SCREEN_BORDER_WIDTH),
          right: BorderSide(
              color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
          bottom: BorderSide(
              color: const Color(0xFFfae36c), width: SCREEN_BORDER_WIDTH),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black54)),
        child: Container(
          padding: const EdgeInsets.all(3),
          color: SCREEN_BACKGROUND,
          child: child,
        ),
      ),
    );
  }
}
