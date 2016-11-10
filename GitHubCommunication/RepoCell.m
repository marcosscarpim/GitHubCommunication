//
//  RepoCell.m
//  GitHubCommunication
//
//  Created by Marcos Vinicios Minucci Scarpim on 10/11/16.
//  Copyright © 2016 marcos.scarpim. All rights reserved.
//

#import "RepoCell.h"
#import "AlamofireImage-Swift.h"

@interface RepoCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *ownerLabel;

@end

@implementation RepoCell

@synthesize ownerImageView;

- (void)prepareForReuse {
    [super prepareForReuse];
    ownerImageView.clipsToBounds = true;
    [ownerImageView af_cancelImageRequest];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell:(NSString*) name withScore:(NSInteger) score withOwner:(NSString*) owner {
    _nameLabel.text = name;
    _ownerLabel.text = owner;
    _scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)score];
    
}

@end
