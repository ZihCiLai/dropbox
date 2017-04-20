//
//  DetailViewController.h
//  HelloMyDropbox
//
//  Created by Lai Zih Ci on 2017/2/16.
//  Copyright © 2017年 ZihCi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSString *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

