//
//  ScienceQuestion.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/24/22.
//

import Foundation

struct ScienceQuestion {
    let SciQuestion = [Question(q: "Brass gets discoloured in air because of the presence of which of the following gases in air?", a: ["Oxygen", "Hydrogen Sulphide", "Carbondioxide","Nitrogen"], correctAnswer: "Hydrogen Sulphide"),
                Question(q: "Which of the following is a non metal that remains liquid at room temperature?", a: ["Phosphorous", "Bromine", "Chlorine","Helium"], correctAnswer: "Bromine"),
                Question(q: "Chlorophyll is a naturally occurring chelate compound in which central metal is", a: ["Copper", "Magnesium", "Iron", "Calcium"], correctAnswer: "Magnesium"),
                Question(q: "Which of the following is used in pencils?", a: ["Graphite", "Silicon", "Charcoal", "Iron"], correctAnswer: "Graphite"),
                Question(q: "Which of the following metals forms an amalgam with other metals?", a: ["Tin", "Mercury", "Lead", "Zinc"], correctAnswer: "Mercury"),
                Question(q: "Chemical formula for water is", a: ["NaAlO2", "H2O", "Al2O3", "CaSiO3"], correctAnswer: "H2O"),
                Question(q: "The gas usually filled in the electric bulb is", a: ["Nitrogen", "Hydrogen", "Carbondioxide","Oxygen"], correctAnswer: "Nitrogen"),
                Question(q: "Washing soda is the common name for", a: ["Sodium Carbonate", "Calcium Bicarbonate", "Sodium Bicarbonate", "Calcium Carbonate"], correctAnswer: "Sodium Carbonate"),
                Question(q: "Quartz crystals normally used in quartz clocks etc. is chemically", a: ["Silicon Dioxide", "Germanium Oxide", "A mixture of germanium oxide and silicon dioxide","Sodium Silicate"], correctAnswer: "Silicon Dioxide"),
                Question(q: "Which of the gas is not known as green house gas?", a: ["Methane", "Nitrous Oxide", "Carbon dioxide","Hydrogen"], correctAnswer: "Hydrogen")]
    
    var questionNumber = 0
    var currentScore = 0
    
    
    mutating func checkAnswer(_ userAnswer: String)-> Bool{
        if userAnswer == SciQuestion[questionNumber].answer{
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
        return SciQuestion[questionNumber].text
    }
    
    func getOption1Text() -> String{
        return SciQuestion[questionNumber].choices[0]
    }
    
    func getOption2Text() -> String{
        return SciQuestion[questionNumber].choices[1]
    }
    
    func getOption3Text() -> String{
        return SciQuestion[questionNumber].choices[2]
    }
    
    func getOption4Text() -> String{
        return SciQuestion[questionNumber].choices[3]
    }

    
    mutating func nextQuestion(){
        if(questionNumber < SciQuestion.count - 1){
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
    
    func getActualQuesNumber() -> Int {
        return questionNumber
    }
    
    func getQuestionNumber() -> Int{
        return questionNumber + 1
    }
    
    func getTotalQuestion() -> Int{
        return SciQuestion.count
    }
}

