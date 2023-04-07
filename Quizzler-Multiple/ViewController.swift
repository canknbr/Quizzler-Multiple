//
//  ViewController.swift
//  Quizzler-Multiple
//
//  Created by Can Kanbur on 7.04.2023.
//

import UIKit

class ViewController: UIViewController {
    var quizBrain = QuizBrain()
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    
    @IBAction func selectButton(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let userRight = quizBrain.checkAnswer(userAnswer)
        
        if userRight {
            sender.backgroundColor = .green
        }else{
            sender.backgroundColor = .red
        }
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(update), userInfo: nil, repeats: false)
    }
    
    
    @objc func update(){
        questionLabel.text = quizBrain.getQuestion()
        let answers = quizBrain.getAnswer()
        choiceOneButton.setTitle(answers[0], for: .normal)
        choiceTwoButton.setTitle(answers[1], for: .normal)
        choiceThreeButton.setTitle(answers[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceOneButton.backgroundColor = .clear
        choiceTwoButton.backgroundColor = .clear
        choiceThreeButton.backgroundColor = .clear
    }
    
}

