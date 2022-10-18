//
//  ViewController.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 12/10/2022.
//

import UIKit

class CourseDetailsViewController: UIViewController {

    @IBOutlet var courseNameLabel: UILabel!
    @IBOutlet var numberOfLessonsLabel: UILabel!
    @IBOutlet var numberOfTestsLabel: UILabel!
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var favoriteButton: UIButton!
    
    var course: Course!
    
    var viewModel: CourseDetailsViewModelProtocol! {
        didSet {
            courseNameLabel.text = viewModel.courseName
            numberOfLessonsLabel.text = viewModel.numberOfLessons
            numberOfTestsLabel.text = viewModel.numberOfTests
            
        }
    }
    
    private var isFavorite = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = CourseDetailsViewModel(course: course)
        setupUI()
    }


    @IBAction func toggleFavorite(_ sender: UIButton) {
        isFavorite.toggle()
        
    }
    
    private func setupUI() {
        
        if let imageData = ImageManager.shared.fetchImageData(from: course.imageUrl) {
            courseImage.image = UIImage(data: imageData)
        }
    }
}

