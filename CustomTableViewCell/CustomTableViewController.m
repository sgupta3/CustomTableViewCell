//
//  CustomTableViewController.m
//  CustomTableViewCell
//
//  Created by Sahil Gupta on 2015-06-15.
//  Copyright (c) 2015 SahilGupta. All rights reserved.
//

#import "CustomTableViewController.h"
#import "SimpleTableViewCell.h"

@interface CustomTableViewController ()

@property(nonatomic,strong) NSArray *heading;
@property(nonatomic,strong) NSArray *status;
@property(nonatomic,strong) NSArray *descriptionText;



@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.heading = @[@"Active",@"High Definition",@"5GB +"];
    self.status = @[@"YES",@"NO",@"YES"];
    self.descriptionText = @[@"Lorem Ipsum",@"It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",@"Lorem Ipsum"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(section == 0) {
        return 1;
    } else {
        return 3;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if(indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        cell.textLabel.text = @"User Type";
        cell.detailTextLabel.text = @"Basic";
        
        return cell;

    } else {
        static NSString *simpleTableIdentifier = @"SimpleTableCell";
        SimpleTableViewCell *cell = (SimpleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        if(cell == nil) {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        NSString *status = [self.status objectAtIndex:indexPath.row];
        cell.heading.text = [self.heading objectAtIndex:indexPath.row];
        if([status isEqualToString:@"YES"]) {
            cell.statusImage.image = [UIImage imageNamed:@"checkmark"];
        } else {
            cell.statusImage.image = [UIImage imageNamed:@"cancel"];
        }
        
        cell.descriptionText.text = [self.descriptionText objectAtIndex:indexPath.row];
        return cell;

    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    if(indexPath.section == 0) {
        return 44;
    } else {
        return 85;
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0) {
        return @"Type";
    } else {
        return @"Details";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
