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
  
  
  //Variables
  var currentValue: Int = 0
  var targetValue: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    startNewRound()
  }
  
  func startNewRound() {
    targetValue = Int.random(in: 1...100)
    currentValue = 50
    slider.value = Float(currentValue)
  }
  
  @IBAction func showAlert() {
    let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"
    
    let alert = UIAlertController(title: "Hello World", message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
    startNewRound()
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    currentValue = lroundf(slider.value)
  }
  
  
}

