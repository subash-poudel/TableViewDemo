//
//  ViewController.m
//  TableViewDemo
//
//  Created by Subash on 12/9/14.
//  Copyright (c) 2014 Subash. All rights reserved.
//

#import "ViewController.h"
#import "Profile.h"
#import  "QuartzCore/QuartzCore.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSArray* myArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Profile *red = [[Profile alloc]initWithName:@"Red" descriptionOfPerson:@"This is color Red." imageName:@"red"];
    Profile *orange = [[Profile alloc]initWithName:@"Orange" descriptionOfPerson:@"This is color Orange." imageName:@"orange"];
    Profile *blue = [[Profile alloc]initWithName:@"Blue" descriptionOfPerson:@"This is color Blue." imageName:@"blue"];
    Profile *green = [[Profile alloc]initWithName:@"Green" descriptionOfPerson:@"This is color Green." imageName:@"green"];
    self.myArray = [NSArray arrayWithObjects: red, orange, blue, green, red, orange, blue, green, red, orange, blue, green, red, orange, blue, green, red, orange, blue, green, red, orange, blue, green, red, orange, blue, green, nil];
    //self.myArray = [NSArray arrayWithObjects: red, nil];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //setting border
//    self.tableView.layer.borderWidth = 2.0;
//    self.tableView.layer.borderColor = [UIColor redColor].CGColor;
    self.tableView.tableFooterView = [[UIView alloc] init] ;
    CALayer *layer = self.tableView.layer;
    [layer setMasksToBounds:YES];
    [layer setCornerRadius: 4.0];
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[UIColor colorWithWhite: 0.8 alpha: 1.0] CGColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"MyIdentifier"];
    }
    Profile *profile = self.myArray[indexPath.row];
    cell.textLabel.text = profile.name;
    cell.detailTextLabel.text = profile.description;
    NSString *path = [[NSBundle mainBundle] pathForResource:profile.imageName ofType:@"png"];
    NSLog(@"%@",path);
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    cell.imageView.image = image;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Profile *profile = self.myArray[indexPath.row];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:profile.name message:profile.description delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil , nil];
    [alertView show];
}
@end
