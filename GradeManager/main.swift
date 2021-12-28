//
//  GradeManager - main.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
//

/*
 * 메뉴 출력, 잘못된 입력 처리(1~5, x)
 * - 이후에도 잘못된 입력이 있다면 처리 필요
 * 학생 추가: 이름이 이미 존재한다면 추가하지 않음
 * 학생 삭제: 없는 학생은 삭제 하지 않음
 */

import Foundation

enum State: String {
    case start
    case managing
    case exit = "X"
}

enum Function: Int, CaseIterable {
    case addStudent = 1
    case deleteStudent
    case addScore
    case deleteScore
    case showAverage
}

var currentState: State = .start
var manager: GradeManager?
let printManager = GeneralPrintManager()

// MARK: - Manager LifeCycle

if currentState == .start {
    start()
    currentState = .managing
}

while currentState == .managing {
    printManager.showManageMessage()
    guard let input = readLine()?.trimmed(),
          input.isNotEmpty else {
              printManager.showWrongInputMessage()
              continue
          }

    if printManager.isExit(input) {
        currentState = .exit
        continue
    }
    guard let function = printManager.isFunctionNumber(input) else {
        printManager.showWrongInputMessage()
        continue
    }

    manager?.choiceFunction(function)
}

if currentState == .exit {
    reset()
    printManager.showExitMessage()
}

// MARK: - Method

func start() {
    manager = GradeManager()
}

func reset() {
    manager = nil
}
