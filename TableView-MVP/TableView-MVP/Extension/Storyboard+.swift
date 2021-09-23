//
//  Storyboard+.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/18.
//

import UIKit

extension UIStoryboard {
    static var tableViewController:TableViewController{
        UIStoryboard(name: "TableView", bundle: nil).instantiateInitialViewController() as! TableViewController
    }
    
    static var addViewController:AddViewController{
        UIStoryboard(name: "AddView", bundle: nil).instantiateInitialViewController() as! AddViewController
    }
    
    
}
