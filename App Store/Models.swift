//
//  Models.swift
//  App Store
//
//  Created by Erkam Kucet on 07/09/16.
//  Copyright © 2016 Erkam Kucet. All rights reserved.
//

import UIKit

class FeaturedApps: NSObject {
  
  var bannerCategory: AppCategory?
  var appCategories: [AppCategory]?
  
  override func setValue(value: AnyObject?, forKey key: String) {
    
    if key == "categories"{
    
      appCategories = [AppCategory]()
      
      for dict in value as! [[String: AnyObject]]{
      
        let appCategory = AppCategory()
        appCategory.setValuesForKeysWithDictionary(dict)
        appCategories?.append(appCategory)
      }
    }else if key == "bannerCategory"{
    
      bannerCategory = AppCategory()
      bannerCategory?.setValuesForKeysWithDictionary(value as! [String:AnyObject])
      
    }else{
    
      super.setValue(value, forKey: key)
    }
  }
}

class AppCategory: NSObject{

  var name: String?
  var apps: [App]?
  var type: String?
  
  override func setValue(value: AnyObject?, forKey key: String) {
    
    if key == "apps"{
    
      apps = [App]()
      for dict in value as! [[String:AnyObject]]{
      
        let app = App()
        app.setValuesForKeysWithDictionary(dict)
        apps?.append(app)
      }
    }else {
      super.setValue(value, forKey: key)
    }
  }
  
  static func fetchFeaturedApps(completionHandler: (FeaturedApps) -> ()){
  
    let urlString = "http://www.statsallday.com/appstore/featured"
    NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: urlString)!) { (data, response, error) in
      
      if error != nil{
      
        print(error?.localizedDescription)
        return
      }
      
      do{
      
        let json = try(NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers))
        
        let featuredApps = FeaturedApps()
        
        featuredApps.setValuesForKeysWithDictionary(json as! [String:AnyObject])
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
          completionHandler(featuredApps)
        })
        
        print(featuredApps)
        
      }catch let err {
      
        print(err)
      }
    }.resume()
  }
}

class App: NSObject {
  
  var id: NSNumber?
  var name: String?
  var category: String?
  var imageName: String?
  var price: NSNumber?
}
