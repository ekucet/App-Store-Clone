//
//  HeaderCell.swift
//  App Store
//
//  Created by Erkam Kucet on 10/09/16.
//  Copyright © 2016 Erkam Kucet. All rights reserved.
//

import UIKit

class Header: CategoryCell {
  
  let cellId = "bannerCellId"
  
  override func setupViews() {
    
    appsColelctionView.dataSource = self
    appsColelctionView.delegate = self
    
    appsColelctionView.registerClass(BannerCell.self, forCellWithReuseIdentifier: cellId)
    
    addSubview(appsColelctionView)
    appsColelctionView.translatesAutoresizingMaskIntoConstraints = false
    
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":appsColelctionView]))
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":appsColelctionView]))
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! AppCell
    
    cell.app = appCategory?.apps?[indexPath.item]
    
    return cell
  }
  
  override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    return CGSizeMake(frame.width / 2 + 56, frame.height)
  }
  
  override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    
    return UIEdgeInsetsMake(0, 0, 0, 0)
  }
  
  private class BannerCell: AppCell{
    
    private override func setupViews() {
      imageView.layer.cornerRadius = 0
      imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).CGColor
      imageView.layer.borderWidth = 0.5
      imageView.translatesAutoresizingMaskIntoConstraints = false
      addSubview(imageView)
      addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
      addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":imageView]))
    }
  }
}