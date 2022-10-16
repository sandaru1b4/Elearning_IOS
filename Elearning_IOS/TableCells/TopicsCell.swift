//
//  TopicsCell.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-16.
//

import UIKit

class TopicsCell: UITableViewCell {
    
    //MARK: - PROPERTIES
    //outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var lessonNumLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var btnImg: UIImageView!
    
    //variables
    var isUnlocked: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkStatus()
        containerView.addShadowWithRoundCornersHeightOffset(offSet: 0, radious: 16,shadowRadious: 15, shadowOpacity: 0.3)
        
    }
    
    
    //check lesson status
    func checkStatus() {
        if isUnlocked {
            btnImg.image = UIImage(named: "ic_play")
        }else{
            btnImg.image = UIImage(named: "ic_lock")
        }
    }
    
}
