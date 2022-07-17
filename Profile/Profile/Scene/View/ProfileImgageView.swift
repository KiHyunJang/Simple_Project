//
//  ProfileImgageView.swift
//  Profile
//
//  Created by kakao on 2022/07/16.
//

import UIKit

class RoundImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2.0
    }
}

class RoundView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.clipsToBounds = true
        self.layer.cornerRadius = self.bounds.height / 2.0
    }
}

class ProfileImgageView: RoundView {
    
}
