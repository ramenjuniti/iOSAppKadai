//
//  BannerViewController.m
//  KadaiApp2
//
//  Created by j-kugizaki on 2021/04/28.
//
#import "BannerViewController.h"
#import <FluctSDK/FluctSDK.h>

@interface BannerViewController () <FSSAdViewDelegate>
@property (nonatomic) FSSAdView *adView;
@end

@implementation BannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Viewの生成
    FSSAdView *adView = [[FSSAdView alloc] initWithGroupId:@"1000055927" unitId:@"1000084701" adSize:FSSAdSize320x50];
    adView.delegate = self;
    [self.view addSubview:adView];

    // 広告の読み込み
    // addSubviewした後にloadAd()を実行してください
    [adView loadAd];
    self.adView = adView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    // 画面下、中央に表示するため座標計算
    CGFloat adViewHeight = CGRectGetHeight(self.adView.frame);
    CGFloat maxY = CGRectGetMaxY(self.view.bounds);
    CGFloat adViewY = maxY - self.view.layoutMargins.bottom - adViewHeight;

    CGFloat midX = CGRectGetMidX(self.view.bounds);
    CGFloat adViewX = midX - CGRectGetWidth(self.adView.frame) * 0.5;

    CGRect adViewFrame = self.adView.frame;
    adViewFrame.origin = CGPointMake(adViewX, adViewY);
    self.adView.frame = adViewFrame;
}

#pragma mark - FSSAdViewDelegate

- (void)adViewDidStoreAd:(FSSAdView *)adView {
    NSLog(@"広告表示が完了しました");
}

- (void)adView:(FSSAdView *)adView didFailToStoreAdWithError:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);
    FSSAdViewError fluctError = error.code;
    switch (fluctError) {
        case FSSAdViewErrorUnknown:
            NSLog(@"Unkown Error");
            break;
        case FSSAdViewErrorNotConnectedToInternet:
            NSLog(@"ネットワークエラー");
            break;
        case FSSAdViewErrorServerError:
            NSLog(@"サーバーエラー");
            break;
        case FSSAdViewErrorNoAds:
            NSLog(@"表示する広告がありません");
            break;
        case FSSAdViewErrorBadRequest:
            NSLog(@"グループID / ユニットID / 登録されているbundleのどれかが間違っています");
            break;
        default:
            NSLog(@"Unkown Error");
            break;
    }
}

- (void)willLeaveApplicationForAdView:(FSSAdView *)adView {
    NSLog(@"広告へ遷移します");
}

@end
