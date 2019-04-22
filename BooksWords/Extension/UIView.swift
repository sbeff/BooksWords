//
//  UIView.swift
//  BooksWords
//
//  Created by Emanuele Beffa on 22/04/2019.
//  Copyright © 2019 Emanuele Beffa. All rights reserved.
//

import UIKit

extension UIView {
    func applyBlur() {
        let blurEffect: UIBlurEffect = UIBlurEffect(style: .light)
        let blurEffectView: UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.isUserInteractionEnabled = false
        insertSubview(blurEffectView, at: 0)
    }
}
