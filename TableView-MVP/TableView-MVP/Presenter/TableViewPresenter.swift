//
//  TableViewPresenter.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/20.
//

import Foundation

protocol TableViewPresenterInput {
    var numberOfItems: Int { get }
    func item(forRow row: Int) -> String?
    func addNewItem(itemContent: String)
    func didEditingDelete(at indexPath: IndexPath)
    func viewDidLoad()
}

protocol TableViewPresenterOutput: AnyObject {
    func updateItem()
}


final class TableViewPresenter {
    
    private weak var view:TableViewPresenterOutput!
    private var model:ModelInput
    
    private(set) var items:[String] = []
    
    init(view: TableViewPresenterOutput, model :ModelInput) {
        self.view = view
        self.model = model
    }
    
}

extension TableViewPresenter:TableViewPresenterInput{
    
    var numberOfItems: Int {
        return items.count
    }
    
    func item(forRow row: Int) -> String? {
        guard row < items.count else {
            return nil
        }
        return items[row]
    }
    
    func viewDidLoad() {
        items = model.fetchItems()
        view.updateItem()
    }
    
    func addNewItem(itemContent: String) {
        model.addItem(itemContent: itemContent) {
                    items = model.fetchItems()
            view.updateItem()
                }
    }
    
    func didEditingDelete(at indexPath: IndexPath) {
            model.deleteItem(at: indexPath.row) {
                items = model.fetchItems()
                view.updateItem()
            }
}

    
    
}
