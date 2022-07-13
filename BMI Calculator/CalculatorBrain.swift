//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Simge ŞİŞMAN on 4.07.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//
// bu sayfa hesaplama sayfası calculatorBrain diye structure oluşturuyoruz.
// BMI Calculate yaparak bmi değerini hesaplayıp , bu değere göre arka plan rengi ve öneri alıyoruz
// BMI Calculate fonksiyonunda hesaplanan değerleri almak için get methodunu çağırıyoruz
// getBMIValue ile bmi değeri çağırılır
// getAdvice ve getColour methodu ile if elseden çıkan değerler alınır
import Foundation
import UIKit

struct CalculatorBrain{
    
    //var bmiValue = "0.0" // general bmi value is defined
    var bmi : BMI?
    mutating func BMICalculate (weight: Float,height:Float){
        let bmiValue = weight / (height*height)
        
        if bmiValue < 18.5 {
            bmi = BMI(bmiValue: bmiValue, colour: #colorLiteral(red: 0.2000000238, green: 0.1000000238, blue: 0.8000000238, alpha: 1), advice: "EAT MORE MANTI")
        }else if bmiValue < 24.9 {
            bmi = BMI(bmiValue: bmiValue, colour: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), advice: "Fit as fiddle")
        }else{
            bmi = BMI(bmiValue: bmiValue, colour: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), advice: "Eat less Mantı")
            }
        // I change value mutating
    }
    
    func getBMIValue()->String{
        let getBmi = String(format: "%.1f", bmi?.bmiValue ?? 0.00) // default nil coalescing
        return (getBmi)
    }
    
    func getAdvice()->String{
        return bmi?.advice ?? "No advice"  // eğer değer gelmiyorsa default değer verdik
     }
    
    func getColor() -> UIColor {
        return bmi?.colour ?? #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
}
