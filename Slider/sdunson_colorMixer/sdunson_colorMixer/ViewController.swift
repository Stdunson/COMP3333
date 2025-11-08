//
//  ViewController.swift
//  sdunson_colorMixer
//
//  Created by Shavaughn Dunson on 11/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var rSwitch: UISwitch!
    @IBOutlet weak var gSwitch: UISwitch!
    @IBOutlet weak var bSwitch: UISwitch!
    
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var gSlider: UISlider!
    @IBOutlet weak var bSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorView.layer.borderWidth = 5
        colorView.layer.cornerRadius = 20
        reset(self)
    }

    func updateColor(){
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        
        if rSwitch.isOn{
            red = CGFloat(rSlider.value)
        }
        if gSwitch.isOn{
            green = CGFloat(gSlider.value)
        }
        if bSwitch.isOn{
            blue = CGFloat(bSlider.value)
        }
        
        colorView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        
    }
    
    func updateControls(){
        //enable/disable sliders
        rSlider.isEnabled = rSwitch.isOn
        gSlider.isEnabled = gSwitch.isOn
        bSlider.isEnabled = bSwitch.isOn
    }
    
    @IBAction func switchChange(_ sender: Any) {
        updateColor()
        updateControls()
    }
    
    @IBAction func sliderChange(_ sender: Any) {
        updateColor()
    }
    
    @IBAction func reset(_ sender: Any) {
        rSlider.value = 0
        gSlider.value = 0
        bSlider.value = 0
        rSwitch.isOn = true
        gSwitch.isOn = true
        bSwitch.isOn = true
        updateColor()
        updateControls()
    }
    
}

