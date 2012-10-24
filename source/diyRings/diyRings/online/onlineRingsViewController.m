//
//  onlineRingsViewController.m
//  diyRings
//
//  Created by wangping on 12-10-22.
//  Copyright (c) 2012年 lcywp. All rights reserved.
//

#import "OnlineRingsViewController.h"

//@interface TableviewItem : NSObject
//{
//    BOOL isSelected;
//    
//}
//@property
//@end
//
//@implementation TableviewItem
//
//@synthesize <#property#>
//
//@end

@interface OnlineRingsViewController ()

@end

@implementation OnlineRingsViewController
@synthesize ringTableViewOnline = _ringTableViewOnline;
@synthesize dataArr = _dataArr;
@synthesize selectIndex = _selectIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"在线铃音";
        
        self.dataArr = [[[NSArray alloc] initWithObjects:@"first",@"second", @"third", @"forth", @"fifth", @"sixth", @"seventh", @"eighth",@"ninth", @"tenth", @"eleventh", @"twelve", nil] autorelease];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    UIImageView* bgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg.png"]];
    bgview.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:bgview];
    [bgview release];
    
    
    
    self.ringTableViewOnline = [[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)] autorelease];
    [self.ringTableViewOnline setDelegate:self];
    [self.ringTableViewOnline setDataSource:self];
    self.ringTableViewOnline.backgroundColor = [UIColor clearColor];
    [self.ringTableViewOnline setSeparatorStyle:UITableViewCellSeparatorStyleNone];
   
    [self.view addSubview:self.ringTableViewOnline];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) dealloc
{
    self.ringTableViewOnline = nil;
    self.dataArr = nil;
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UITable deleget

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return nil;
}

//每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return nil;
}

//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//指定每个分区中有多少行，默认为1
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (void)btnPress:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    NSString* alertStr = [NSString stringWithFormat:@"你要试听：%@吗", [self.dataArr objectAtIndex:btn.tag]];
    
    UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"提示"
                                                  message:alertStr
                                                 delegate:nil
                                        cancelButtonTitle:@"确定"
                                        otherButtonTitles:nil];
    [alert show];
    [alert release]; }

//绘制Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                       reuseIdentifier: SimpleTableIdentifier] autorelease];
        
        UIImageView* bgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cellbg.png"]];
        bgview.frame = CGRectMake(0, 0, cell.frame.size.width, 30);
        [cell addSubview:bgview];
        [bgview release];
        
        cell.textLabel.frame = CGRectMake(0, 0, cell.textLabel.frame.size.width, 30);

    }
    
    if (self.selectIndex && [indexPath isEqual:self.selectIndex]) {

        UIButton* btnShiting = [UIButton buttonWithType:UIButtonTypeContactAdd];
        [btnShiting addTarget:self action:@selector(btnPress:) forControlEvents:UIControlEventTouchDown];
        btnShiting.tag = indexPath.row;
        

        cell.textLabel.text = [NSString stringWithFormat:@"select:\n %@", [self.dataArr objectAtIndex:indexPath.row]];
        [cell addSubview:btnShiting];
        
    }
    else {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    }
    
    
    return cell;
}

//改变行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.selectIndex isEqual:indexPath]) {
        return 90;
    }
    return 40;
}

//选中Cell响应事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.selectIndex && [self.selectIndex isEqual:indexPath]) {
        self.selectIndex = nil;
    }
    else
    {
        self.selectIndex = indexPath;
    }
    
    [self.ringTableViewOnline reloadData];
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];//选中后的反显颜色即刻消失
}

@end
