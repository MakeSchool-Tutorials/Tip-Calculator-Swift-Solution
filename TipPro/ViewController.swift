//
//  ViewController.swift
//  TipPro
//
//  Created by Jason Katzer on 5/21/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var billAmountField: UITextField!
  @IBOutlet weak var tipSelector: UISegmentedControl!
  @IBOutlet weak var tipAmountField: UITextField!
  @IBOutlet weak var totalAmountField: UITextField!

  @IBAction func updateTip(sender: AnyObject) {
    guard Double(billAmountField.text!) != nil else {
      //show error
      tipAmountField.text = ""
      totalAmountField.text = ""
      return
    }

    var tipPercentage = 0.0

    switch tipSelector.selectedSegmentIndex {
    case 0:
      tipPercentage = 0.15
    case 1:
      tipPercentage = 0.18
    case 2:
      tipPercentage = 0.20
    default:
      break
    }

    let billAmount = Double(billAmountField.text!)!
    let roundedBillAmount = round(100*billAmount)/100
    let tipAmount = roundedBillAmount * tipPercentage
    let roundedTipAmount = round(100*tipAmount)/100
    let totalAmount = roundedBillAmount + roundedTipAmount


    if (!billAmountField.editing) {
      billAmountField.text = String(format: "%.2f", roundedBillAmount)
    }
    tipAmountField.text = String(format: "%.2f", roundedTipAmount)
    totalAmountField.text = String(format: "%.2f", totalAmount)


  }

  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

