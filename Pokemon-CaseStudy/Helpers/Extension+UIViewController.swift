//
//  Extension+UIViewController.swift
//  Pokemon-CaseStudy
//
//  Created by Hasan Dag on 3.11.2022.
//

import UIKit

extension UIViewController {
    func showToast(message : String, backGroundColor: UIColor) {
        let toastLabel = UILabel()
        toastLabel.backgroundColor = .clear
        toastLabel.textColor = UIColor(named: "textColor")
        toastLabel.font = UIFont.boldSystemFont(ofSize: 18)
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 0.5
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        toastLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(UIView.HEIGHT * 0.3)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(32)
        }
        UIView.animate(withDuration: 2.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
