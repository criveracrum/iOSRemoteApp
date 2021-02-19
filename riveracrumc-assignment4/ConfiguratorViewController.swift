//
//  ConfiguratorViewController.swift
//  riveracrumc-assignment4
//
//  Created by Chadwick on 2/19/21.
//

import UIKit

class ConfiguratorViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var segButtons: UISegmentedControl!
    
    @IBOutlet weak var previewSeg: UISegmentedControl!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    var temp : String = "";
    
    @IBOutlet weak var channelLabel: UILabel!
    
    @IBAction func labelText(_ sender: UITextField) {
        sender.resignFirstResponder();
        
        if let text = sender.text {
            if (4 >= text.count && text.count > 0){
                temp = text
                
            }
            else {
                print("Accessing")
                let problem = (text.count > 4) ? "long" : "short";
                let def = UIAlertAction(title: "Ok", style: .default)
               
                let labelProblem = UIAlertController(title: "Favorite Label Problem", message: "Your entered label is too \(problem). Please change and try again", preferredStyle: .alert)
                labelProblem.addAction(def)
                present(labelProblem, animated: true, completion: nil)
            }
            
        }
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        let value : String = "\(Int(sender.value))"
        channelLabel.text = value;
        
    }
    
   
    
    @IBAction func saved(_ sender: UIButton) {
        
        let num = segButtons.selectedSegmentIndex
        let temp1 : Favorite = favs[num]
       
        temp1.label =  temp;
        if let channel = channelLabel.text{
            temp1.channel = Int(channel)!;
            
        }
        
        
       
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
