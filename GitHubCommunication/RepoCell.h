//
//  RepoCell.h
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 10/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RepoCell : UITableViewCell

- (void)configureCell:(NSString*) name withLanguage:(NSString*) language withStarCount:(NSInteger) starCount withForkCount:(NSInteger) forkCount;

@end
