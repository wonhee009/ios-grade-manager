//
//  GradeManager.swift
//  GradeManager
//
//  Created by USER on 2021/12/28.
//

import Foundation

private enum Text {
    static let wrongInput = "입력이 잘못되었습니다. 다시 확인해주세요."

    static let addStudentStart = "추가할 학생의 이름을 입력해주세요"
    static let addStudentSuccess = "%@ 학생을 추가했습니다."
    static let addStudentExistence = "%@은 이미 존재하는 학생입니다. 추가하지 않습니다."

    static let deleteStudentStart = "삭제할 학생의 이름을 입력해주세요"
    static let deleteStudentSuccess = "%@ 학생을 삭제하였습니다."
    static let deleteStudentFailSearch = "%@ 학생을 찾지 못했습니다."
}

final class GradeManager {
    private var students: [String : Student] = [:]

    func choiceFunction(_ function: Function) {
        switch function {
        case .addStudent:
            addStudent()
        case .deleteStudent:
            deleteStudent()
        case .addScore:
            addScore()
        case .deleteScore:
            deleteScore()
        case .showAverage:
            showAverage()
        }
    }

    // MARK: - validate Method

    private func validateName(_ name: String) -> Bool {
        return name.isNotEmpty
    }

    private func isExistenceName(_ name: String) -> Bool {
        return students.keys.contains(name)
    }

    // MARK: - add student

    private func addStudent() {
        Text.addStudentStart.normalPrint()
        guard let name = readLine()?.trimmed() else {
            return
        }
        if !validateName(name) {
            Text.wrongInput.normalPrint()
            return
        }
        if isExistenceName(name) {
            String(format: Text.addStudentExistence, name).normalPrint()
            return
        }
        addStudent(name: name)
        String(format: Text.addStudentSuccess, name).normalPrint()
    }

    // MARK: - delete student

    private func deleteStudent() {
        Text.deleteStudentStart.normalPrint()
        guard let name = readLine()?.trimmed() else {
            return
        }
        if !validateName(name) {
            Text.wrongInput.normalPrint()
            return
        }
        if !isExistenceName(name) {
            String(format: Text.deleteStudentFailSearch, name).normalPrint()
            return
        }
        deleteStudent(name: name)
        String(format: Text.deleteStudentSuccess, name).normalPrint()
    }

    private func addScore() {

    }

    private func deleteScore() {

    }

    private func showAverage() {

    }
}

private extension GradeManager {
    func addStudent(name: String) {
        students[name] = Student(name: name)
    }

    func deleteStudent(name: String) {
        students.removeValue(forKey: name)
    }
}
