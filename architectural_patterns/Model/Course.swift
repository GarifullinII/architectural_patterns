//
//  Course.swift
//  architectural_patterns
//
//  Created by Ildar Garifullin on 12/10/2022.
//

import Foundation

struct Course: Decodable {
    let name: String
    let imageUrl: URL
    let numberOfLessons: Int
    let numberOfTests: Int
}
