//
//  SubjectCollectionViewCell.swift
//  FinalProject
//
//  Created by Bishant Tripathi on 4/18/22.
//

import UIKit

class SubjectCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var subjectImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    func setup(with subject: Subject){
        subjectImageView.image = subject.image
        titleLabel.text = subject.title
    }
    
    var cornerRadius: CGFloat = 50

        override func awakeFromNib() {
            super.awakeFromNib()
                
            // Apply rounded corners to contentView
            
            // Set masks to bounds to false to avoid the shadow
            // from being clipped to the corner radius
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = false
            
            // Apply a shadow
            layer.shadowRadius = 8.0
            layer.shadowOpacity = 0.10
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 5)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            
            // Improve scrolling performance with an explicit shadowPath
            layer.shadowPath = UIBezierPath(
                roundedRect: bounds,
                cornerRadius: cornerRadius
            ).cgPath
        }
    
}

