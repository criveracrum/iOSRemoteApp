//
//  ModelConfiguration.swift
//  riveracrumc-assignment4
//
//  Created by Chadwick on 2/19/21.
//

import UIKit

class Favorite {
    
    var label : String = "Preset";
    var channel : Int = 0;
    
    init(){}
    
    init(label: String, channel: Int){
        self.label = label;
        self.channel = channel;
    }
    
}
