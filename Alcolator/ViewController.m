//
//  ViewController.m
//  Alcolator
//
//  Created by Rohan on 12/11/14.
//  Copyright (c) 2014 Rohan Khara. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()  <UITextFieldDelegate>

@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;


@end




@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set our primary view's background color to lightGrayColor
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    // Tells the text field that `self`, this instance of `BLCViewController` should be treated as the text field's delegate
    self.beerPercentTextField.delegate = self;
    self.beerPercentTextField.backgroundColor = [UIColor blueColor];
    self.beerPercentTextField.font = [UIFont fontWithName:@"Arial" size:15];
    
    // Set the placeholder text
    self.beerPercentTextField.placeholder = NSLocalizedString(@"% Alcohol Content Per Beer", @"Beer percent placeholder text");
    
    // Tells `self.beerCountSlider` that when its value changes, it should call `[self -sliderValueDidChange:]`.
    // This is equivalent to connecting the IBAction in our previous checkpoint
    [self.beerCountSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    
    // Set the minimum and maximum number of beers
    self.beerCountSlider.minimumValue = 1;
    self.beerCountSlider.maximumValue = 10;
    
    // Tells `self.calculateButton` that when a finger is lifted from the button while still inside its bounds, to call `[self -buttonPressed:]`
    [self.calculateButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    // Set the title of the button
    [self.calculateButton setTitle:NSLocalizedString(@"Calculate!", @"Calculate command") forState:UIControlStateNormal];
    
    // Tells the tap gesture recognizer to call `[self -tapGestureDidFire:]` when it detects a tap.
    [self.hideKeyboardTapGestureRecognizer addTarget:self action:@selector(tapGestureDidFire:)];
    
    // Gets rid of the maximum number of lines on the label
    self.resultLabel.numberOfLines = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) loadView

{

    //Allocate and initialize the all-encompassing view
    self.view = [UIView new];
    
    // Allocate and initialize each of our views and the gesture recognizer
    UITextField *textField = [UITextField new];
    UILabel *label = [UILabel new];
    UISlider *slider = [UISlider new];
    UIButton *button = [UIButton new];
    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
    
    // Add each view and the gesture recognizer as the view's subviews
    [self.view addSubview:textField];
    [self.view addSubview:label];
    [self.view addSubview:button];
    [self.view addSubview:slider];
    [self.view addGestureRecognizer:tap];
    
    // Assigning the views & gesture recognizer to our properties
    
    self.beerCountSlider = slider;
    self.beerPercentTextField = textField;
    self.resultLabel = label;
    self.calculateButton = button;
    self.hideKeyboardTapGestureRecognizer = tap;
    
}


- (void) viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
//    self.view.frame.size.width
  //  self.view.frame.size.height
    
   /* CGFloat viewWidth, padding, itemWidth, itemHeight;
    
    if((self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft) || (self.interfaceOrientation == UIInterfaceOrientationLandscapeRight))
    {
        
        CGFloat viewWidth = 480;
        CGFloat padding = 10;
        CGFloat itemWidth = viewWidth - padding - padding;
        CGFloat itemHeight = 44;
        
    }
    
    else
    {
        
        CGFloat viewWidth = 320;
        CGFloat padding = 20;
        CGFloat itemWidth = viewWidth - padding - padding;
        CGFloat itemHeight = 44;
        
    }
    
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
        
    {
             change values
    }
    
    else
        
    {
    
    
    } */
        
    
        
    
    
   CGFloat viewWidth = 320;
    CGFloat padding = 20;
    CGFloat itemWidth = viewWidth - padding - padding;
    CGFloat itemHeight = 44;
    
    self.beerPercentTextField.frame = CGRectMake(padding, padding, itemWidth, itemHeight);
    
    CGFloat bottomOfTextField = CGRectGetMaxY(self.beerPercentTextField.frame);
    self.beerCountSlider.frame = CGRectMake(padding, bottomOfTextField + padding, itemWidth, itemHeight);
    
    CGFloat bottomOfSlider = CGRectGetMaxY(self.beerCountSlider.frame);
    self.resultLabel.frame = CGRectMake(padding, bottomOfSlider + padding, itemWidth, itemHeight * 4);
    
    CGFloat bottomOfLabel = CGRectGetMaxY(self.resultLabel.frame);
    self.calculateButton.frame = CGRectMake(padding, bottomOfLabel + padding, itemWidth, itemHeight);
}

- (void)textFieldDidChange:(UITextField *)sender

{
    
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0)
    
    {
        // The user typed 0, or something that's not a number, so clear the field
        sender.text = nil;
    
    }
    
}


- (void)sliderValueDidChange:(UISlider *)sender
    
{
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
   // NSString *resultText2 = [NSString stringWithFormat:@"%f", self.beerCountSlider.value];
    // self.realTimeSliderValue.text = resultText2;
    
}


- (void)buttonPressed:(id)sender

{
    [self.beerPercentTextField resignFirstResponder];
    
    // first, calculate how much alcohol is in all those beers...
    
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;  //assume they are 12oz beer bottles
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    // now, calculate the equivalent amount of wine...
    
    float ouncesInOneWineGlass = 5;  // wine glasses are usually 5oz
    float alcoholPercentageOfWine = 0.13;  // 13% is average
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassesForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    
    NSString *beerText;
    
    if (numberOfBeers == 1) {
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    NSString *wineText;
    
    if (numberOfWineGlassesForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    
    // generate the result text, and display it on the label
    
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText, numberOfWineGlassesForEquivalentAlcoholAmount, wineText];
    self.resultLabel.text = resultText;

    
    
}


- (void)tapGestureDidFire:(UITapGestureRecognizer *)sender
{
    
    [self.beerPercentTextField resignFirstResponder];
    
}


@end