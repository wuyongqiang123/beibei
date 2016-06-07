//
//  BaseViewController.swift
//  Beibei
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,WQBannerViewDelegate {

    // 懒加载
    lazy var bannerView: WQBannerView! = {

        let dataArray: NSMutableArray = NSMutableArray.init(capacity: 0)
        var dic = NSDictionary.init(objects: ["http://pic01.babytreeimg.com/foto3/photos/2014/0211/68/2/4170109a41ca935610bf8_b.png","12"], forKeys: ["image_url","image_id"], count: 2)


        dataArray.addObject(dic)

        dic = NSDictionary.init(objects: ["http://pic01.babytreeimg.com/foto3/photos/2014/0127/19/9/4170109a267ca641c41ebb_b.png","13"], forKeys: ["image_url","image_id"],count: 2)
        dataArray.addObject(dic)

        dic = NSDictionary.init(objects: ["http://pic02.babytreeimg.com/foto3/photos/2014/0207/59/4/4170109a17eca86465f8a4_b.jpg","14"], forKeys: ["image_url","image_id"],count: 2)

        dataArray.addObject(dic)
        print(dataArray)

        let bannerView = WQBannerView.init(frame: CGRectMake(0, 0, AppWidth, 140), direction: BannerViewScrollDirection.ScrollDirectionLandscape, images: dataArray)
        bannerView.backgroundColor = UIColor.clearColor()
        bannerView.rollingDelayTime = 4.0
        bannerView.delegate = self
        bannerView.defaultpageColor = UIColor.whiteColor()
        bannerView.selectpageColor = UIColor.redColor()
        bannerView.imageKey = "image_url"
        bannerView.imageId = "image_id"
        bannerView.setSquare(0)
        bannerView.setPageControlStyle(BannerViewPageStyle.PageStyle_Right)
        bannerView.startDownloadImage()
        bannerView.showClose(false)
        return bannerView
    }()

    lazy var dataTable:UITableView! = {

        let Table=UITableView(frame: CGRectMake(0, 0, AppWidth, AppHeight-64),style:UITableViewStyle.Plain)
        Table.delegate=self
        Table.dataSource=self
        Table.tableHeaderView = self.bannerView
        return Table
    }()

    //WQBannerView delegate -------------------------------
    func imageCachedDidFinish(bannerView: WQBannerView) {

        print("frame = %@",bannerView.frame)
        if bannerView == self.bannerView {
            if self.bannerView!.superview == nil {
                dataTable.tableHeaderView = self.bannerView!
            }
            self.bannerView!.startRolling()
        }
        else {
            dataTable.tableHeaderView = bannerView
            bannerView.startRolling()
        }


    }

    func bannerView_didSelectImageView_withData(bannerView: WQBannerView, index: NSInteger, bannerData: String, imageid: String) {

        print("\(index)+\(bannerData)+\(imageid)")

    }

    func bannerViewdidClosed(bannerView: WQBannerView) {

        if ((bannerView.superview) != nil)
        {
            bannerView.removeFromSuperview()
        }

    }
    //end-------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "特卖"
        self.view.addSubview(self.dataTable)
    }

    // delegate dataSource----------------------
    //1.1默认返回一组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    // 1.2 返回行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }

    //1.3 返回行高
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{

        return 44;

    }

    //1.4每组的头部高度
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0;
//    }
//
//    //1.5每组的底部高度
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0;
//    }
    //1.6 返回数据源
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier="identtifier";
        var cell=tableView.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier);
        }

        cell?.textLabel?.text="头像哈哈";
        cell?.accessoryType=UITableViewCellAccessoryType.DisclosureIndicator;
        return cell!;
    }
    //1.7 表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
    }
    //end ----------------------------------------------------

}
