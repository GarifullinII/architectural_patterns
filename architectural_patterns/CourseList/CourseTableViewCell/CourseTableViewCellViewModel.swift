//
//  CourseTableViewCellViewModel.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 18/10/2022.
//

import Foundation

protocol CourseTableViewCellViewModelProtocol {
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

class CourseTableViewCellViewModel: CourseTableViewCellViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
