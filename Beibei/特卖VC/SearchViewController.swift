//
//  SearchViewController.swift
//  Beibei
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var topView: ScrollSegmentView!
    var contentView: ContentView!
    var style: SegmentStyle! = {
        var styl = SegmentStyle()

        // 标题不滚动, 则每个label会平分宽度
        styl.scrollTitle = false
        // 颜色渐变
        styl.gradualChangeTitleColor = true
        // 遮盖
        styl.showCover = true
        // 遮盖颜色
        styl.coverBackgroundColor = UIColor.redColor()

        // title正常状态颜色 使用RGB空间值
        styl.normalTitleColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        // title选中状态颜色 使用RGB空间值
        styl.selectedTitleColor = UIColor(red: 235.0/255.0, green: 235.0/255.0, blue: 235.0/255.0, alpha: 1.0)
        return styl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.brownColor()
        // 这个是必要的设置
        automaticallyAdjustsScrollViewInsets = false

        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(leftimageName: "ic_actbar_back_black", highlImageName: "", targer: self, action: #selector(SearchViewController.back))

        let titles = setChildVcs().map { (childVc) -> String in
            childVc.title!
        }

        topView = ScrollSegmentView(frame: CGRect(x: AppWidth/2-75, y: 20+64, width: 150, height: 25), segmentStyle: self.style, titles: titles)
        topView.layer.borderWidth = 0.5;
        topView.layer.borderColor = UIColor.lightGrayColor().CGColor
        topView.layer.cornerRadius = 14;
        topView.layer.masksToBounds = true

        contentView = ContentView(frame: CGRectMake(0, 55+64, AppWidth, AppHeight-64-55-50), childVcs: setChildVcs(), parentViewController: self)
        contentView.delegate = self // 必须实现代理方法

        topView.titleBtnOnClick = {[unowned self] (label: UILabel, index: Int) in
            self.contentView.setContentOffSet(CGPoint(x: self.contentView.bounds.size.width * CGFloat(index), y: 0), animated: false)

        }
        view.addSubview(topView)
        view.addSubview(contentView)

    }
    //返回
    func back() {
        self.navigationController?.popViewControllerAnimated(false)
    }

    // 设置childVcs
    func setChildVcs()  -> [UIViewController]{
        let vc1 = Search_ClassificationViewController()
        vc1.view.backgroundColor = UIColor.whiteColor()
        vc1.title = "分类"

        let vc2 = Search_BrandViewController()
        vc2.view.backgroundColor = UIColor.whiteColor()
        vc2.title = "品牌"

        return [vc1, vc2]
    }

}

extension SearchViewController: ContentViewDelegate {
    var segmentView: ScrollSegmentView {
        return topView
    }
}
