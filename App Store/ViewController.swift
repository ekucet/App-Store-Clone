//
//  ViewController.swift
//  App Store
//
//  Created by Erkam Kucet on 06/09/16.
//  Copyright © 2016 Erkam Kucet. All rights reserved.
//

import UIKit

class FeaturedAppsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

  private let cellId = "cellID"
  private let largeCell = "largeCellId"
  private let headerId = "headerCellId"
  
  var appCategories: [AppCategory]?
  var featuredApps: FeaturedApps?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Fetured Apps"
    
    AppCategory.fetchFeaturedApps { (featuredApps) in
      
      self.featuredApps = featuredApps
      self.appCategories = featuredApps.appCategories
      self.collectionView?.reloadData()
    }
    
    //appCategories = AppCategory.sampleAppCategories()
    
    collectionView?.backgroundColor = UIColor.whiteColor()
    
    collectionView?.registerClass(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    collectionView?.registerClass(LargeCategoryCell.self, forCellWithReuseIdentifier: largeCell)
    collectionView?.registerClass(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    if let count = appCategories?.count{
    
      return count
    }
    
    return 0
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
  
    if indexPath.item == 2 {
    
      let cell = collectionView.dequeueReusableCellWithReuseIdentifier(largeCell, forIndexPath: indexPath) as! LargeCategoryCell
      cell.appCategory = appCategories?[indexPath.item]
      cell.featuredAppsController = self
      
      return cell
    }
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellId, forIndexPath: indexPath) as! CategoryCell
    
    cell.appCategory = appCategories?[indexPath.item]
    cell.featuredAppsController = self
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    if indexPath.item == 2{
    
      return CGSizeMake(view.frame.width, 160)
    }
    
    return CGSizeMake(self.view.frame.width, 230)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    
    return CGSizeMake(view.frame.width, 120)
  }
  
  override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
    
    let header = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: headerId, forIndexPath: indexPath) as! Header
    
    header.appCategory = featuredApps?.bannerCategory
    
    return header
  }
  
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    let appDetailController = UIViewController()
    
    navigationController?.pushViewController(appDetailController, animated: true)
    
    print("Selected")
  }
  
  func showAppDetailForApp(app: App){
  
    let layout = UICollectionViewFlowLayout()
    
    let appDetailController = AppDetailController(collectionViewLayout: layout)
    appDetailController.app = app
    navigationController?.pushViewController(appDetailController, animated: true)
  }
  
}