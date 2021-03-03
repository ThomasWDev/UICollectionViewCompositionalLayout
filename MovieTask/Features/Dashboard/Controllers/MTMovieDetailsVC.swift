//
//  MTMovieDetailsVC.swift
//  MovieTask
//
//  Created by Thomas Woodfin on 3/2/21.
//

import UIKit
import AVFoundation
import AVKit

class MTMovieDetailsVC: UIViewController {
    
    @IBOutlet weak private var titleImageView: UIImageView!
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var ratingLbl: UILabel!
    @IBOutlet weak private var watchMovieDialogLbl: UILabel!
    @IBOutlet weak private var synopsisLbl: UILabel!
    @IBOutlet weak private var genreLbl: UILabel!
    @IBOutlet weak private var artistNamesLbl: UILabel!
    @IBOutlet weak private var directorNameLbl: UILabel!
    @IBOutlet weak private var releaseDateLbl: UILabel!
    @IBOutlet weak private var languageLbl: UILabel!
    @IBOutlet weak private var publisherLbl: UILabel!
    @IBOutlet weak private var playImageView: UIImageView!
    
    @IBOutlet private weak var playerView: PlayerView!
    private var videoPlayer: VideoPlayer?
    
    
    var viewModel: MTDashboardVM?
    var titleId = 0
    var imageUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movie Details"
        getData()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        playImageView.addGestureRecognizer(tap)
    }
    
    private func getData(){
        viewModel?.getMovieDetails(titleId: self.titleId, completion: {[weak self] (success) in
            if success{
                self?.setData()
            }
        })
    }
    
    private func setData(){
        guard let vm = viewModel else {return}
        titleImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "placeholder"))
        titleLbl.text = vm.getTitleDetails()
        ratingLbl.attributedText = NSMutableAttributedString().bold("Rating: ").normal(vm.getRating())
        watchMovieDialogLbl.text = "Start watching \(vm.getTitleDetails())"
        synopsisLbl.text = vm.getSynopsis()
        
        let genres = vm.getGenres()
        let genre = genres.map {$0.name}.compactMap({$0}).joined(separator: ", ")
        genreLbl.attributedText = NSMutableAttributedString().bold("Genre: ").normal(genre)
        
        let artistNames = vm.getArtis()
        artistNamesLbl.attributedText = NSMutableAttributedString().bold("Cast: ").normal(artistNames.map {$0.name}.compactMap({$0}).joined(separator: ", "))
        
        let directorNames = vm.getDirector()
        directorNameLbl.attributedText = NSMutableAttributedString().bold("Director: ").normal(directorNames.map {$0.name}.compactMap({$0}).joined(separator: ", "))
        
        let dateStr = Helper.getMilSecToDateStr(milSec: vm.getReleaseDate())
        releaseDateLbl.attributedText = NSMutableAttributedString().bold("Release date: ").normal(dateStr)
        
        languageLbl.attributedText = NSMutableAttributedString().bold("Language: ").normal(vm.getLanguage())
        publisherLbl.attributedText = NSMutableAttributedString().bold("Publisher: ").normal(vm.getPublisherName())
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        playVideo()
    }
    
    private func playVideo(){
        let storyboard = UIStoryboard(storyboard: .dashboard)
        let vc = storyboard.instantiateViewController(withIdentifier: MTCustomVideoPlayerVC.self)
        vc.isModalInPresentation = true
        self.present(vc, animated: true, completion: nil)
    }
}
