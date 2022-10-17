//
//  FooterView.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-15.
//

import Foundation
import UIKit

class FooterView: UIView {
    
    //MARK: - PROPERTIES
    //outlets
    @IBOutlet var contentView: FooterView!
    @IBOutlet weak var bottomView: UIView!
    
    //variables
    
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
        bottomView.addLayerEffects(with: UIColor(named: "boaderClr"), borderWidth: 1, cornerRadius: 30)
    }
    
    
    private func commonInit() {
        let bundle = Bundle(for: FooterView.self)
        bundle.loadNibNamed("FooterView", owner: self)
        contentView.fixInView(self)
    }
    
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 168)
    }
    
}
