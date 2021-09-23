//
//  ViewController.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/18.
//

import UIKit

final class TableViewController: UIViewController {
    

    private var presenter: TableViewPresenterInput!
    func inject(presenter: TableViewPresenterInput) {
      self.presenter = presenter
    }
   
    
    
    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var newItemTextField: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.dataSource = self
        TableView.delegate = self
        presenter.viewDidLoad()
        
    }
    
    @IBAction func tappedAddButton(_ sender: Any) {
        if !newItemTextField.text!.isEmpty{
            presenter.addNewItem(itemContent: newItemTextField.text!)
            newItemTextField.text = ""
        }
    }
    
}

extension TableViewController: TableViewPresenterOutput{
    func updateItem() {
        TableView.reloadData()
    }
    
    
}


extension TableViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.numberOfItems
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = presenter.item(forRow: indexPath.row)
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.didEditingDelete(at: indexPath)
        }
    }
}
