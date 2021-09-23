//
//  TableViewCell.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/19.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var cellexplanation: UITextView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellTitle.text = nil
        cellexplanation.text = nil
    }
    
    func configure(model:CellModel) {
        cellTitle.text = model.title
        cellexplanation.text = model.explanation
        
    }
}
