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
    var videoUrl = "http://techslides.com/demos/sample-videos/small.mp4"
    var player = AVPlayer()
    var playerController = AVPlayerViewController()
    var playPauseButton: PlayPauseButton!
    let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startVideo()
        setupTableView()
        self.navigationItem.hidesBackButton = true
        let leftButton = UIButton(type: UIButton.ButtonType.custom)
        leftButton.clipsToBounds = true
        leftButton.setImage(UIImage(named: "ic_back"), for: .normal) // add custom image
        leftButton.addTarget(self, action: #selector(onBackButton_Clicked), for: UIControl.Event.touchUpInside)
        leftButton.tintColor = .white
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = leftButton
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    
    @objc func onBackButton_Clicked(sender: UIButton)
    {
            navigationController?.popViewController(animated: true)
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(videoDidEnded), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player.currentItem)
        
        playPauseButton = PlayPauseButton()
        playPauseButton.avPlayer = player
        self.coverVideoView.addSubview(playPauseButton)
        playPauseButton.setup(in: self)
        
    }
    
    //if video ended replay video
    @objc private func videoDidEnded() {
        playerController.dismiss(animated: true, completion: nil)
            self.player.seek(to: CMTime.zero)
            self.player.play()
    }
    
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        if #available(iOS 15, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        tableView.sectionHeaderHeight = 70
        tableView.sectionFooterHeight = 0.0
        
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
        return 70
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionId")
        
        return cell
  
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = "Test"
        return cell
    }
    
}
