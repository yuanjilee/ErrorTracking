//
//  WTTableViewController.m
//  ErrorTracking_Example
//
//  Created by 安笑 on 2019/3/28.
//  Copyright © 2019 YC Tech. All rights reserved.
//

#import "WTTableViewController.h"
#import "WTCrashCase.h"

@interface WTTableViewController ()

@property (nonatomic, copy) NSArray *dataSources;

@end

@implementation WTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ErrorTracking";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSources.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray* tests = self.dataSources[section][@"tests"];
    return tests.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSArray* tests = self.dataSources[indexPath.section][@"tests"];
    cell.textLabel.text = tests[indexPath.row][@"name"];
    cell.detailTextLabel.text = tests[indexPath.row][@"explanation"];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row)
    {
            case 0:  [WTCrashCase crash0];  break;
            case 1:  [WTCrashCase crash1];  break;
            case 2:  [WTCrashCase crash2];  break;
            case 3:  [WTCrashCase crash3];  break;
            case 4:  [WTCrashCase crash4];  break;
            case 5:  [WTCrashCase crash5];  break;
            case 6:  [WTCrashCase crash6];  break;
            case 7:  [WTCrashCase crash7];  break;
            case 8:  [WTCrashCase crash8];  break;
            case 9:  [WTCrashCase crash9];  break;
            case 10: [WTCrashCase crash10]; break;
            case 11: [WTCrashCase crash11]; break;
            case 12: [WTCrashCase crash12]; break;
            case 13: [WTCrashCase crash13]; break;

        default: break;
    }
}

- (NSArray *)dataSources {
    if (!_dataSources) {
        _dataSources = @[@{
              @"name": @"Crash Reporting",
              @"tests":
                  @[
                      @{
                          @"name": @"Unrecognized Selector(崩溃)",
                          @"explanation": @"thisIsTheUnrecognizedSelectorCausingTheCrash",
                          },
                      @{
                          @"name": @"Out of Bounds(崩溃)",
                          @"explanation": @"5th element in a 3 elements array",
                          },
                      @{
                          @"name": @"NULL Pointer(崩溃)",
                          @"explanation": @"Dereference",
                          },
                      @{
                          @"name": @"Invalid Geometry(崩溃)",
                          @"explanation": @"CALayer position contains nan",
                          },
                      @{
                          @"name": @"Raise Custom Exception(崩溃)",
                          @"explanation": @"This is the exception!",
                          },
                      @{
                          @"name": @"kill(崩溃)",
                          @"explanation": @"with SIGABRT",
                          },
                      @{
                          @"name": @"__builtin_trap(崩溃)",
                          @"explanation": @"",
                          },
                      @{
                          @"name": @"Access to a Non-Object(崩溃)",
                          @"explanation": @"",
                          },
                      @{
                          @"name": @"Message a Released Object(崩溃)",
                          @"explanation": @"",
                          },
                      @{
                          @"name": @"Write to Read-Only Memory(崩溃)",
                          @"explanation": @"using function pointer aFunction",
                          },
                      @{
                          @"name": @"Stack Overflow(崩溃)",
                          @"explanation": @"infinite recursive call",
                          },
                      @{
                          @"name": @"abort(崩溃)",
                          @"explanation": @"",
                          },
                      @{
                          @"name": @"Custom Crash(异常)",
                          @"explanation": @"This is a custom crash!",
                          },
                      @{
                          @"name": @"NotSmoothFrameException(卡顿)",
                          @"explanation": @"There are some notsmooth frames in the main thread",
                          }
                      ],
              }];
    }

    return _dataSources;
}

@end
