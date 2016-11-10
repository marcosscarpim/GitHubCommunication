//
//  RepoCell.h
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 10/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *ownerImageView;

- (void)configureCell:(NSString*) name withScore:(NSInteger) score withOwner:(NSString*) owner;

@end
