//
//  PlayerView.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 3/3/21.
//

import AVFoundation
import Foundation
import UIKit


class PlayerView: UIView {

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
        set {
            playerLayer.player = newValue
        }
    }

    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer
    }

    // Override UIView property
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
}

