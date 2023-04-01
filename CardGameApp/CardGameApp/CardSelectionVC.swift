//
//  CardSelectionVC.swift
//  CardGameApp
//
//  Created by Umut Ağbaba on 1.04.2023.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var rulesBtn: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = Card.allValues
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        for button in buttons {
            button.layer.cornerRadius = 14.0
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImage.image = cards.randomElement()
    }

    @IBAction func stopBtnTapped(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func restartBtnTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
}

