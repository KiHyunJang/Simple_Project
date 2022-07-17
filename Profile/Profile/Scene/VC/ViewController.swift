//
//  ViewController.swift
//  Profile
//
//  Created by kakao on 2022/07/16.
//

import UIKit

class ViewController: UIViewController {

    let view1 : UIView = {
        var view1 = UIView()
        view1.frame.size = CGSize(width: 150, height: 150)
        view1.clipsToBounds = true
        view1.layer.cornerRadius = 25
        return view1
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.view1)

        view1.translatesAutoresizingMaskIntoConstraints = false

        view1.center = CGPoint(x: self.view.frame.size.width  / 2,
                               y: self.view.frame.size.height / 2)

        self.view1.setGradient()
        CGRect(origin: CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>), size: <#T##CGSize#>)
    }

}

extension UIView{
    func setGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor, UIColor.systemPink.cgColor]
        gradientLayer.type = .conic
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
        layer.cornerRadius = self.bounds.height / 2.0
    }
    
    
}

