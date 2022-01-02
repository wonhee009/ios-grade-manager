//
//  GeneralPrintManager.swift
//  GradeManager
//
//  Created by USER on 2021/12/28.
//

import Foundation

private enum Text {
    static let menuForm = "%@: %@"
    static let menuNumberForm = "%@: %@, "
    static let exit = "종료"
    static let addStudent = "학생추가"
    static let deleteStudent = "학생삭제"
    static let addScore = "성적추가(변경)"
    static let deleteScore = "성적삭제"
    static let showAverage = "평점보기"

    static let manageMessage = "원하는 기능을 입력해주세요"
    static let exitMessage = "프로그램을 종료합니다..."
    static let wrongInput = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.\n"
}

extension State {
    static var exitString: String {
        return String(format: Text.menuForm, State.exit.rawValue, Text.exit)
    }
}

extension Function {
    var menuString: String {
        switch self {
        case .addStudent:
            return String(format: Text.menuNumberForm, self.rawValue.toString(), Text.addStudent)
        case .deleteStudent:
            return String(format: Text.menuNumberForm, self.rawValue.toString(), Text.deleteStudent)
        case .addScore:
            return String(format: Text.menuNumberForm, self.rawValue.toString(), Text.addScore)
        case .deleteScore:
            return String(format: Text.menuNumberForm, self.rawValue.toString(), Text.deleteScore)
        case .showAverage:
            return String(format: Text.menuNumberForm, self.rawValue.toString(), Text.showAverage)
        }
    }
}

struct GeneralPrintManager {

    // MARK: - show Method

    func showManageMessage() {
        Text.manageMessage.normalPrint()
        makeMenuMessage().normalPrint()
    }

    func showExitMessage() {
        Text.exitMessage.normalPrint()
    }

    func showWrongInputMessage() {
        Text.wrongInput.normalPrint()
    }

    private func makeMenuMessage() -> String {
        var menu = String()
        Function.allCases.forEach { function in
            menu.append(function.menuString)
        }
        menu.append(State.exitString)
        return menu
    }

    // MARK: - validate input Method

    func isExit(_ input: String) -> Bool {
        return input.uppercased() == State.exit.rawValue ? true : false
    }

    func isFunctionNumber(_ input: String) -> Function? {
        guard let number = Int(input),
              let function = Function(rawValue: number) else {
            return nil
        }
        return function
    }
}
