//
//  UserCell.h
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 10/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;

- (void)configureCell:(NSString*) login withScore:(NSInteger) score;

@end
