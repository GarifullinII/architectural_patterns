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
    
    var viewModel: CourseDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }


    @IBAction func toggleFavorite(_ sender: UIButton) {
        viewModel.favoriteButtonPressed()
    }
    
    private func setupUI() {
        setFavoriteButton(with: viewModel.isFavorite.value)
        
        viewModel.isFavorite.bind { [unowned self] isFavorite in
            setFavoriteButton(with: isFavorite)
        }
        
        courseNameLabel.text = viewModel.courseName
        numberOfLessonsLabel.text = viewModel.numberOfLessons
        numberOfTestsLabel.text = viewModel.numberOfTests
        guard let imageData = viewModel.imageData else { return }
        courseImage.image = UIImage(data: imageData)
    }
    
    private func setFavoriteButton(with status: Bool) {
        favoriteButton.tintColor = status ? .red : .gray
    }
}

