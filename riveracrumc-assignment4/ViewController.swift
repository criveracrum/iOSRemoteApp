//
//  ViewController.swift
//  riveracrumc-assignment4
//
//  Created by Chadwick on 1/30/21.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var powerSwitch: UISwitch!
    @IBOutlet weak var powerLabel: UILabel!
    
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var one: UIButton!
    @IBOutlet weak var two: UIButton!
    @IBOutlet weak var three: UIButton!
    @IBOutlet weak var four: UIButton!
    @IBOutlet weak var five: UIButton!
    @IBOutlet weak var six: UIButton!
    @IBOutlet weak var seven: UIButton!
    @IBOutlet weak var eight: UIButton!
    @IBOutlet weak var nine: UIButton!
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var volumeLabel: UILabel!
    
    @IBOutlet weak var favoriteSelect: UISegmentedControl!
    
    @IBOutlet weak var channelUp: UIButton!
    @IBOutlet weak var channelDown: UIButton!
    @IBOutlet weak var channelLabel: UILabel!
    var channel : String = "";
    
    
    @IBOutlet weak var Controls: UIView!
    
    @IBAction func numberInput(_ sender: UIButton) {
        if let number = sender.currentTitle{
            channel += number;
            if (channel.count==2){
                /*converting channel to int and back string
                truncates the 0 in the first index */
                let num : Int = Int(channel)!
                channelLabel.text = String(num);
                channel = ""; //clear channel to await next input
                image.image = UIImage(named: "static");
            }
        }
    }
    @IBAction func incrementChannel(_ sender: UIButton) {
        if let currentChannel = channelLabel.text{
            var num = Int(currentChannel)! ;
            if (num >= 99){
                num = 1;
            }
            else {
             num +=  1;
            }
        channelLabel.text = String(num);
        }
    }
    @IBAction func decrementChannel(_ sender: UIButton) {
        if let currentChannel = channelLabel.text{
            var num = Int(currentChannel)! ;
            if (num <= 1){
                num = 99;
            }
            else {
             num -=  1;
            }
        channelLabel.text = String(num);
        }
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
                volumeLabel.text = String(Int(sender.value));
       
    }
    
    @IBAction func favoriteSelect(_ sender: UISegmentedControl) {
        
        let index = sender.selectedSegmentIndex;
        
        switch index {
        case 0 :
            channelLabel.text = "7";
            image.image = UIImage(named: "ABC");
        case 1 :
            channelLabel.text = "9";
            image.image = UIImage(named: "NBC");
        case 2 :
            channelLabel.text = "11";
            image.image = UIImage(named: "TBS");
        case 3 :
            channelLabel.text = "42";
            image.image = UIImage(named: "TLC")
        default : channelLabel.text = "0";
        }
    }
    
    
    @IBAction func controlsEnabled(_ sender: UISwitch) {
        let enabled : Bool = sender.isOn;
        
        
        slider.isEnabled = enabled;
        favoriteSelect.isEnabled = enabled;
        zero.isEnabled = enabled;
        channelUp.isEnabled = enabled;
        channelDown.isEnabled = enabled;
        zero.isEnabled = enabled;
        one.isEnabled = enabled;
        two.isEnabled = enabled;
        three.isEnabled = enabled;
        four.isEnabled = enabled;
        five.isEnabled = enabled;
        six.isEnabled = enabled;
        seven.isEnabled = enabled;
        eight.isEnabled = enabled;
        nine.isEnabled = enabled;
        
        if (!enabled){
            powerLabel.text = "Off";
            image.image = UIImage(named: "off");
        
        } else {
            powerLabel.text = "On";
            image.image = UIImage(named: "static");
        }
        
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
    
    
}

