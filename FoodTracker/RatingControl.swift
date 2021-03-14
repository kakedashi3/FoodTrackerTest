//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 立岡力 on 2021/03/12.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK: properties
    
    private var ratingButtons = [UIButton]()
    var rating = 0

    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        
        didSet {
            setupButtons()
        }
        
    }
    
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
        
    }
    
    
    
    
    
    
    
    
    
    //MARK: Initialization　イニシャライザ上書き
    //初期化スケルトン
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder){
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Button Action
    
    @objc func ratingButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    
    
    //MARK: Private Methods
    private func setupButtons() {
        
    
        // clear any existing buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of; self))
        let filledstar = UIImage(name: "filledStar", in: bundle, compatibleWith: self.traitCollection )
        
        
        
        
        
        
        
        
        
        
        for _ in 0..<starCount {
        
            // Create the button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Add constaraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the rating button array
            ratingButtons.append(button)
        
        }
        
    }
    
    
}
