//
//  MasterViewController.m
//  HelloMyDropbox
//
//  Created by Lai Zih Ci on 2017/2/16.
//  Copyright © 2017年 ZihCi. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import <ObjectiveDropboxOfficial.h>
#import "AppDelegate.h"

@interface MasterViewController ()
{
    DropboxClient *client;
}

@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startDropBoxFunctions) name:DROPBOX_LOGIN_OK_NOTIFICATION object:nil];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self checkIfShouldLogin];
    });
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
}

-(void) checkIfShouldLogin {
    if([DropboxClientsManager authorizedClient] == nil) {
        // Need to login
        UIApplication *application = [UIApplication sharedApplication];
        
        [DropboxClientsManager authorizeFromController:application
                                            controller:self
                                               openURL:^(NSURL * _Nonnull url) {
                                                   [[UIApplication sharedApplication] openURL:url];
        }
                                           browserAuth:false];
    } else {
        // Already login
        [self startDropBoxFunctions];
    }
}


- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

-(void) startDropBoxFunctions {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;

    // Prepare client
    client = [DropboxClientsManager authorizedClient];
    [self downloadFilesList];
}

-(void) downloadFilesList {
    // Remove all exist items first.
    [_objects removeAllObjects];
    DBRpcTask *task = [client.filesRoutes listFolder:@""];
    [task response:^(DBFILESListFolderResult* _Nullable result, DBFILESListRevisionsError* _Nullable error, DBRequestError * _Nullable dbErro) {
        NSLog(@"Total %ld files.", result.entries.count);
        for (DBFILESMetadata *file in result.entries) {
            [_objects addObject:file.name];
        }
        [self.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    NSURL *sourceFileURL = [[NSBundle mainBundle] URLForResource:@"image.jpg" withExtension:nil];
    NSString *targetFilePathName = [NSString stringWithFormat:@"/%@.jpg", [NSDate date]];
    //[client.filesRoutes uploadUrl:targetFilePathName inputUrl:sourceFileURL];
    
    DBUploadTask *task = [client.filesRoutes uploadUrl:targetFilePathName inputUrl:sourceFileURL];
    [task response:^(DBFILESMetadata * _Nullable metaData, DBFILESUploadError* _Nullable error, DBRequestError * _Nullable dbError) {
        if (metaData) {
            NSLog(@"Upload OK: %@", metaData);
            [self downloadFilesList];
        } else {
            NSLog(@"Upload Fail: %@, %@", error, dbError);
        }
    }];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSString *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.objects removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSString *targetFilePathName = [NSString stringWithFormat:@"/%@", _objects[indexPath.row]];
        DBRpcTask *task = [client.filesRoutes delete_:targetFilePathName];
        [task response:^(DBFILESMetadata * _Nullable metaData, DBFILESUploadError* _Nullable error, DBRequestError * _Nullable dbError) {
            
            if (metaData) {
                NSLog(@"Upload OK: %@", metaData);
                [self downloadFilesList];
            } else {
                NSLog(@"Upload Fail: %@, %@", error, dbError);
            }
        }];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


@end
