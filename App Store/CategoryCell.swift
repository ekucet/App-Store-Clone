//
//  CategoryCell.swift
//  App Store
//
//  Created by Erkam Kucet on 06/09/16.
//  Copyright © 2016 Erkam Kucet. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  
  private let cellId = "cellID"
  
  var featuredAppsController: FeaturedAppsController?
  
  var appCategory: AppCategory? {
  
    didSet{
    
      if let name = appCategory?.name{
      
        nameLabel.text = name
      }
      
      appsColelctionView.reloadData()
    }
  }
  
  let appsColelctionView: UICollectionView = {
  
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .Horizontal
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.backgroundColor = UIColor.clearColor()
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    
    return collectionView
  }()
  
  let dividerLineView: UIView = {
  
    let view = UIView()
    view.backgroundColor = UIColor(white: 0.4, alpha: 0.4)
    view.translatesAutoresizingMaskIntoConstraints = false
    
    return view
  }()
  
  let nameLabel: UILabel = {
  
    let label = UILabel()
    label.text = "Best New Apps"
    label.font = UIFont.systemFontOfSize(16)
    label.translatesAutoresizingMaskIntoConstraints = false
    
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
    
    backgroundColor = UIColor.clearColor()
    
    addSubview(appsColelctionView)
    addSubview(dividerLineView)
    addSubview(nameLabel)
    
    appsColelctionView.dataSource = self
    appsColelctionView.delegate = self
    appsColelctionView.registerClass(AppCell.self, forCellWithReuseIdentifier: cellId)
    
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel]))
    
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dividerLineView]))
    
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":appsColelctionView]))
    addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[nameLabel(30)][v0][v1(0.5)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":appsColelctionView, "v1":dividerLineView, "nameLabel":nameLabel]))
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if let count = appCategory?.apps?.count{

      return count
    }
    
    return 0
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! AppCell
    
    cell.app = appCategory?.apps?[indexPath.item]
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    return CGSizeMake(100, frame.height - 32)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    
    return UIEdgeInsetsMake(0, 14, 0, 14)
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    print("App Selected")
    
    if let app = appCategory?.apps?[indexPath.item]{
    
      featuredAppsController?.showAppDetailForApp(app)
    }
  }
}
