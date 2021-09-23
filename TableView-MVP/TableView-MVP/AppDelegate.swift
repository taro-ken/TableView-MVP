//
//  AppDelegate.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/18.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        UserDefaults.standard.register(defaults: ["TodoItems": ["Item1",
                                                                        "Item2",
                                                                        "Item3",
                                                                        "Item4",
                                                                        "Item5"]])
        let view = UIStoryboard(name:"TableView",bundle: nil).instantiateInitialViewController() as! TableViewController
        let model = Model()
        
        let presenter = TableViewPresenter(view: view, model: model)
        
        view.inject(presenter: presenter)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = view
        window?.makeKeyAndVisible()
        
        return true
    }

   

}

