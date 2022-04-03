//
//  AnimationModel.swift
//  SpringApp
//
//  Created by Nikolay Trofimov on 03.04.2022.
//

import Foundation

struct AnimationModel {
    let animation: String
    let curve: String
    let force: Double
    let duration: Double
    let repeatCount: Int
}
    
extension AnimationModel {
    
    static func getRandomAnimation() -> [AnimationModel] {
        var animations: [AnimationModel] = []
        
        let animationTypes = [
            "shake",
            "pop",
            "morph",
            "squeeze",
            "wobble",
            "swing",
            "flipX",
            "flipY",
            "fall"
        ].shuffled()
        
        let curveType = [
            "spring",
            "linear",
            "easeIn",
            "easeOut",
            "easeInOut"
        ].shuffled()
        
        for animationType in animationTypes {
            let animation = AnimationModel(
                animation: animationType,
                curve: curveType[Int.random(in: 0..<curveType.count)],
                force: round(10 * Double.random(in: 0.8...2.0)) / 10,
                duration: round(10 * Double.random(in: 0.8...2.0)) / 10,
                repeatCount: Int.random(in: 1...3)
            )
            animations.append(animation)
        }
        
        return animations
    }
    
}
