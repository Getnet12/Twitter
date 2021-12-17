//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Getnet Mekuriyaw on 12/12/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    var favorited:Bool = false
    var tweetId = -1
    //var retweeted: Bool = false
    
    //it was supposed to be favoriteTweet
    @IBAction func retweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { error in
                print("Favorite did not succed: \(error)")
            })
        }else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { error in
                print("Unfavorite did not succeed: \(error)")
            })
        }
    }
    
    //it was supposed to be retweet
    @IBAction func favoriteTweet(_ sender: Any) {
    
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success: {
            self.setRetweeted(true)
        }, failure: { error in
            print("Retweeting did not succeed: \(error)")
        })
    
//        else {
//            TwitterAPICaller.client?.retweet(tweetId: self.tweetId, success: {
//            self.setRetweeted(false)
//        }, failure: { error in
//            print("Unretweeting did not succeed: \(error)")
//        })
//        }
    }
    
  
    func setFavorite(isFavorited: Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else {
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(_ isRetweeted: Bool){
        if(isRetweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }
        else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
