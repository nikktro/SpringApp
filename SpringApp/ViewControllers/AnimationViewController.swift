//
//  AnimationViewController.swift
//  SpringApp
//
//  Created by Nikolay Trofimov on 03.04.2022.
//

import Spring

class AnimationViewController: UIViewController {
    
    @IBOutlet var animationView: SpringView!
    @IBOutlet var animationLabel: UILabel!
    
    let animations = AnimationModel.getRandomAnimation()
    var buttonPressedCount = 0
    
    private func description(animation: AnimationModel) -> String {
        let description =
            "animation: \(animation.animation) \n" +
            "curve: \(animation.curve) \n" +
            "force: \(animation.force) \n" +
            "duration: \(animation.duration) \n" +
            "repeatCount: \(animation.repeatCount)"
        
        return description
    }
    
    private func buttonPressCheck() {
        if buttonPressedCount >= animations.count - 1 {
            buttonPressedCount = 0
        } else {
            buttonPressedCount += 1
        }
    }
    
    @IBAction func animationButtonPressed(_ sender: UIButton) {
        
        let currentAnimation = animations[buttonPressedCount]
        buttonPressCheck()
        let nextAnimation = animations[buttonPressedCount]
        
        animationView.animation = currentAnimation.animation
        animationView.curve = currentAnimation.curve
        animationView.force = currentAnimation.force
        animationView.duration = currentAnimation.duration
        animationView.repeatCount = Float(currentAnimation.repeatCount)
        animationView.animate()
        
        animationLabel.text = description(animation: currentAnimation)
        sender.setTitle("Next \(nextAnimation.animation)", for: .normal)
        
    }
    
}

