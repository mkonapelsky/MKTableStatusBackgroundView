//
//  MKTableStatusBackgroundView.swift
//  GameDB PS4
//
//  Created by Michael Konapelsky on 7/24/18.
//  Copyright © 2018 Lehigh Interactive LLC. All rights reserved.
//

import UIKit

protocol MKTableStatusBackgroundDelegate {
    func didTapRetry()
}

class MKTableStatusBackgroundView: UIView {

    var delegate: MKTableStatusBackgroundDelegate?
    
    init(withMessage message: String, frame: CGRect, delegate: MKTableStatusBackgroundDelegate) {
        
        super.init(frame: frame)
        
        self.delegate = delegate
        
        // Create status label
        let statusLabel = UILabel(frame: CGRect(x: 0, y: self.center.y - 50, width: frame.size.width, height: 44))
        statusLabel.textAlignment = .center
        statusLabel.textColor = UIColor.darkGray
        statusLabel.text = message
        self.addSubview(statusLabel)
        
        // Create retry / refresh button
        let button = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: self.frame.size.width / 2,
                                            height: 44))
        
        button.center = CGPoint(x: self.center.x, y: self.center.y + 30)
        button.backgroundColor = UIColor.lightGray
        button.setTitle("Reload", for: .normal)
        button.setTitleColor(UIColor.darkGray, for: .normal)
        button.setTitleColor(UIColor.gray, for: .highlighted)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
        
        self.addSubview(button)
    }
    
    @objc private func retryButtonTapped() {
        self.delegate?.didTapRetry()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
