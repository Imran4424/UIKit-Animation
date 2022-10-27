//
//  ViewController.swift
//  Animation
//
//  Created by Shah Md Imran Hossain on 27/10/22.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func loadView() {
        super.loadView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // screen size of current device
        let screenSize: CGRect = UIScreen.main.bounds
        
        imageView = UIImageView(image: UIImage(named: "penguin"))
//        imageView.center = CGPoint(x: 512, y: 384)
        imageView.center = CGPoint(x: screenSize.width / 2, y: screenSize.height / 2)
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: UIButton) {
        sender.isHidden = true
        currentAnimation += 1
        
//        UIView.animate(withDuration: 1, delay: 0, options: []) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: []) {
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            case 1:
                self.imageView.transform = .identity
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256)
            case 3:
                self.imageView.transform = .identity
            case 4:
                self.imageView.transform = CGAffineTransform(rotationAngle: .pi)
            case 5:
                self.imageView.transform = .identity
            case 6:
                self.imageView.alpha = 0.1
                self.imageView.backgroundColor = .green
            case 7:
                self.imageView.alpha = 1
                self.imageView.backgroundColor = .clear
            default:
                break
            }
        } completion: { _ in
            sender.isHidden = false
        }

        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
}

