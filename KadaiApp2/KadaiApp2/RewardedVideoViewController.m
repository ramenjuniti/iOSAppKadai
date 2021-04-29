//
//  RewardedVideoViewController.m
//  KadaiApp2
//
//  Created by j-kugizaki on 2021/04/28.
//

#import "RewardedVideoViewController.h"
@import FluctSDK;

static NSString *const kRewardedVideoGroupID = @"1000083204";
static NSString *const kRewardedVideoUnitID = @"1000124351";

@interface RewardedVideoViewController () <FSSRewardedVideoDelegate>
@property (weak, nonatomic) IBOutlet UIButton *showButton;
@end

@implementation RewardedVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // デリゲート設定
    FSSRewardedVideo.sharedInstance.delegate = self;
}

- (IBAction)didTouchUpLoadAd:(id)sender {
    // 動画リワード広告の読み込み
    [FSSRewardedVideo.sharedInstance loadRewardedVideoWithGroupId:kRewardedVideoGroupID unitId:kRewardedVideoUnitID];
}

- (IBAction)didTouchUpShowAd:(id)sender {
    // 動画リワード広告が表示可能か確認
    if ([FSSRewardedVideo.sharedInstance hasAdAvailableForGroupId:kRewardedVideoGroupID unitId:kRewardedVideoUnitID]) {
        // 動画リワード広告の表示
        [FSSRewardedVideo.sharedInstance presentRewardedVideoAdForGroupId:kRewardedVideoGroupID
                                                                   unitId:kRewardedVideoUnitID
                                                       fromViewController:self];
    }
}

#pragma mark FSSRewardedVideoDelegate

- (void)rewardedVideoDidLoadForGroupID:(NSString *)groupId unitId:(NSString *)unitId {
    NSLog(@"rewarded video ad did load");
    self.showButton.enabled = YES;
}

- (void)rewardedVideoShouldRewardForGroupID:(NSString *)groupId unitId:(NSString *)unitId {
    NSLog(@"should rewarded for app user");
    self.showButton.enabled = NO;
}

- (void)rewardedVideoDidFailToLoadForGroupId:(NSString *)groupId unitId:(NSString *)unitId error:(NSError *)error {
    // refs: error code list are FSSVideoError.h
    NSLog(@"rewarded video ad load failed. Because %@", error);
}

- (void)rewardedVideoWillAppearForGroupId:(NSString *)groupId unitId:(NSString *)unitId {
    NSLog(@"rewarded video ad will appear");
}

- (void)rewardedVideoDidAppearForGroupId:(NSString *)groupId unitId:(NSString *)unitId {
    NSLog(@"rewarded video ad did appear");
}

- (void)rewardedVideoWillDisappearForGroupId:(NSString *)groupId unitId:(NSString *)unitId {
    NSLog(@"rewarded video ad will disappear");
}

- (void)rewardedVideoDidDisappearForGroupId:(NSString *)groupId unitId:(NSString *)unitId {
    NSLog(@"rewarded video ad did disappear");
}

- (void)rewardedVideoDidFailToPlayForGroupId:(NSString *)groupId unitId:(NSString *)unitId error:(NSError *)error {
    // refs: error code list are FSSVideoError.h
    NSLog(@"rewarded video ad play failed. Because %@", error);
}

@end
