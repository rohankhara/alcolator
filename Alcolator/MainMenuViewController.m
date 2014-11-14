//
//  MainMenuViewController.m
//  Alcolator
//
//  Created by Rohan on 12/11/14.
//  Copyright (c) 2014 Rohan Khara. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"

@interface MainMenuViewController ()
@property (weak, nonatomic) UIButton *mainCalculateButton1;
@property (weak, nonatomic) UIButton *mainCalculateButton2;

@end

@implementation MainMenuViewController

-(void) loadView
{
    self.view = [UIView new];
    //allocate & initialize the view
    UIButton *mainButton1 = [[UIButton alloc] init];
    UIButton *mainButton2 = [[UIButton alloc] init];
    
    //Add the view
    [self.view addSubview:mainButton1];
    [self.view addSubview:mainButton2];
    
    // assign the view to the properties
    self.mainCalculateButton1 = mainButton1;
    self.mainCalculateButton2 = mainButton2;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainCalculateButton1 addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
     [self.mainCalculateButton2 addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];

    [self.mainCalculateButton1 setTitle:NSLocalizedString(@"Wine", @"wine") forState:UIControlStateNormal];
    [self.mainCalculateButton2 setTitle:NSLocalizedString(@"Whiskey", @"whiskey") forState:UIControlStateNormal];
    
    self.mainCalculateButton1.backgroundColor = [UIColor blueColor];
    // self.mainCalculateButton1.font = [UIFont fontWithName:@"Arial" size:15];
    self.mainCalculateButton2.backgroundColor = [UIColor greenColor];
    // self.mainCalculateButton2.font = [UIFont fontWithName:@"Arial" size:15];
    

    
    
    // Do any additional setup after loading the view.
}



- (void) winePressed:(UIButton *) sender {
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

- (void) whiskeyPressed:(UIButton *) sender {
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
}


-(void) viewWillLayoutSubviews

{
    [super viewWillLayoutSubviews];

    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat padding = 20;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44;
    
    self.mainCalculateButton1.frame = CGRectMake(padding, (6*padding), itemWidth, itemHeight);
    
    CGFloat bottomOfButton = CGRectGetMaxY(self.mainCalculateButton1.frame);
    self.mainCalculateButton2.frame = CGRectMake(padding, bottomOfButton + padding, itemWidth, itemHeight);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
