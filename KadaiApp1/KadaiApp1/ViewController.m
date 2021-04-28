//
//  ViewController.m
//  KadaiApp1
//
//  Created by j-kugizaki on 2021/04/27.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonAction:(UIButton *)sender {
    _label.text = @"押された！";
}

@end
