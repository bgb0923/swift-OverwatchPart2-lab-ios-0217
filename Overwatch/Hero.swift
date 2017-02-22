//
//  Hero.swift
//  Overwatch
//
//  Created by William Brancato on 2/22/17.
//  Copyright © 2017 Gamesmith, LLC. All rights reserved.
//

import Foundation
import UIKit

struct Hero: OverwatchHero {
   
    var name: HeroName
    var hitPoints: Health = 0
    var heroType: HeroType { return produceHeroType() }
    var image: UIImage { return self.produceButtonImage() }
    var profileImage: UIImage { return self.produceProfileImage() }
    
    init(name: HeroName) {
        self.name = name
        self.hitPoints = self.produceInitialHitPoints()
    }
    
    func produceButtonImage() -> UIImage {
        switch name {
        case .lúcio: return #imageLiteral(resourceName: "Lúcio")
        case .torbjörn: return #imageLiteral(resourceName: "Torbjörn")
        default: return UIImage(named: "\(self.name)")!
        }
    }
    
    func produceProfileImage() -> UIImage {
        switch name {
        case .lúcio: return #imageLiteral(resourceName: "LucioProfile")
        case .torbjörn: return #imageLiteral(resourceName: "TorbjornProfile")
        default: return UIImage(named: "\(self.name)Profile")!
        }
    }
}
