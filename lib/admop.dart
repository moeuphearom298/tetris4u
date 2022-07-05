

import 'package:admob_flutter/admob_flutter.dart';

late AdmobInterstitial interstitialAd;
late AdmobReward rewardedAd;
int numberOfShowingAd=0;
String interstitialID="ca-app-pub-8946401470995130/4705604915";
String rewardID="ca-app-pub-8946401470995130/1797188785";
 void loadInterstitialAd(){interstitialAd = AdmobInterstitial(
    adUnitId: interstitialID,
    listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
      if (event == AdmobAdEvent.closed) interstitialAd.load();
      // handleEvent(event, args, 'Interstitial');
    },
   nonPersonalizedAds: true
  );

  }
  void loadRewardVideoAd(){
    rewardedAd = AdmobReward(
    adUnitId: rewardID,
    listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
      if (event == AdmobAdEvent.closed) rewardedAd.load();
      // handleEvent(event, args, 'Reward');
    },
      nonPersonalizedAds: true
  );

  }

  Future<void> showInterstitial() async {
    var isLoad=await interstitialAd.isLoaded;
    print("print $isLoad");
    if (isLoad!=true) {
      interstitialAd.load();
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }

    interstitialAd.show();

  }
  Future<void> showReward() async {
   var isLoad = await rewardedAd.isLoaded;
    if (!isLoad) {
      rewardedAd.load();
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    rewardedAd.show();
  }