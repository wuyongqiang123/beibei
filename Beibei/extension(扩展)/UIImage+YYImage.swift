//
//  UIImage+YYImage.swift
//  Beibei
//
//  Created by mac on 16/6/6.
//  Copyright © 2016年 wyq. All rights reserved.
//

import Foundation


// UIImage的扩展
extension UIImage {
    /// 按尺寸裁剪图片大小
    class func imageClipToNewImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.drawInRect(CGRect(origin: CGPointZero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

    /// 将传入的图片裁剪成带边缘的原型图片
    class func imageWithClipImage(image: UIImage, borderWidth: CGFloat, borderColor: UIColor) -> UIImage {
        let imageWH = image.size.width
        //        let border = borderWidth
        let ovalWH = imageWH + 2 * borderWidth

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), false, 0)
        let path = UIBezierPath(ovalInRect: CGRectMake(0, 0, ovalWH, ovalWH))
        borderColor.set()
        path.fill()

        let clipPath = UIBezierPath(ovalInRect: CGRectMake(borderWidth, borderWidth, imageWH, imageWH))
        clipPath.addClip()
        image.drawAtPoint(CGPointMake(borderWidth, borderWidth))

        let clipImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return clipImage
    }

    /// 将传入的图片裁剪成圆形图片
    func imageClipOvalImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        let ctx = UIGraphicsGetCurrentContext()
        let rect = CGRectMake(0, 0, self.size.width, self.size.height)
        CGContextAddEllipseInRect(ctx, rect)

        CGContextClip(ctx)
        self.drawInRect(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
