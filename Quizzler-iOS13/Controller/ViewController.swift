//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreDisplay: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    
    var quizBrain = QuizBrain()
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        //answer checking
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            score += 1
            
            sender.backgroundColor = UIColor.green
        } else {
            print("wrong")
            sender.backgroundColor = UIColor.red
        }
        
        //progression
        quizBrain.nextQuestion()

        //time delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
    }
    
    func updateUI() {
        self.aButton.backgroundColor = UIColor.clear
        self.bButton.backgroundColor = UIColor.clear
        self.cButton.backgroundColor = UIColor.clear
        
        //MC rather than True or False, buttons must display question
        self.aButton.setTitle(quizBrain.getChoice(0), for: UIControl.State .normal)
        self.bButton.setTitle(quizBrain.getChoice(1), for: UIControl.State .normal)
        self.cButton.setTitle(quizBrain.getChoice(2), for: UIControl.State .normal)
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreDisplay.text = "Score: \(quizBrain.getScore())"
    }
    
}
