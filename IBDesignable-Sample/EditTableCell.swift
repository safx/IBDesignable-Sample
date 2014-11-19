//
//  EditTableViewCell.swift
//  IBDesignableSample
//
//  Created by Safx Developer on 2014/11/12.
//  Copyright (c) 2014年 Safx Developers. All rights reserved.
//

import UIKit

@IBDesignable class EditTableViewCell: UIView {
    
    let titleLabel = UILabel()
    let textField = UITextField()
    
    @IBInspectable var title: String {
        get { return titleLabel.text! }
        set { titleLabel.text = newValue }
    }
    
    @IBInspectable var placeholder: String? {
        get { return textField.placeholder }
        set { textField.placeholder = newValue }
    }
    
    //MARK: view
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        if titleLabel.text == nil {
            title = "titleを入力してください"
        }
        if textField.placeholder == nil {
            placeholder = "placeholderを入力してください"
        }
    }
    
    private func setupView() {
        addSubview(titleLabel)
        addSubview(textField)
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        textField.setTranslatesAutoresizingMaskIntoConstraints(false)
        addConstraints(layoutConstraints())
    }
    
    private func layoutConstraints() -> [AnyObject] {
        func $(view1: AnyObject!, attr1: NSLayoutAttribute, rel: NSLayoutRelation,
            view2: AnyObject!, attr2: NSLayoutAttribute, mul: CGFloat, constant: CGFloat) -> NSLayoutConstraint {
                return NSLayoutConstraint(item: view1, attribute: attr1, relatedBy: rel, toItem: view2, attribute: attr2, multiplier: mul, constant: constant)
        }
        
        var result: [AnyObject] = []
        result.append($(titleLabel, .Height, .Equal, self, .Height, 1.0, 0.0))
        result.append($(titleLabel, .CenterY, .Equal, self, .CenterY, 1.0, 0.0))
        result.append($(titleLabel, .Leading, .Equal, self, .Leading, 1.0, 16.0))
        
        result.append($(textField, .Leading, .Equal, titleLabel, .Trailing, 1.0, 16.0))
        
        result.append($(textField, .Height, .Equal, self, .Height, 1.0, 0.0))
        result.append($(textField, .CenterY, .Equal, self, .CenterY, 1.0, 0.0))
        result.append($(textField, .Trailing, .Equal, self, .Trailing, 1.0, -16.0))
        
        return result
    }
}
