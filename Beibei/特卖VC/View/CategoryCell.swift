//
//  CategoryCell.swift
//  Beibei
//
//  Created by mac on 16/6/7.
//  Copyright © 2016年 wyq. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    private static let identifier = "CategoryCell"
    var nameString: String? {
        didSet {
            nameLabel.text = nameString
        }
    }
    // MARK: Lazy Property
     lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textColor = UIColor.lightGrayColor()
        nameLabel.highlightedTextColor = UIColor.blackColor()
        nameLabel.backgroundColor = UIColor.clearColor()
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.font = UIFont.systemFontOfSize(14)
        return nameLabel
    }()

    private lazy var backImageView: UIImageView = {
        let backImageView = UIImageView()
        backImageView.image = UIImage(named: "llll")
        backImageView.highlightedImage = UIImage(named: "kkkkkkk")
        return backImageView
    }()

    private lazy var yellowView: UIView = {
        let yellowView = UIView()
        yellowView.backgroundColor = UIColor.redColor()

        return yellowView
    }()
    private lazy var lineView: UIView = {
        let lineView = UIView()
        lineView.backgroundColor = UIColor.blackColor()
        return lineView
    }()

    // MARK: Method
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(backImageView)
        addSubview(lineView)
        addSubview(yellowView)
        addSubview(nameLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    class func cellWithTableView(tableView: UITableView) -> CategoryCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? CategoryCell
        if cell == nil {
            cell = CategoryCell(style: .Default, reuseIdentifier: identifier)
        }
        cell?.selectionStyle = UITableViewCellSelectionStyle.None
        return cell!
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        nameLabel.highlighted = selected
        backImageView.highlighted = selected
        yellowView.hidden = !selected
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        nameLabel.frame = bounds
        backImageView.frame = CGRectMake(0, 0, width, height)
        yellowView.frame = CGRectMake(0, height * 0.1, 5, height * 0.8)
        lineView.frame = CGRectMake(0, height - 1, width, 1)
    }

}
