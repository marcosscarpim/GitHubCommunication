//
//  UserCell.m
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 10/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

#import "UserCell.h"
#import "AlamofireImage-Swift.h"

@interface UserCell ()

@property (weak, nonatomic) IBOutlet UILabel *loginLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation UserCell

@synthesize userImageView;

- (void)prepareForReuse {
    [super prepareForReuse];
    userImageView.clipsToBounds = true;
    [userImageView af_cancelImageRequest];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell:(NSString*) login withScore:(NSInteger) score  {
    _loginLabel.text = login;
    _scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)score];
    
}

@end
