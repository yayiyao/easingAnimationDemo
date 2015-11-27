//
//  AnimationListTableViewController.m
//  easingAnimationDemo
//
//  Created by 谢斌 on 15/11/26.
//  Copyright © 2015年 谢斌. All rights reserved.
//

#import "AnimationListTableViewController.h"
#import "AnimationViewCell.h"
#import "AnimationViewController.h"

@interface AnimationListTableViewController ()

@property (nonatomic, strong) NSArray *cells;

@end

@implementation AnimationListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    double (^Linear)(double) = ^double (double s) {
        return s;
    };
    double (^ElasticEaseIn)(double) = ^double (double s) {
        return sin(13 * M_PI_2 * s) * pow(2, 10 * (s - 1));
    };
    double (^ElasticEaseOut)(double) = ^double (double s) {
        return sin(-13 * M_PI_2 * (s + 1)) * pow(2, -10 * s) + 1;
    };
    double (^ElasticEaseInOut)(double) = ^double (double s) {
        if(s < 0.5)
        {
            return 0.5 * sin(13 * M_PI_2 * (2 * s)) * pow(2, 10 * ((2 * s) - 1));
        }
        else
        {
            return 0.5 * (sin(-13 * M_PI_2 * ((2 * s - 1) + 1)) * pow(2, -10 * (2 * s - 1)) + 2);
        }
    };
    double (^BounceEaseOut)(double) = ^double (double s) {
        if(s < 4/11.0)
        {
            return (121 * s * s)/16.0;
        }
        else if(s < 8/11.0)
        {
            return (363/40.0 * s * s) - (99/10.0 * s) + 17/5.0;
        }
        else if(s < 9/10.0)
        {
            return (4356/361.0 * s * s) - (35442/1805.0 * s) + 16061/1805.0;
        }
        else
        {
            return (54/5.0 * s * s) - (513/25.0 * s) + 268/25.0;
        }
    };
    double (^BounceEaseIn)(double) = ^double (double s) {
        return 1 - BounceEaseOut(1 - s);
    };
    double (^BounceEaseInOut)(double) = ^double (double s) {
        if(s < 0.5)
        {
            return 0.5 * BounceEaseIn(s*2);
        }
        else
        {
            return 0.5 * BounceEaseOut(s * 2 - 1) + 0.5;
        }
    };
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.cells = @[
        [AnimationViewCell cellWithName:@"阻尼震动" easing:^double(double s) {
            return 1 - exp(-5 * s) * cos(s * 6.5 * M_PI);
        }],
        [AnimationViewCell cellWithName:@"Linear" easing:Linear],
        [AnimationViewCell cellWithName:@"ElasticEaseInOut" easing:ElasticEaseInOut],
        [AnimationViewCell cellWithName:@"ElasticEaseIn" easing:ElasticEaseIn],
        [AnimationViewCell cellWithName:@"ElasticEaseOut" easing:ElasticEaseOut],
        [AnimationViewCell cellWithName:@"BounceEaseIn" easing:BounceEaseIn],
        [AnimationViewCell cellWithName:@"BounceEaseOut" easing:BounceEaseOut],
        [AnimationViewCell cellWithName:@"BounceEaseInOut" easing:BounceEaseInOut],
    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cells count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.cells objectAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AnimationViewCell *cell = [self.cells objectAtIndex:indexPath.row];
    AnimationViewController *viewController = [AnimationViewController new];
    viewController.easing = cell.easing;
    [self.navigationController pushViewController:viewController animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
