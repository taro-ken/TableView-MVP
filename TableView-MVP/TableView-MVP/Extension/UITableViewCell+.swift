//
//  UITableViewCell+.swift
//  TableView-MVP
//
//  Created by 木元健太郎 on 2021/09/23.
//

import UIKit

extension UITableViewCell {
  static var nib: UINib { UINib(nibName: reuseIdentifier, bundle: nil) }
  static var reuseIdentifier: String { String(describing: Self.self) }
}

