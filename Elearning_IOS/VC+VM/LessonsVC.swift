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
    @IBOutlet weak var tableView: UITableView!
    
    //variables
    var videoUrl = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    var player = AVPlayer()
    var playerController = AVPlayerViewController()
    var playPauseButton: PlayPauseButton!
    let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startVideo()
        setupTableView()
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
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        setupTableViewHeader()
        setupTableViewFooter()
        
    }
    
    
    //setup header
    private func setupTableViewHeader() {
        
        let header = HeaderView(frame: .zero)
        
        //set frame size before content load
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        //recalculate after content load
        size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
        
    }
    
    //setup footer
    private func setupTableViewFooter() {
        
        let footer = FooterView(frame: .zero)
        
        //set frame size before content load
        var size = footer.systemLayoutSizeFitting(UIView.layoutFittingExpandedSize)
        size.width = UIScreen.main.bounds.width
        footer.frame.size = size
        
        //recalculate after content load
        size = footer.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        footer.frame.size = size
        
        tableView.tableFooterView = footer
        
    }
    
}



//MARK: - table view
extension LessonsVC:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}


extension LessonsVC:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = "Test"
        cell.backgroundColor = .red
        return cell
    }
    
}
