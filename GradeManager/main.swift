//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

import Foundation

enum State: String {
    case start
    case exit = "X"
}

enum Function: Int, CaseIterable {
    case addStudent = 1
    case deleteStudent
    case addScore
    case deleteScore
    case showAverage
}

var manager: GradeManager?
let printManager = GeneralPrintManager()

// MARK: - Manager LifeCycle

gradeManageStart()

while manager?.currentState != .exit {
    printManager.showManageMessage()
    guard let input = readLine()?.trimmed(),
          input.isNotEmpty else {
              printManager.showWrongInputMessage()
              continue
          }

    if printManager.isExit(input) {
        manager?.currentState = .exit
        continue
    }
    guard let function = printManager.isFunctionNumber(input) else {
        printManager.showWrongInputMessage()
        continue
    }

    manager?.choiceFunction(function)
}

if manager?.currentState == .exit {
    gradeManageReset()
    printManager.showExitMessage()
}

// MARK: - Method

func gradeManageStart() {
    manager = GradeManager()
}

func gradeManageReset() {
    manager = nil
}
