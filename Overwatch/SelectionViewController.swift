//
//  SelectionViewController.swift
//  Overwatch
//
//  Created by William Brancato on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation
import UIKit

class SelectionViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var characterStackView: UIStackView!
    @IBOutlet weak var characterStackViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroScrollView: UIScrollView!
    
    var game = Game()
    var heroType: HeroType! {
        didSet {
            self.game.heroType = self.heroType
            self.updateStackViewWithHeroes()
        }
    }    
    
    @IBAction func changeInHeroType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: self.heroType = .offense
        case 1: self.heroType = .defense
        case 2: self.heroType = .tank
        case 3: self.heroType = .support
        default: print("Something went really fuckin wrong")
        }
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.heroType = .offense

    }
    
    override func viewDidLoad() {
        self.heroScrollView.delegate = self
    }
    
    func updateStackViewWithHeroes() {
        for subview in self.characterStackView.subviews {
            subview.removeFromSuperview()
        }
        for number in 0..<self.game.heroes.count {
            let imageView = UIImageView(image: self.game.heroes[number].produceProfileImage())
            imageView.contentMode = .scaleAspectFit
            self.characterStackView.addArrangedSubview(imageView)
//            self.characterStackViewWidthConstraint.constant += imageView.frame.width
        }
        
        self.heroNameLabel.text = self.game.heroes[0].name.description
    }
    
}
