//
//  ViewController.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-15.
//

import UIKit
import AVFoundation
import AVKit

class LessonsVC: UIViewController {

    //MARK: - PROPERTIES
    //outlets
    @IBOutlet weak var coverVideoView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    //variables
    var videoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    var player = AVPlayer()
    var playerController = AVPlayerViewController()
    var playPauseButton: PlayPauseButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        startVideo()
 
    }
    
    
    //setup ui
    func setupUI() {
        bottomView.addLayerEffects(with: UIColor(named: "boaderClr"), borderWidth: 1, cornerRadius: 30)
    }


    //strat cover video on view load
    func startVideo() {
        
        guard let url = URL(string: videoUrl) else { return }
        player = AVPlayer(url: url)
        player.rate = 1
        playerController.player = player
        playerController.showsPlaybackControls = false
        playerController.view.frame.size.height = coverVideoView.frame.size.height
        playerController.view.frame.size.width = coverVideoView.frame.size.width
        addChild(playerController)
        self.coverVideoView.addSubview(playerController.view)
        playerController.didMove(toParent: self)
        playPauseButton = PlayPauseButton()
        playPauseButton.avPlayer = player
        self.coverVideoView.addSubview(playPauseButton)
        playPauseButton.setup(in: self)
        
    }
    
}

