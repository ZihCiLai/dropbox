//
//  DetailViewController.m
//  HelloMyDropbox
//
//  Created by Lai Zih Ci on 2017/2/16.
//  Copyright © 2017年 ZihCi. All rights reserved.
//

#import "DetailViewController.h"
#import <ObjectiveDropboxOfficial.h>

@interface DetailViewController ()
{
    DropboxClient *client;
}
@property (weak, nonatomic) IBOutlet UIImageView *resultImageView;

@end

@implementation DetailViewController

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    client = [DropboxClientsManager authorizedClient];
    NSString *targetFilePathName = [NSString stringWithFormat:@"/%@", _detailItem];
    DBDownloadDataTask *task = [client.filesRoutes downloadData:targetFilePathName];
    [task response:^(DBFILESMetadata* _Nullable metaData, DBFILESDownloadError* _Nullable error, DBRequestError * _Nullable dbError, NSData * _Nonnull data) {
        
        if (data) {
            NSLog(@"Download OK: %ld bytes", data.length);
            _resultImageView.image = [UIImage imageWithData:data];
        } else {
            NSLog(@"Download Fail:%@,%@",error,dbError);
        }
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(NSDate *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}


@end
