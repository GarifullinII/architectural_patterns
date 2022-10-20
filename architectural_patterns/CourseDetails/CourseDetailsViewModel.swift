//
//  CourseDetailsViewModel.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 12/10/2022.
//

import Foundation

protocol CourseDetailsViewModelProtocol: AnyObject {
    var courseName: String { get }
    var numberOfLessons: String { get }
    var numberOfTests: String { get }
    var imageData: Data? { get }
    var isFavorite: Box<Bool> { get }
    init(course: Course)
    func favoriteButtonPressed()
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var numberOfLessons: String {
        "Number of lessons: \(course.numberOfLessons)"
    }
    
    var numberOfTests: String {
        "Number of tests: \(course.numberOfTests)"
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageUrl)
    }
    
    var isFavorite: Box<Bool>
    
    var viewModelDidChange: ((CourseDetailsViewModelProtocol) -> Void)?
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
        isFavorite = Box(value: DataManager.shared.getFavoriteStatus(for: course.name))
    }
    
    func favoriteButtonPressed() {
        isFavorite.value.toggle()
        DataManager.shared.setFavoriteStatus(for: course.name, with: isFavorite.value)
    }
}
