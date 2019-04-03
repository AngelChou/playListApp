//
//  PlayListTableViewController.swift
//  playListApp
//
//  Created by Shun-Ching, Chou on 2019/4/2.
//  Copyright © 2019 Shun-Ching, Chou. All rights reserved.
//

import UIKit
import AVFoundation

class PlayListTableViewController: UITableViewController {
    let singers = ["廬廣仲：幾分之幾", "周杰倫：聽見下雨的聲音", "蕭敬騰：王妃", "張惠妹：連名帶姓", "蔡依林：不一樣又怎樣", "楊丞琳：其實我們值得幸福"]
    let urlStrings = ["https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview128/v4/de/40/a4/de40a4ef-7ca1-5caf-3b89-9ffb301f1055/mzaf_4213742263692215867.plus.aac.ep.m4a", "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music1/v4/86/7a/89/867a89da-4287-b411-7384-4e8b315db81e/mzaf_6399696324601603371.plus.aac.ep.m4a",  "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music/7c/c6/3c/mzm.wvpccxro.aac.ep.m4a", "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/AudioPreview128/v4/b0/92/00/b0920049-2660-dfd9-5369-39dad6b428d1/mzaf_3857513401080177959.plus.aac.ep.m4a", "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music3/v4/ad/71/c1/ad71c16b-50d3-5ebd-2eff-7e1c9771d9c9/mzaf_5586099329908803604.plus.aac.ep.m4a", "https://audio-ssl.itunes.apple.com/apple-assets-us-std-000001/Music1/v4/3a/98/53/3a9853c0-c792-453a-335c-6d3c3d9cf3b4/mzaf_7103764280915298613.plus.aac.ep.m4a"]
    
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet var labels: [UILabel]!
    var players: [AVPlayer] = []
    var playingPlayer: AVPlayer?
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        let player = players[index]
        player.volume = 0.5
        if let playingPlayer = playingPlayer {
            playingPlayer.pause()
        }
        player.play()
        playingPlayer = player
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var i = 0
        for singer in singers {
            labels[i].text = singer
            imageViews[i].image = UIImage(named: singer)
            let url = URL(string: urlStrings[i])
            players.append(AVPlayer(url: url!))
            i = i + 1
        }
    }
}
