//
//  LargeCategoryCell.swift
//  App Store
//
//  Created by Erkam Kucet on 10/09/16.
//  Copyright © 2016 Erkam Kucet. All rights reserved.
//

import UIKit

class LargeCategoryCell: CategoryCell{
  
  private let largeAppCellId = "largeAppCellId"
  
  override func setupViews() {
    super.setupViews()
    appsColelctionView.registerClass(LargeAppCell.self, forCellWithReuseIdentifier: largeAppCellId)
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(largeAppCellId, forIndexPath: indexPath) as! AppCell
    
    cell.app = appCategory?.apps?[indexPath.item]
    
    return cell
  }
  
  override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    return CGSizeMake(200, frame.height - 32)
  }
  
  private class LargeAppCell: AppCell{
    
    private override func setupViews() {
      imageView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(imageView)
      addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
      addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-2-[v0]-14-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
    }
  }
}
