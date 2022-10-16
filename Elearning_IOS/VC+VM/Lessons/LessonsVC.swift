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
    var sectionLessonData: [Int: [LessonsInfo]] = [
        0: DummyData.section1,
        1: DummyData.section2,
        2: DummyData.section3
    ]
    
    
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
        
        ///observer to notify if currnt video ended
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
        tableView.sectionHeaderHeight = 46
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
        //selected row
    }
}


extension LessonsVC:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        DummyData.lessionSection.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionHeaderCell") as! SectionHeaderCell
        cell.sectionTitle.text = "Section \(DummyData.lessionSection[section].id) - \(DummyData.lessionSection[section].title)"
        cell.timeLable.text = "\(DummyData.lessionSection[section].duration) mins"
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionLessonData[section]!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TopicsCell", for: indexPath) as! TopicsCell
        
        if let sectionData = sectionLessonData[indexPath.section]?[indexPath.row] {
            cell.lessonNumLbl.text = sectionData.lessionNum
            cell.titleLbl.text = sectionData.title
            cell.durationLbl.text = "\(sectionData.duration) mins"
            cell.isUnlocked = sectionData.isUnlocked
            cell.checkStatus()
        }
        return cell
    }
    
}
