//
//  PlayViewModel.swift
//  math_animal
//
//  Created by tientran on 25/01/2021.
//

import SwiftUI

class PlayViewModel: ObservableObject {
    
    @Published var progressValue: Float = 0.0
    @Published var counterNumber : Int = 0
    @Published var currentAnswerIndex : Int = 5
    @Published var currentAnswer : Int = 0
    @Published var listZodiac : [ZodiacModel] = []
    @Published var listAnswer : [Int] = []
    @Published var indexScence : Int = 1
    @Published var isShowResult : Bool = false
    private var timer = Timer()
    
    func getProgressValue() -> Float {
        return progressValue
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            DispatchQueue.main.async {
                if self.counterNumber < 15 {
                    self.progressValue += 0.06666666667
                    self.counterNumber += 1
                }
                else{
                    self.isShowResult.toggle()
                    self.timer.invalidate()
                }
            }
        }
    }
    
    func getCounterNumber() -> Int  {
        return counterNumber
    }
    

    func loadZodiacListWith4Zodiac()  {
        let listZodiacRaw = Array(ZodiacData.getListZodiac().shuffled()[0...3])
        listZodiac = listZodiacRaw
        generateListAnswer()
    }
    
    func generateListAnswer()  {
        listAnswer = []
        let exactResult = calculorScore()
        for i in 0...3 {
            listAnswer.append(exactResult + i)
        }
        listAnswer.shuffle()
        startTimer()
    }
    
    func getListZodiac() -> [ZodiacModel] {
        return listZodiac
    }
    
    func getAnswerList() -> [Int] {
        return listAnswer
    }
    
    func calculorScore() -> Int {
        var exactResult = 0
        listZodiac.forEach { zodiac in
            exactResult += zodiac.score
        }
        print("exact result: \(exactResult)")
        return exactResult
    }
    
    func checkResult() -> Bool  {
        print("current answer: \(currentAnswer)")
        return currentAnswer == calculorScore()
    }
    
    func stopGame()  {
        timer.invalidate()
        counterNumber = 0
        progressValue = 0.0
        currentAnswerIndex = 5
    }
    
    func nextScence()  {
        counterNumber = 0
        progressValue = 0.0
        currentAnswerIndex = 5
        loadZodiacListWith4Zodiac()
        indexScence += 1
        startTimer()
    }

}
