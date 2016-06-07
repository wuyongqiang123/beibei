//
//  YYLogManger.swift
//  Beibei
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 wyq. All rights reserved.
//

import Foundation
/**
 swift自定义Log

 - parameter debug:    需要打印的内容
 - parameter file:     获取方法调用者所在的文件路径
 - parameter function: 获取方法调用者所在的方法名
 - parameter line:     获取所在的行数
 */
public func YYLogs<T>(debug: T, _ file: String = #file , _ function: String = #function, _ line: Int = #line) {

    #if DEBUG
        let filename = file.ns.lastPathComponent.ns.stringByDeletingPathExtension
        print("\(filename):\(function):[\(line)]\(debug)")
    #endif
}