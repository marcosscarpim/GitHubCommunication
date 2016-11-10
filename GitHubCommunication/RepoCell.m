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
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *starCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *forkCountLabel;


@end

@implementation RepoCell

- (void)prepareForReuse {
    [super prepareForReuse];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configureCell:(NSString*) name withLanguage:(NSString*) language withStarCount:(NSInteger) starCount withForkCount:(NSInteger) forkCount {
    _nameLabel.text = name;
    _languageLabel.text = language;
    _starCountLabel.text = [NSString stringWithFormat:@"%ld", (long)starCount];
    _forkCountLabel.text = [NSString stringWithFormat:@"%ld", (long)forkCount];
    
}

@end
