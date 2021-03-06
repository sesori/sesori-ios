//
//  NewsCustomView.swift
//  sesori
//
//  Created by 이정우 on 2021/11/16.
//

import UIKit

class NewsCustomView: UIView {
    @IBOutlet weak var customView : UIView!
    @IBOutlet weak var cornerView : UIView!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
    
    private func commonInit(){
        let bundle = Bundle(for: NewsCustomView.self)
        bundle.loadNibNamed("NewsCustomView", owner: self, options: nil)
        addSubview(customView)
        customView.frame = self.bounds
        customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        customView.layer.cornerRadius = 20
        customView.layer.masksToBounds = false
        customView.layer.shadowOpacity = 0.2
        customView.layer.shadowRadius = 8
        
        cornerView.layer.cornerRadius = cornerView.frame.size.width / 2
        cornerView.layer.masksToBounds = true
        
        
    }
    
}


