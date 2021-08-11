//
//  TableViewCell.swift
//  homework10-11
//
//  Created by Maria Berger on 10.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet var cellLabel: UILabel!

// MARK: - Public methods
func configure(with activity: Activity?) {
    DispatchQueue.global().async {
        guard (activity?.activity) != nil else { return }
        guard (activity?.type) != nil else { return }
        guard (activity?.price) != nil else { return }
        guard (activity?.participants) != nil else { return }
}

}
}
