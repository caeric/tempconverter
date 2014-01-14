//
//  TemperatureViewController.m
//  tempconverter
//
//  Created by Eric Hung on 1/10/14.
//  Copyright (c) 2014 Eric Hung. All rights reserved.
//

#import "TemperatureViewController.h"

const static float CELSIUS_FACTOR = 9.0f/5;
const static float FAHRENHEIT_FACTOR = 5.0f/9;

@interface TemperatureViewController ()

@property (weak, nonatomic) IBOutlet UITextField *fahrenheitTextField;
@property (weak, nonatomic) IBOutlet UITextField *celsiusTextField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;

- (IBAction)onViewTapped:(id)sender;
- (IBAction)onCelsiusClick:(id)sender;
- (IBAction)onCelsiusValueChanged:(id)sender;
- (IBAction)onFahrenheitValueChanged:(id)sender;
- (IBAction)onFahrenheitClick:(id)sender;
- (IBAction)convertButtonClicked:(id)sender;
@end

@implementation TemperatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.fahrenheitTextField.delegate = self;
    self.celsiusTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onFahrenheitValueChanged:(id)sender{
    self.celsiusTextField.text = @"";
}

- (IBAction)onFahrenheitClick:(id)sender {
    self.fahrenheitTextField.text = @"";
}

- (IBAction)convertButtonClicked:(id)sender {
    if (self. celsiusTextField.text.length > 0) {
        float celsius = [self.celsiusTextField.text floatValue];
        self.fahrenheitTextField.text = [NSString stringWithFormat:@"%0.2f", celsius*CELSIUS_FACTOR+32] ;
    } else if (self.fahrenheitTextField.text.length > 0) {
        float fahrenheit = [self.fahrenheitTextField.text floatValue] - 32;
        self.celsiusTextField.text = [NSString stringWithFormat:@"%0.2f", fahrenheit * FAHRENHEIT_FACTOR];
    }
}

- (IBAction)onCelsiusValueChanged:(id)sender{
    self.fahrenheitTextField.text = @"";
}
- (IBAction)onViewTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onCelsiusClick:(id)sender {
    self.celsiusTextField.text = @"";
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.fahrenheitTextField) {
        [self onFahrenheitValueChanged:textField];
    } else if (textField == self.celsiusTextField) {
        [self onCelsiusValueChanged:textField];
    }
}

@end
