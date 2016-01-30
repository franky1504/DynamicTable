//
//  ViewController.m
//  DynamicTable
//
//  Created by i_feyuwu on 2016/1/30.
//  Copyright © 2016年 FrankyWu. All rights reserved.
//

#import "ViewController.h"
#import "CustomTableCell.h"
#import "ImgTableCell.h"

@interface ViewController ()<UITableViewDataSource,UITabBarDelegate>{
    
}
@property (strong, nonatomic) NSArray *titleItems;
@property (strong, nonatomic) NSArray *budyData;
@property (weak, nonatomic) IBOutlet UITableView *aTableview;
@end

@implementation ViewController
@synthesize titleItems,budyData,aTableview;

- (void)viewDidLoad {
    [super viewDidLoad];
    titleItems = @[@"星期ㄧ",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六",@"星期日",@"星期八"];
    budyData = @[
                 @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non quam ac massa viverra semper. Maecenas mattis justo ac augue volutpat congue. Maecenas laoreet, nulla eu faucibus gravida, felis orci dictum risus, sed sodales sem eros eget risus.",
                 @"Morbi imperdiet sed diam et sodales. Vestibulum ut est id mauris ultrices gravida.",
                 @"Nulla malesuada metus ut erat malesuada, vitae ornare neque semper. Aenean a commodo justo, vel placerat odio. Curabitur vitae consequat tortor. Aenean eu magna ante.",
                 @"Integer tristique elit ac augue laoreet, eget pulvinar lacus dictum. Cras eleifend lacus eget pharetra elementum. Etiam fermentum eu felis eu tristique. Integer eu purus vitae turpis blandit consectetur. Nulla facilisi. Praesent bibendum massa eu metus pulvinar, quis tristique nunc commodo. Ut varius aliquam elit, a tincidunt elit aliquam non. Nunc ac leo purus. Proin condimentum placerat ligula, at tristique neque scelerisque ut. Suspendisse ut congue enim. Integer id sem nisl.",
                 @"Nam dignissim, lectus et dictum sollicitudin, libero augue ullamcorper justo, nec consectetur dolor arcu sed justo. Proin rutrum pharetra lectus, vel gravida ante venenatis sed. Mauris lacinia urna vehicula felis aliquet venenatis.",
                 @"Suspendisse non pretium sapien. Proin id dolor ultricies, dictum augue non, euismod ante. Vivamus et luctus augue, a luctus mi. Maecenas sit amet felis in magna vestibulum viverra vel ut est. Suspendisse potenti. Morbi nec odio pretium lacus laoreet volutpat sit amet at ipsum. Etiam pretium purus vitae tortor auctor, quis cursus metus vehicula. Integer ultricies facilisis arcu, non congue orci pharetra quis.",
                 @"Vivamus pulvinar ligula neque, et vehicula ipsum euismod quis.",
                 @"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non quam ac massa viverra semper. Maecenas mattis justo ac augue volutpat congue. Maecenas laoreet, nulla eu faucibus gravida, felis orci dictum risus, sed sodales sem eros eget risus. Morbi imperdiet sed diam et sodales. Vestibulum ut est id mauris ultrices gravida. Nulla malesuada metus ut erat malesuada, vitae ornare neque semper. Aenean a commodo justo, vel placerat odio. Curabitur vitae consequat tortor. Aenean eu magna ante. Integer tristique elit ac augue laoreet, eget pulvinar lacus dictum. Cras eleifend lacus eget pharetra elementum. Etiam fermentum eu felis eu tristique. Integer eu purus vitae turpis blandit consectetur. Nulla facilisi. Praesent bibendum massa eu metus pulvinar, quis tristique nunc commodo. Ut varius aliquam elit, a tincidunt elit aliquam non. Nunc ac leo purus. Proin condimentum placerat ligula, at tristique neque scelerisque ut. Suspendisse ut congue enim. Integer id sem nisl. Nam dignissim, lectus et dictum sollicitudin, libero augue ullamcorper justo, nec consectetur dolor arcu sed justo. Proin rutrum pharetra lectus, vel gravida ante venenatis sed. Mauris lacinia urna vehicula felis aliquet venenatis. Suspendisse non pretium sapien. Proin id dolor ultricies, dictum augue non, euismod ante. Vivamus et luctus augue, a luctus mi. Maecenas sit amet felis in magna vestibulum viverra vel ut est. Suspendisse potenti. Morbi nec odio pretium lacus laoreet volutpat sit amet at ipsum. Etiam pretium purus vitae tortor auctor, quis cursus metus vehicula. Integer ultricies facilisis arcu, non congue orci pharetra quis. Vivamus pulvinar ligula neque, et vehicula ipsum euismod quis."];
    
    aTableview.rowHeight = UITableViewAutomaticDimension;
    aTableview.estimatedRowHeight = 44.0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [titleItems count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"customcell";
    static NSString *imgcellIdentifier = @"ImgTableCell";
    ImgTableCell *imgcell;
    CustomTableCell *cell;
    
    if (indexPath.row == 0) {
        
        imgcell = [tableView dequeueReusableCellWithIdentifier:imgcellIdentifier];
        imgcell.budyImg.image = [UIImage imageNamed:@"imggg"];
        [imgcell setNeedsUpdateConstraints];
        [imgcell updateConstraintsIfNeeded];
        return imgcell;
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        cell.titleLabel.text = [titleItems objectAtIndex:indexPath.row-1];
        cell.budyLabel.text  = [budyData objectAtIndex:indexPath.row-1];
        [cell setNeedsUpdateConstraints];
        [cell updateConstraintsIfNeeded];
        return cell;
    }
}

@end
