//
//  HistoryViewController.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/22/22.
//

import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet var scoreLabel: UILabel!
    
    
    @IBOutlet var questionNumLabel: UILabel!
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var answer1Label: UIButton!
    
    @IBOutlet var answer2Label: UIButton!
    
    @IBOutlet var answer3Label: UIButton!
    
    @IBOutlet var answer4Label: UIButton!

    var questionObj = HistoryQuestion()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        title = "History Quiz"
        setupElements()
        updateUi()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        var answerChecked = questionObj.checkAnswer(userAnswer)
        
        if answerChecked{
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = .red
        }
        
        questionObj.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
    
    }
    
    @objc func updateUi(){
        questionLabel.text = questionObj.getQuestionText()
        answer1Label.setTitle("\(questionObj.getOption1Text())", for: .normal)
        answer2Label.setTitle("\(questionObj.getOption2Text())", for: .normal)
        answer3Label.setTitle("\(questionObj.getOption3Text())", for: .normal)
        answer4Label.setTitle("\(questionObj.getOption4Text())", for: .normal)
        
        scoreLabel.text = "Score: \(questionObj.getScore())"
        questionNumLabel.text = "Question # \(questionObj.getQuestionNumber()) / \(questionObj.getTotalQuestion())"
        
        answer1Label.backgroundColor = .clear
        answer2Label.backgroundColor = .clear
        answer3Label.backgroundColor = .clear
        answer4Label.backgroundColor = .clear
        
    }
    
    func setupElements() {
        Utilities.styleFilledButton(answer1Label)
        Utilities.styleFilledButton(answer2Label)
        Utilities.styleFilledButton(answer3Label)
        Utilities.styleFilledButton(answer4Label)
    }
    
    
}
