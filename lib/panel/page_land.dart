part of 'page_portrait.dart';

class PageLand extends StatefulWidget {
  const PageLand({Key? key}) : super(key: key);

  @override
  State<PageLand> createState() => _PageLandState();
}

class _PageLandState extends State<PageLand> {
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
    var height = MediaQuery.of(context).size.height;
    height -= MediaQuery.of(context).viewInsets.vertical;
    return SizedBox.expand(
      child: Container(
        color: BACKGROUND_COLOR,
        child: Padding(
          padding: MediaQuery.of(context).padding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Spacer(),
                    SystemButtonGroup(),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, bottom: 40),
                      child: DropButton(),
                    )
                  ],
                ),
              ),
              _ScreenDecoration(child: Screen.fromHeight(height * 0.87)),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    DirectionController(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

