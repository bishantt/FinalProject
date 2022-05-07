//
//  ComputerScienceQuestion.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/24/22.
//


import Foundation

struct ComputerScienceQuestion {
    let CompSciQuestion = [Question(q: "What do you call a computer on a network that requests files from another computer?", a: ["A Client","A Host","A Router","A Web Server"], correctAnswer: "A Client"),
                           Question(q: "Hardware devices that are not part of the main computer system and are often added later to the system.", a: ["Peripheral","Clip art","Highlight","Execute"], correctAnswer: "Peripheral"),
                           Question(q: "The main computer that stores the files that can be sent to computers that are networked together is:", a: ["Clip art","Mother board","Peripheral","File server"], correctAnswer: "File server"),
                           Question(q: "How can you catch a computer virus?", a: ["Sending e-mail messages","Using a laptop during the winter","Opening e-mail attachments","Shopping on-line"], correctAnswer: "Opening e-mail attachments"),
                           Question(q: "Google (www.google.com) is a:", a: ["Search Engine","Number in Math","Directory of images","Chat service on the web"], correctAnswer: "Search Engine"),
                           Question(q: "Which is not an Internet protocol?", a: ["HTTP","FTP","STP","IP"], correctAnswer: "STP"),
                           Question(q: "Which of the following is not a valid domain name?", a: ["www.yahoo.com","www.yahoo.co.uk","www.com.yahoo","www.yahoo.co.in"], correctAnswer: "www.com.yahoo"),
                           Question(q: "AOL stands for:", a: ["Arranged Outer Line","America Over LAN","Audio Over LAN","America On-line"], correctAnswer: "America On-line"),
                           Question(q: "Another name for a computer chip is:", a: ["Execute","Micro chip","Microprocessor","Select"], correctAnswer: "Micro chip"),
                           Question(q: "www stands for:", a: ["World Wide Web","World Wide Wares","World Wide Wait","World Wide War"], correctAnswer: "World Wide Web")]
    
    var questionNumber = 0
    var currentScore = 0
    
    
    mutating func checkAnswer(_ userAnswer: String)-> Bool{
        if userAnswer == CompSciQuestion[questionNumber].answer{
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
        return CompSciQuestion[questionNumber].text
    }
    
    func getOption1Text() -> String{
        return CompSciQuestion[questionNumber].choices[0]
    }
    
    func getOption2Text() -> String{
        return CompSciQuestion[questionNumber].choices[1]
    }
    
    func getOption3Text() -> String{
        return CompSciQuestion[questionNumber].choices[2]
    }
    
    func getOption4Text() -> String{
        return CompSciQuestion[questionNumber].choices[3]
    }

    
    mutating func nextQuestion(){
        if(questionNumber < CompSciQuestion.count - 1){
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
        return CompSciQuestion.count
    }
}

