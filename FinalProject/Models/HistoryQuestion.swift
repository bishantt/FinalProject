//
//  HistoryQuestion.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/24/22.
//

import Foundation

struct HistoryQuestion {
    let HistQuestion = [Question(q: "Whose death sparked World War I?", a: ["Kaiser Wilhelm","Archbishop Ussher","Queen Victoria","Archduke Franz Ferdinand"], correctAnswer: "Archduke Franz Ferdinand"),
                       Question(q: "Which of these nations was neutral in World War I?", a: ["Germany","Norway","Italy","England"], correctAnswer: "Norway"),
                       Question(q: "Which of these ships was sunk by a German submarine?", a: ["Arizona","Lusitania","Titanic","Andrea Doria"], correctAnswer: "Lusitania"),
                       Question(q: "Which weapon was first used at the Battle of the Somme in World War I?", a: ["Submarine","Tank","Jet fighter","Chariot"], correctAnswer: "Tank"),
                       Question(q: "World War I ended in:", a: ["1925","1918","1920","1915"], correctAnswer: "1918"),
                       Question(q: "Which of these people was a spy in World War I?", a: ["James Bond","Mata Hari","Benedict Arnold","Serge Plekhanov"], correctAnswer: "Mata Hari"),
                       Question(q: "How many republics made up the former Soviet Union?", a: ["15","12","20","10"], correctAnswer: "15"),
                       Question(q: "When was the first Nobel Prize in economics awarded?", a: ["1969","1949","1909","1929"], correctAnswer: "1969"),
                       Question(q: "Which book was written by Niccolò Machiavelli?", a: ["The Once and Future King","The Prince","The Good Earth","War and Peace"], correctAnswer: "The Prince"),
                       Question(q: "Of what country was Simón Bolívar president?", a: ["Bolivia","Peru","Argentina","Chile"], correctAnswer: "Peru")]
    
    var questionNumber = 0
    var currentScore = 0
    
    
    mutating func checkAnswer(_ userAnswer: String)-> Bool{
        if userAnswer == HistQuestion[questionNumber].answer{
            //User got it right
            currentScore += 1
            return true
        } else {
            //User got it wrong
            currentScore -= 1
            return false
        }
        
    }
    
    func getQuestionText()-> String {
        return HistQuestion[questionNumber].text
    }
    
    func getOption1Text() -> String{
        return HistQuestion[questionNumber].choices[0]
    }
    
    func getOption2Text() -> String{
        return HistQuestion[questionNumber].choices[1]
    }
    
    func getOption3Text() -> String{
        return HistQuestion[questionNumber].choices[2]
    }
    
    func getOption4Text() -> String{
        return HistQuestion[questionNumber].choices[3]
    }

    
    mutating func nextQuestion(){
        if(questionNumber < HistQuestion.count - 1){
            questionNumber += 1
        } else {
            questionNumber = 0
            currentScore = 0
            print("Start from Begining")
        }
    }
    
    func getScore()-> Int{
        return currentScore
    }
    
    func getQuestionNumber() -> Int{
        return questionNumber + 1
    }
    
    func getTotalQuestion() -> Int{
        return HistQuestion.count
    }
}

