//
//  ViewController.swift
//  calculator
//
//  Created by Sergio de Almeida Brunacci on 2017-09-23.
//  Copyright © 2017 Sergio de Almeida Brunacci. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* Variables ----------------------------- */
 
    var numberShowScreen:Double = 0;
    var prevNumber:Double = 0;
    var actMath = false;
    var operation = 0;
    var result:Double = 0;
    
    /* Outlets ------------------------------ */
    
    @IBOutlet weak var display: UILabel!
    
    /* Actions and Methods ------------------ */
   
    @IBAction func numbers(_ sender: UIButton) {
        if actMath == true{
            display.text = String(sender.tag)
            numberShowScreen = Double(display.text!)!
            actMath = false
        }else{
            if display.text == "0" {
                display.text = String(sender.tag)
                numberShowScreen = Double(display.text!)!
            }else{
                display.text = display.text! + String(sender.tag-1)
                numberShowScreen = Double(display.text!)!
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btnOperation(_ sender: UIButton) {
        if display.text != "" && sender.tag != 11 && sender.tag != 16{
                prevNumber = Double(display.text!)!
                print(prevNumber)
                operation = sender.tag
                actMath = true;
        }
        else if sender.tag == 16{
            // Divide
            if operation == 12{
                result = prevNumber / numberShowScreen
                display.text = String (result)
            }
            // Multiply
            else if operation == 13{
                result = prevNumber * numberShowScreen
                display.text = String (result)
            }
            // Minus
            else if operation == 14{
                result = prevNumber - numberShowScreen
                display.text = String (result)
            }
            // Plus
            else if operation == 15{
                result = prevNumber + numberShowScreen
                display.text = String (result)
            }
        }
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        operation = 0;
        display.text = "0"
        numberShowScreen = 0;
        prevNumber = 0;
    }
    
    /* INHERITED METHODS -------------------------- */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}

