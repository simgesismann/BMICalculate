//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func weightSlider(_ sender: UISlider) {
        weightLabel.text = ("\(String((Int(sender.value)))) kg")
    }
    
    @IBAction func heightSlider(_ sender: UISlider) {
        heightLabel.text = ("\(String(format: "%.2f", sender.value)) m")
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let h = heightSlider.value
        let w = weightSlider.value
        calculatorBrain.BMICalculate(weight:w, height:h)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
            print(destinationVC.bmi)
        }
    }
}

