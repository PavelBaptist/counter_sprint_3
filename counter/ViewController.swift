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
    
    // Создание переменных
    private var counter: Int = 0;
    private var log: String = "";
    private var infoMode: Bool = false;
    
    @IBOutlet weak var minusUIButton: UIButton!
    @IBOutlet weak var plusUIButton: UIButton!
    @IBOutlet weak var resetUIButton: UIButton!
    @IBOutlet weak var infoUIButton: UIButton!
    @IBOutlet weak var counterUILabel: UILabel!
    @IBOutlet weak var logUITextView: UITextView!
    
    // События
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshViewLog()
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
        infoMode.toggle()
        refreshViewLog()
    }
    
    // Обработка счетчика
    private func updateCounter(_ eventCounter: EventCounter){
        
        switch eventCounter {
        case .plus:
            counter += 1
            addNewString("значение изменено на +1")
        case .minus:
            counter -= 1
            addNewString("значение изменено на -1")
        case .reset:
            counter = 0
            addNewString("значение сброшено")
        }
        
        if counter < 0 {
            counter = 0
            addNewString("попытка уменьшить значение счётчика ниже 0")
        }
        
        counterUILabel.text = String(counter)
        
    }
    
    // Обработка лога
    private func addNewString(_ text: String){
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        let date: String = dateFormatter.string(from: Date())
        
        log = "[\(date)]: \(text)\n" + log
        
        logUITextView.text = log
    }
    
    private func refreshViewLog(){
        if infoMode {
            logUITextView.isHidden = false
            plusUIButton.frame.size.height = 198;
            minusUIButton.frame.size.height = 198;
            infoUIButton.setTitle("Скрыть техническую информацию", for: .normal)
        } else {
            logUITextView.isHidden = true
            plusUIButton.frame.size.height = 464;
            minusUIButton.frame.size.height = 464;
            infoUIButton.setTitle("Показать техническую информацию", for: .normal)
        }
    }
}

