//
//  FirstStartViewController.swift
//  Beibei
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class GuideViewController: UIViewController {
    var pageControl: UIPageControl!
    var startButton: UIButton!

    private var scrollView: UIScrollView!

    private let numOfPages = 4

    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = MainBounds

        scrollView = UIScrollView(frame: frame)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        scrollView.contentOffset = CGPointZero
        // 将 scrollView 的 contentSize 设为屏幕宽度的3倍(根据实际情况改变)
        scrollView.contentSize = CGSize(width: frame.size.width * CGFloat(numOfPages), height: frame.size.height)

        scrollView.delegate = self

        for index  in 0..<numOfPages {
            let imageView = UIImageView(image: UIImage(named: "introduced_00\(index+1)"))
            imageView.frame = CGRect(x: frame.size.width * CGFloat(index), y: 0, width: frame.size.width, height: frame.size.height)
            scrollView.addSubview(imageView)
        }

        self.view.insertSubview(scrollView, atIndex: 0)
        //分页圆点
        pageControl = UIPageControl()
        pageControl.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.size.height-40, width: self.view.frame.size.width, height: 30)
        pageControl.numberOfPages = numOfPages
        pageControl.currentPage = 0
        self.view.addSubview(pageControl)

        startButton = UIButton.init(type:UIButtonType.Custom)
        startButton.frame = CGRect(x: self.view.frame.size.width/2-50, y: self.view.frame.size.height-75, width: 100, height: 30)
        startButton.backgroundColor = UIColor.blueColor()
        startButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        startButton.setTitle("立即体验", forState: UIControlState.Normal)
        startButton.layer.cornerRadius = 5  //设置圆角
        startButton.addTarget(self,action:#selector(GuideViewController.jump(_:)),forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(startButton)
        // 给开始按钮设置圆角
        startButton.layer.cornerRadius = 15.0
        // 隐藏开始按钮
        startButton.alpha = 0.0
    }
    func jump(sender: UIButton!) {


        UIView.animateWithDuration(1) { 
            self.view.transform = CGAffineTransformMakeScale(0.1, 0.1)
            self.view.alpha = 0
        }
        (UIApplication.sharedApplication().delegate as! AppDelegate).setupTabViewController()
    }

    // 隐藏状态栏
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

// MARK: - UIScrollViewDelegate
extension GuideViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offset = scrollView.contentOffset
        // 随着滑动改变pageControl的状态
        pageControl.currentPage = Int(offset.x / view.bounds.width)

        // 因为currentPage是从0开始，所以numOfPages减1
        if pageControl.currentPage == numOfPages - 1 {
            UIView.animateWithDuration(0.5) {
                self.startButton.alpha = 1.0
            }
        } else {
            UIView.animateWithDuration(0.2) {
                self.startButton.alpha = 0.0
            }
        }
    }
}
