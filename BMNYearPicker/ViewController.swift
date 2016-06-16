//
//  ViewController.swift
//  BMNYearPicker
//
//  Created by Harry on 6/16/16.
//  Copyright © 2016 Harry. All rights reserved.
//

import UIKit

class ViewController: UIViewController, BMNYearPickerViewDelegate  {

    @IBOutlet weak var lblPickerValue: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnOpenPickerClicked(sender: AnyObject) {
        let picker : BMNYearPicker = BMNYearPicker()
        picker.startYear = 2000
        picker.endYear = 2016
        picker.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        picker.delegate = self
        self.presentViewController(picker, animated: true, completion: nil)
    }
    
    //MARK: - PICKER DELEGATE
    
    func pickerCancel() {
        
    }
    
    func pickerDone(year: String) {
        self.lblPickerValue.text = "\(year)"
    }

}

