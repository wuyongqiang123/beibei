//
//  BaseNavigationController.swift
//  Beibei
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage.init(named: "bg_brand_coupon_white"), forBarMetrics:.Default)
        self.navigationBar.shadowImage = UIImage()
    }

    override func shouldAutorotate() -> Bool {
        return (self.visibleViewController?.shouldAutorotate())!
    }
    override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
        return (self.visibleViewController?.preferredInterfaceOrientationForPresentation())!
    }
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if !(self.visibleViewController?.isKindOfClass(UIAlertController))! {
            return (self.visibleViewController?.supportedInterfaceOrientations())!

        }
        else {
            return UIInterfaceOrientationMask.Portrait
        }
    }
}
