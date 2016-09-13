//
//  AppCell.swift
//  App Store
//
//  Created by Erkam Kucet on 10/09/16.
//  Copyright © 2016 Erkam Kucet. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
  
  var app: App? {
    
    didSet {
      
      if let name = app?.name {
        
        nameLabel.text = name
        
        let rect = NSString(string: name).boundingRectWithSize(CGSizeMake(frame.width, 1000), options: NSStringDrawingOptions.UsesFontLeading.union(NSStringDrawingOptions.UsesLineFragmentOrigin), attributes: [NSFontAttributeName: UIFont.systemFontOfSize(14)], context: nil)
        
        if rect.height > 20 {
          categoryLabel.frame = CGRectMake(0, frame.width + 38, frame.width, 20)
          priceLabel.frame = CGRectMake(0, frame.width + 56, frame.width, 20)
        } else {
          categoryLabel.frame = CGRectMake(0, frame.width + 22, frame.width, 20)
          priceLabel.frame = CGRectMake(0, frame.width + 40, frame.width, 20)
        }
        
        nameLabel.frame = CGRectMake(0, frame.width + 5, frame.width, 40)
        nameLabel.sizeToFit()
      }
      
      categoryLabel.text = app?.category
      
      if let price = app?.price {
        priceLabel.text = "$\(price)"
      } else {
        priceLabel.text = ""
      }
      
      if let imageName = app?.imageName {
        imageView.image = UIImage(named: imageName)
      }
      
    }
  }
  
  let imageView: UIImageView = {
    
    let iv = UIImageView()
    iv.image = UIImage(named: "frozen")
    iv.contentMode = .ScaleAspectFill
    iv.layer.cornerRadius = 16
    iv.layer.masksToBounds = true
    return iv
    
  }()
  
  let nameLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Disney Build It: Frozen"
    label.font = UIFont.systemFontOfSize(14)
    label.numberOfLines = 2
    
    return label
  }()
  
  let categoryLabel: UILabel = {
    
    let label = UILabel()
    label.text = "Enterteiment"
    label.font = UIFont.systemFontOfSize(13)
    label.numberOfLines = 2
    
    return label
  }()
  
  let priceLabel: UILabel = {
    
    let label = UILabel()
    label.text = "$3.99"
    label.font = UIFont.systemFontOfSize(13)
    label.textColor = UIColor.darkGrayColor()
    label.numberOfLines = 2
    
    return label
  }()
  
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews(){
    
    addSubview(imageView)
    addSubview(nameLabel)
    addSubview(categoryLabel)
    addSubview(priceLabel)
    
    imageView.frame = CGRectMake(0, 0, frame.width, frame.width)
    nameLabel.frame = CGRectMake(0, frame.width + 2, frame.width, 40)
    categoryLabel.frame = CGRectMake(0, frame.width + 42, frame.width, 20)
    priceLabel.frame = CGRectMake(0, frame.width + 56, frame.width, 20)
  }
}
