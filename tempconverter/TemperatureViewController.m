//
//  TemperatureViewController.m
//  tempconverter
//
//  Created by Eric Hung on 1/10/14.
//  Copyright (c) 2014 Eric Hung. All rights reserved.
//

#import "TemperatureViewController.h"

@interface TemperatureViewController ()
- (IBAction)onViewTapped:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
- (IBAction)onCelsiusValueChanged:(id)sender;
- (IBAction)onFahrenheitValueChanged:(id)sender;
- (IBAction)convertButtonClicked:(id)sender;
@end

@implementation TemperatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFahrenheitValueChanged:(id)sender{
    self.celsiusTextField.text = @"";
}

- (IBAction)convertButtonClicked:(id)sender {
    if (self. celsiusTextField.text.length > 0) {
        float celsius = [self.celsiusTextField.text floatValue];
        float factor = 9.0f/5;
        NSLog(@"%f", factor);
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%f", celsius*factor+32] ;
    } else if (self.fahrenheitTextField.text.length > 0) {
        float factor2 = 5.0f/9;
                        NSLog(@"%f", factor2);
        float fahrenheit = [self.fahrenheitTextField.text floatValue] - 32;
        self.celsiusTextField.text = [NSString stringWithFormat:@"%f", fahrenheit * factor2];
    }
}

- (IBAction)onCelsiusValueChanged:(id)sender{
    self.fahrenheitTextField.text = @"";
}
- (IBAction)onViewTapped:(id)sender {
    [self.view endEditing:YES];
}
@end
