//
//  DVRViewController.swift
//  riveracrumc-assignment4
//
//  Created by Chadwick on 2/13/21.
//

import UIKit

class DVRViewController: UIViewController {
    
    //tags: play-0 stop-1 pause-2 FF-3 FR-4 record-5
    
    @IBOutlet weak var powerDVRLabel: UILabel!
    
    let actionCol = [
         "Playing",
         "Stopped",
         "Pause",
        "Fast Forward",
        "Fast Rewind",
        "Record"
    ]
    
    
    enum actions  {
        case Play
        case Stop
        case Pause
        case FastForward
        case FastRewind
        case Record
        func name() -> String {
            switch self {
            case .Play:
                return "Playing"
            case .Stop:
                return "Stopped"
            case .Pause:
                return "Pause"
            case .FastForward:
                return "Fast Forward"
            case .FastRewind:
                return "Fast Rewind"
            case .Record:
                return "Record"
            }
        }
        
    }
    
   
    @IBOutlet var actionCollection: [UIButton]!
    
    @IBOutlet weak var powerDVRSwitch: UISwitch!
    
    @IBOutlet weak var stateLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func toTVButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func stateChange(_ sender: UIButton) {
        let button = sender.tag;
        let action = actionCol[button];
        let playActions = [0, 1, 2, 3, 4]
        let recordActions = [1, 5]
        let stopActions = [0, 1, 5]
        if let current = stateLabel.text{
            if current != "Stopped" && current != "Record" && playActions.contains(button) {
                stateLabel.text = action;
            }
            else if current == "Stopped" && stopActions.contains(button){
                stateLabel.text = action;
            }
            else if current == "Record" && recordActions.contains(button){
                stateLabel.text = action;
            }
            else if button == 1 {
                stateLabel.text = action;
            }
            else {
                let actAnyway = UIAlertAction(title: "Complete Action", style: .default){
                    Void in
                    self.stateLabel.text = action;
                    let alertAfter = UIAlertController(title: "Completed Action", message: "State is now \(action)", preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "OK",
                    style: .cancel, handler: nil)
                    alertAfter.addAction(cancelAction)
                    self.present(alertAfter, animated: true, completion: nil)
                    
                }
                let cancelAct = UIAlertAction(title: "Cancel Action", style: .cancel)
                
                let alert = UIAlertController(title: "Conflicting Action", message: "Select whether you would like cancel or complete action anyway", preferredStyle: .alert)
                alert.addAction(actAnyway)
                alert.addAction(cancelAct)
                
                present(alert, animated: true, completion: nil)
                
                
            }
            
            
        }
    
    }
    
    @IBAction func controlsEnabled(_ sender: UISwitch) {
        let enabled : Bool = sender.isOn;
        
        for control in actionCollection {
            control.isEnabled = enabled
        }
        let act : actions = .Stop
        if (!enabled){
            powerDVRLabel.text = "Off";
            stateLabel.text = act.name()
        } else {
            powerDVRLabel.text = "On";
            stateLabel.text = act.name()
        }
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
