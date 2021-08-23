//
//  ViewController.swift
//  BullsEyeiOS15
//
//  Created by Joshua Basche on 8/19/21.
//

import UIKit

class ViewController: UIViewController {
  
  //IBOutlets
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  
  //Variables
  var currentValue: Int = 0
  var targetValue: Int = 0
  var roundValue: Int = 0
  var scoreValue: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()

    startNewGame()
  }
  
  func updateLabels() {
    targetLabel.text = String(targetValue)
    scoreLabel.text = String(scoreValue)
    roundLabel.text = String(roundValue)
  }
  
  func startNewRound() {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
    
    roundValue += 1
    
    updateLabels()
  }
  
  func startNewGame() {
    roundValue = 0
    scoreValue = 0
    startNewRound()
    
    let transition = CATransition()
    transition.type = CATransitionType.fade
    transition.duration = 1
    transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    view.layer.add(transition, forKey: nil)
  }
  
  @IBAction func showAlert() {
    
    let difference = abs(currentValue - targetValue)
    
    var points = 100 - difference
    
    scoreValue += points
    
    let title: String
    
    if difference == 0 {
      title = "Perfect"
      points += 100
    } else if difference < 5 {
      title = "You almost had it"
      points += 50
    } else if difference < 10 {
      title = "Pretty good"
    } else {
      title = "Not even close"
    }
    
    let message = "You scored \(points) points"
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
      self.startNewRound()
    })
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  @IBAction func startOver(_ sender: UIButton) {
    startNewGame()
  }
}

