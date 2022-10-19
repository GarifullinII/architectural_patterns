//
//  CourseTableViewCell.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 18/10/2022.
//

import UIKit

class CourseTableViewCell: UITableViewCell {
    var viewModel: CourseTableViewCellViewModelProtocol! {
        didSet {
            var content = defaultContentConfiguration()
            content.text = viewModel.courseName
            guard let imageData = viewModel.imageData else { return }
            content.image = UIImage(data: imageData)
            contentConfiguration = content
        }
    }
}
