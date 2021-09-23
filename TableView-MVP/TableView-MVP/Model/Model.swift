//
//  Model.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/19.
//

import UIKit

protocol ModelInput {
    func fetchItems() -> [String]
    func addItem(itemContent: String, completion: () -> ())
    func deleteItem(at index: Int, completion: () -> ())

}


final class Model:ModelInput{
    
    private let userDefaluts = UserDefaults.standard
        private let ITEM_KEY = "TodoItems"
        
        func fetchItems() -> [String] {
            return userDefaluts.array(forKey: ITEM_KEY) as! [String]
        }
    
    func addItem(itemContent: String, completion: () -> ()) {
            var items = userDefaluts.array(forKey: ITEM_KEY) as! [String]
            items.append(itemContent)
            userDefaluts.set(items, forKey: ITEM_KEY)
            completion()
        }

    func deleteItem(at index: Int, completion: () -> ()) {
        var items = userDefaluts.array(forKey: ITEM_KEY) as! [String]
                items.remove(at: index)
                userDefaluts.set(items, forKey: ITEM_KEY)
                completion()
    }
}
