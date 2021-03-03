//
//  MTCustomPlayer.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 3/3/21.
//

import UIKit

class MTCustomVideoPlayerVC: UIViewController {
    
    @IBOutlet weak private var stopImageView: UIImageView!
    @IBOutlet weak private var playPauseImageView: UIImageView!
    @IBOutlet weak private var lockUnlockImageView: UIImageView!
    @IBOutlet weak private var playerBGView: UIView!
    @IBOutlet weak private var playerView: PlayerView!
    
    private var videoPlayer:VideoPlayer?
    private var isLockBtnSelected = false
    private var isPlayBtnSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let filePath = Bundle.main.path(forResource: "video", ofType: "mp4") {
            let fileURL = NSURL(fileURLWithPath: filePath)
            videoPlayer = VideoPlayer(urlAsset: fileURL, view: playerView)
            if let player = videoPlayer {
                player.playerRate = 0.67
            }
        }
        
        let playPauseTap = UITapGestureRecognizer(target: self, action: #selector(self.playPauseHandleTap(_:)))
        playPauseImageView.addGestureRecognizer(playPauseTap)
        
        let lockUnlockTap = UITapGestureRecognizer(target: self, action: #selector(self.lockUnlockHandleTap(_:)))
        lockUnlockImageView.addGestureRecognizer(lockUnlockTap)
        
        let stopTap = UITapGestureRecognizer(target: self, action: #selector(self.stopHandleTap(_:)))
        stopImageView.addGestureRecognizer(stopTap)
    }
    
    @objc func playPauseHandleTap(_ sender: UITapGestureRecognizer? = nil) {
        if !isPlayBtnSelected{
            videoPlayer?.pause()
            isPlayBtnSelected = true
            playPauseImageView.image = UIImage(systemName: "play.circle.fill")
        }else{
            videoPlayer?.play()
            isPlayBtnSelected = false
            playPauseImageView.image = UIImage(systemName: "pause.circle.fill")
        }
    }
    
    @objc func lockUnlockHandleTap(_ sender: UITapGestureRecognizer? = nil) {
        if !isLockBtnSelected{
            lockUnlockImageView.image = UIImage(systemName: "lock.circle.fill")
            self.playerBGView.isUserInteractionEnabled = false
            isLockBtnSelected = true
            
        }else{
            lockUnlockImageView.image = UIImage(systemName: "lock.open.fill")
            self.playerBGView.isUserInteractionEnabled = true
            isLockBtnSelected = false
            
        }
    }
    
    @objc func stopHandleTap(_ sender: UITapGestureRecognizer? = nil) {
        videoPlayer?.pause()
        dismiss(animated: true, completion: nil)
    }
}
