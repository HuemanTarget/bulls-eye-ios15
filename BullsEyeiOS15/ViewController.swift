//
//  ViewController.swift
//  BullsEyeiOS15
//
//  Created by Joshua Basche on 8/19/21.
//

import UIKit

class ViewController: UIViewController {
  
  //Variables
  var currentValue: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func showAlert() {
    
    let alert = UIAlertController(title: "Hello World", message: "This is my first app!", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
    
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    print("The value of the slider is now \(slider.value)")
  }
  
  
}

