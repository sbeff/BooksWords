//
//  BorderedButton.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 20/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

final class BorderedButton: UIButton {
    
    // MARK: - UIView lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .white
        layer.cornerRadius = 8.0
        clipsToBounds = true
        
        contentEdgeInsets = UIEdgeInsets(top: 16.0, left: 16.0, bottom: 16.0, right: 16.0)
        
        backgroundColor = .clear
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .light)
        let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        setTitleColor(.white, for: .normal)
        insertSubview(blurEffectView, at: 0)
    }
}
