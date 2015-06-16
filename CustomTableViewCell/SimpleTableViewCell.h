//
//  SimpleTableViewCell.h
//  CustomTableViewCell
//
//  Created by Sahil Gupta on 2015-06-15.
//  Copyright (c) 2015 SahilGupta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *heading;
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;
@property (weak, nonatomic) IBOutlet UILabel *descriptionText;

@end
