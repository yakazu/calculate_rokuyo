//
//  ViewController.swift
//  CalcRokuyo
//
//  Created by yakazu on 2021/03/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var calendar: UIDatePicker!
    @IBOutlet weak var kyureki: UILabel!
    @IBOutlet weak var rokuyo: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    @IBAction func tappedCalc(_ sender: Any) {
        rokuyo.text = calculateRokuyo(date: calendar.date)
    }

    private func calculateRokuyo(date: Date) -> String {
        let chineseCalendar = Calendar(identifier: .chinese)
        let dateComponents = chineseCalendar.dateComponents([.year, .month, .day], from: calendar.date)
        kyureki.text = dateComponents.debugDescription

        if let month = dateComponents.month, let day = dateComponents.day {
            let result = (month + day) % 6
            switch result {
            case 0:
                return "大安"
            case 1:
                return "赤口"
            case 2:
                return "先勝"
            case 3:
                return "友引"
            case 4:
                return "先負"
            case 5:
                return "仏滅"
            default:
                break
            }
        }
        return ""
    }
}

