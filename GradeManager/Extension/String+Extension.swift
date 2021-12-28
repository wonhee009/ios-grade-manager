//
//  String+Extension.swift
//  GradeManager
//
//  Created by USER on 2021/12/28.
//

import Foundation

extension String {
    func normalPrint() {
        return print(self)
    }

    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespaces)
    }

    var isNotEmpty: Bool {
        return !self.isEmpty
    }
}
