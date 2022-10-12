//
//  CourseDetailsViewModel.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 12/10/2022.
//

protocol CourseDetailsViewModelProtocol: AnyObject {
    var courseName: String { get }
    
    init(course: Course)
}

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
