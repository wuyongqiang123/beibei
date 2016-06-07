//
//  Search_ClassificationViewController.swift
//  Beibei
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 wyq. All rights reserved.
//分类

import UIKit

class Search_ClassificationViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {


    lazy var dataTable:UITableView! = {

        let Table=UITableView(frame: CGRectMake(0, 0, self.view.width, AppHeight-64-55-50),style:UITableViewStyle.Plain)
        Table.separatorStyle = UITableViewCellSeparatorStyle.None
        Table.delegate=self
        Table.dataSource=self
        Table.tableHeaderView = UIView()

        return Table
    }()
    lazy var selectView: UIView! = {
        let view = UIView()
        view.frame  = CGRectMake(0, 0, self.view.width, 44)
        view.backgroundColor = UIColor.redColor()
        return view
    }()

    var dataArray: NSArray? = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataArray =  ["热销分类","全球购","奶粉纸尿裤","童装童鞋","用品玩具","女装内衣","鞋包配饰","居家百货","美壮个护","食品","孕妈专区","红人专区","话费充值"]
        self.view.addSubview(self.dataTable)

        let search_content = Search_contentViewCOntroller()
        search_content.view.frame = CGRectMake(100, 0,AppWidth-100, self.view.height)
        self.addChildViewController(search_content)
        self.view.addSubview(search_content.view)
    }

    // delegate dataSource----------------------
    //1.1默认返回一组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    // 1.2 返回行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray!.count;
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
        let identifier="Search_title";
        var cell=tableView.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier);
        }
        cell?.backgroundColor = UIColor.whiteColor()
        cell?.textLabel?.font = UIFont.systemFontOfSize(13)
        cell?.textLabel?.text = self.dataArray!.objectAtIndex(indexPath.row) as? String;
        return cell!;
    }
    //1.7 表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true);

    }
    //end ----------------------------------------------------

}
//内容
class Search_contentViewCOntroller: UIViewController,UITableViewDataSource,UITableViewDelegate {

    lazy var dataTable:UITableView! = {

        let Table=UITableView(frame: CGRectMake(0, 0, self.view.width,AppHeight-64-55-50),style:UITableViewStyle.Plain)
        Table.separatorStyle = UITableViewCellSeparatorStyle.None
        Table.delegate=self
        Table.dataSource=self
        Table.tableHeaderView = UIView()
        return Table
    }()

    var dataArray: NSArray? = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataArray =  ["热销分类","全球购","奶粉纸尿裤","童装童鞋","用品玩具","女装内衣","鞋包配饰","居家百货","美壮个护","食品","孕妈专区","红人专区","话费充值"]
        self.view.addSubview(self.dataTable)
    }


    // delegate dataSource----------------------
    //1.1默认返回一组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }

    // 1.2 返回行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray!.count;
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
        let identifier="Search_title";
        var cell=tableView.dequeueReusableCellWithIdentifier(identifier);
        if(cell == nil){
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier);
        }
        cell?.backgroundColor = UIColor.whiteColor()
        cell?.textLabel?.font = UIFont.systemFontOfSize(13)
        cell?.textLabel?.text = self.dataArray!.objectAtIndex(indexPath.row) as? String;
        return cell!;
    }
    //1.7 表格点击事件
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消选中的样式
        tableView.deselectRowAtIndexPath(indexPath, animated: true);

    }
    //end ----------------------------------------------------

}