//
//  RootTabBarController.swift
//  Beibei
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit
import RDVTabBarController

class RootTabBarController: RDVTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        creatSubViewControllers()
    }
    func creatSubViewControllers(){

        let Sale  = SaleViewController ()
        let nav_sale = BaseNavigationController.init(rootViewController: Sale)

        let Global = GlobalViewController ()
        let nav_global = BaseNavigationController.init(rootViewController: Global)

        let Circle = CircleViewController ()
        let nav_circle = BaseNavigationController.init(rootViewController: Circle)

        let Shopp = ShoppingViewController ()
        let nav_shopp = BaseNavigationController.init(rootViewController: Shopp)

        let My = MyViewController ()
        let nav_my = BaseNavigationController.init(rootViewController: My)
        self.viewControllers = [nav_sale,nav_global,nav_circle,nav_shopp,nav_my]
        customizeTabBarForController()

    }

    func customizeTabBarForController() {

        let backgroundImage: UIImage = UIImage.init(named: "tabbar_background")!
        let tabBarItemImages: NSArray = ["ic_tabbar_sale","ic_tabbar_global","ic_tabbar_quaner","ic_tabbar_cart", "ic_tabbar_mine"];
        let tabBarItemTitles: NSArray = ["特卖", "全球购", "圈儿", "购物车", "我的"];
        var index = 0

        for i in 0 ..< 5 {
            let item: RDVTabBarItem = (self.tabBar.items as AnyObject).objectAtIndex(i) as! RDVTabBarItem
            item.setBackgroundSelectedImage(backgroundImage, withUnselectedImage: backgroundImage)
            let simage  = tabBarItemImages.objectAtIndex(index) as! String
            let selectedimage = UIImage.init(named:"\(simage)_selected")
            let uimage = tabBarItemImages.objectAtIndex(index) as! String
            let unselectedimage = UIImage.init(named:"\(uimage)_normal")
            item.setFinishedSelectedImage(selectedimage, withFinishedUnselectedImage: unselectedimage)
            item.title = tabBarItemTitles.objectAtIndex(index) as! String
            item.selectedTitleAttributes =  [NSForegroundColorAttributeName: UIColor.redColor(),NSFontAttributeName: UIFont(name: "Heiti SC", size: 12.0)!]
            item.unselectedTitleAttributes = [NSForegroundColorAttributeName: UIColor.blackColor(),NSFontAttributeName: UIFont(name: "Heiti SC", size: 12.0)!]
            index += 1
        }
    }

}
