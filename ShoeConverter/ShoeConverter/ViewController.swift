//
//  ViewController.swift
//  ShoeConverter
//
//  Created by Stephane Liu on 9/17/14.
//  Copyright (c) 2014 Simplified Technologies, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var menShoeSizeTextField: UITextField!
  @IBOutlet weak var convertedLabel: UILabel!
  
  @IBOutlet weak var womenShoeSizeTextField: UITextField!
  @IBOutlet weak var convertedWomanLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  @IBAction func convertButtonPressed(sender: UIButton) {
    let integerFromTextField  = menShoeSizeTextField.text.toInt()!
    
    menShoeSizeTextField.text = ""
    convertedLabel.text       = "\(integerFromTextField + 30) in Euopean Shoe Size"
    convertedLabel.hidden     = false
  }
  
  @IBAction func convertWomanButtonPressed(sender: UIButton) {
    let doubleFromTextField = Double((womenShoeSizeTextField.text as NSString).doubleValue)
    let conversionConstant = 30.5
    
    womenShoeSizeTextField.text = ""
    convertedWomanLabel.text    = "\(doubleFromTextField + conversionConstant) in European Shoe Size"
    convertedWomanLabel.hidden  = false
  }
}

