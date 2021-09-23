//
//  File.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/18.
//

import UIKit

final class Router {
    
    static let shared: Router = .init()
    private init() {}

    private (set) var window: UIWindow?

    // 起動直後の画面を表示する
    func showRoot(window: UIWindow?) {
      
      
        let vc = TableViewController.makeFromStoryboard()
        let nav = UINavigationController(rootViewController: vc)
        window?.rootViewController = nav
     
      window?.makeKeyAndVisible()
      self.window = window
    }


}
