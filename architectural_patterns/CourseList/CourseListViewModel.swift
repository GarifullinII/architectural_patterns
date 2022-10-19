//
//  CourseListViewModel.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 18/10/2022.
//

import Foundation

protocol CourseListViewModelProtocol: AnyObject {
    var courses: [Course] { get }
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol
    func viewModelForSelectedRow(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol
}

class CourseListViewModel: CourseListViewModelProtocol {
    var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { [unowned self] courses in
            self.courses = courses
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol {
        let course = courses[indexPath.row]
        
        return CourseTableViewCellViewModel(course: course)
    }
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol {
        let course = courses[indexPath.row]
        
        return CourseDetailsViewModel(course: course)
    }
}
