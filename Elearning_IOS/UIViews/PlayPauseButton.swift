//
//  PlayPauseButton.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-15.
//

import Foundation
import AVFoundation
import AVKit

class PlayPauseButton: UIView {
    
    //MARK: - PROPERTIES
    var rateContext = 0
    var avPlayer: AVPlayer?
    var isPlaying: Bool {
        return avPlayer?.rate != 0 && avPlayer?.error == nil
    }
    
    
    //MARK: - METHODS
    func addObservers() {
        avPlayer?.addObserver(self, forKeyPath: "rate", options: .new, context: &rateContext)
    }
    
    func setup(in container: UIViewController) {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapped(_:)))
        addGestureRecognizer(gesture)
        
        updatePosition()
        updateUI()
        addObservers()
    }
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        updateStatus()
        updateUI()
    }
    
    private func updateStatus() {
        if isPlaying {
            avPlayer?.pause()
        } else {
            avPlayer?.play()
        }
    }
    
    func updateUI() {
        if isPlaying {
            setBackgroundImage(name: "ic_pause")
        } else {
            setBackgroundImage(name: "ic_play")
        }
    }
    
    func updatePosition() {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 60),
            heightAnchor.constraint(equalToConstant: 60),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        ])
    }
    
    private func setBackgroundImage(name: String) {
        DispatchQueue.main.async {
            UIGraphicsBeginImageContext(self.frame.size)
            
            if let uiImage =  UIImage(named: name) {
                uiImage.draw(in: self.bounds)
            }
            guard let image = UIGraphicsGetImageFromCurrentImageContext() else {
                print("❌error: image not found")
                return }
            UIGraphicsEndImageContext()
            
            //set play pause button opacity
            if name == "ic_pause" {
                self.backgroundColor = UIColor(patternImage: image).withAlphaComponent(0.5)
            } else {
                self.backgroundColor = UIColor(patternImage: image)
            }
            
        }
    }
    
    private func handleRateChanged() {
        updateUI()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let context = context else { return }
        
        switch context {
        case &rateContext:
            handleRateChanged()
        default:
            break
        }
    }
}
