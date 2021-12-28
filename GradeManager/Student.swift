//
//  Student.swift
//  GradeManager
//
//  Created by USER on 2021/12/28.
//

import Foundation

class Student {
    let name: String
    var grade: [String : String]

    init(name: String) {
        self.name = name
        self.grade = [:]
    }
}
