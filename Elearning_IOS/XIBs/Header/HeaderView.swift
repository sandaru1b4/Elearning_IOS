//
//  HeaderView.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-15.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    //MARK: - PROPERTIES
    //outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var reducedPriceLbl: UILabel!
    @IBOutlet weak var starIcon: UIImageView!
    
    //variables
    var reducedPrice = "$75"
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        reducedPriceLbl.attributedText = reducedPrice.strikeThrough()
        starIcon.tintColor = UIColor(named: "starClr")
    }
    
    
    private func commonInit() {
        let bundle = Bundle(for: HeaderView.self)
        bundle.loadNibNamed("HeaderView", owner: self)
        contentView.fixInView(self)
    }
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
    
}
