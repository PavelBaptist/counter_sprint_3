//
//  ViewController.swift
//  counter
//
//  Created by Павел Глазачев on 26.07.2023.
//

import UIKit

enum EventCounter{
    case plus
    case minus
    case reset
}

class ViewController: UIViewController {
    
    private var counter: Int = 0;
    
    @IBOutlet weak var minusUIButton: UIButton!
    @IBOutlet weak var plusUIButton: UIButton!
    @IBOutlet weak var resetUIButton: UIButton!
    @IBOutlet weak var infoUIButton: UIButton!
    @IBOutlet weak var counterUILabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlusDidTap(_ sender: Any) {
        updateCounter(EventCounter.plus)
    }
    
    @IBAction func btnMinusDidTap(_ sender: Any) {
        updateCounter(EventCounter.minus)
    }
    
    @IBAction func btnResetDidTap(_ sender: Any) {
        updateCounter(EventCounter.reset)
    }
    
    @IBAction func btnInfoDidTap(_ sender: Any) {
    }
    
    private func updateCounter(_ eventCounter: EventCounter){
        
        switch eventCounter {
        case .plus:
            self.counter += 1
        case .minus:
            self.counter -= 1
        case .reset:
            self.counter = 0
        }
        
        if self.counter < 0 {
            self.counter = 0;
        }
        
        counterUILabel.text = String(self.counter)
    }
    
}

