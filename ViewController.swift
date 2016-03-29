//
//  ViewController.swift
//  Flip Views
//
//  Created by mitchell hudson on 3/28/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cardView: UIView!
    var frontImage: UIImageView!
    var backImage: UIImageView!
    var backVisible = true
    
    
    @IBAction func buttonTapped(sender: UIButton) {
        if backVisible {
            UIView.transitionFromView(backImage, toView: frontImage, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromRight, completion: nil)
        } else {
            UIView.transitionFromView(frontImage, toView: backImage, duration: 1, options: UIViewAnimationOptions.TransitionFlipFromLeft, completion: nil)
        }
        
        backVisible = !backVisible
    }
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let rect = CGRect(x: 40, y: 40, width: 288, height: 384)
        cardView = UIView(frame: rect)
        frontImage = UIImageView(image: UIImage(named: "front.jpg"))
        backImage = UIImageView(image: UIImage(named: "back.jpg"))
        
        cardView.addSubview(backImage)
        view.addSubview(cardView)
        
        print(backImage.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

