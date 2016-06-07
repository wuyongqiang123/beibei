//
//  SaleViewController.swift
//  Beibei
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 wyq. All rights reserved.
//特卖

import UIKit
class SaleViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let image = UIImage(named: "beibei_logo")
        self.navigationItem.titleView = UIImageView(image: image)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(imageName: "ic_default_main_right", highlImageName: "", targer: self, action:#selector(SaleViewController.search))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(leftimageName: "ic_product_siliao", highlImageName: "", targer: self, action: #selector(SaleViewController.product))
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false

        var style = SegmentStyle()
        // 滚动条
        style.showLine = true
        // 颜色渐变
        style.gradualChangeTitleColor = true
        // 滚动条颜色
        style.scrollLineColor = UIColor.redColor()

        let titles = setChildVcs().map { $0.title! }

        let scroll = ScrollPageView(frame: CGRect(x: 0, y: 64, width: AppWidth, height: AppHeight - 64), segmentStyle: style, titles: titles, childVcs: setChildVcs(), parentViewController: self)
        view.addSubview(scroll)
        
    }
    func search() {
        let searchVC = SearchViewController()
        self.navigationController?.pushViewController(searchVC, animated: true)
    }

    func product() {

    }

    func setChildVcs() -> [UIViewController] {
        let vc1 = New_SaleViewController()
        vc1.view.backgroundColor = UIColor.brownColor()
        vc1.title = "上新"
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.greenColor()
        vc2.title = "童装"

        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.redColor()
        vc3.title = "童鞋"

        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor.yellowColor()
        vc4.title = "婴童用品"

        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor.lightGrayColor()
        vc5.title = "女装"

        let vc6 = UIViewController()
        vc6.view.backgroundColor = UIColor.brownColor()
        vc6.title = "鞋包"

        let vc7 = UIViewController()
        vc7.view.backgroundColor = UIColor.orangeColor()
        vc7.title = "美妆"

        let vc8 = UIViewController()
        vc8.view.backgroundColor = UIColor.blueColor()
        vc8.title = "居家"

        let vc9 = UIViewController()
        vc9.view.backgroundColor = UIColor.brownColor()
        vc9.title = "美食"

        let vc10 = UIViewController()
        vc10.view.backgroundColor = UIColor.orangeColor()
        vc10.title = "最后疯抢"

        let vc11 = UIViewController()
        vc11.view.backgroundColor = UIColor.blueColor()
        vc11.title = "下期预告"

        return [vc1, vc2, vc3,vc4, vc5, vc6, vc7, vc8, vc9, vc10, vc11]
    }

    //内存警告
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        print("内存警告");
    }
    deinit {
        print("释放了么")
    }


}
