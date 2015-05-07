//
//  ViewController.m
//  MFB
//
//  Created by Apro on 01/05/15.
//  Copyright (c) 2015 Apro. All rights reserved.
//

#import "ViewController.h"
#import "MFBTimetableModel.h"
#import "RESTClient.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>{
    
    /// Table view instance.
    IBOutlet UITableView *__weak _tableView;
    
    /// Model to be displayed
    MFBTimetableModel *_timeTable;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [[RESTClient sharedInstance] timeTablesWithHandler:^(MFBTimetableModel *timeTable) {
        
        _timeTable = timeTable;
        
        //reload table view if display data is downloaded correctly.
        if (_timeTable) {
            
            [_tableView reloadData];
            
        }else{
            [[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Network Error", nil)
                                        message:NSLocalizedString(@"Please check your network connection!", nil)
                                       delegate:nil
                              cancelButtonTitle:NSLocalizedString(@"Ok", nil)
                              otherButtonTitles:nil]
             show];
        }
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _timeTable.arrivals.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *const kCellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    MFBStationModel *cellStation = _timeTable.arrivals[indexPath.row];
    
    cell.textLabel.text = [cellStation.lineCode stringByAppendingFormat:@" - %@", cellStation.direction];
    cell.detailTextLabel.text = cellStation.throughTheStations;
    
    return cell;
}

@end
