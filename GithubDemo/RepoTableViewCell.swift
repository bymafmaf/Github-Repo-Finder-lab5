//
//  RepoTableViewCell.swift
//  GithubDemo
//
//  Created by monus on 2/16/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setUpVariables(repo:GithubRepo){
        avatarImage.setImageWith(URL(string: repo.ownerAvatarURL!)!)
        repoNameLabel.text = repo.name!
        starLabel.text = String(describing: repo.stars!)
        forkLabel.text = String(describing: repo.forks!)
        authorLabel.text = "by " + repo.ownerHandle!
        descriptionLabel.text = repo.repoDescription!
        circleAvatar()
    }
    func circleAvatar(){
        avatarImage.layer.borderWidth = 1
        avatarImage.layer.masksToBounds = false
        avatarImage.layer.borderColor = UIColor.black.cgColor
        avatarImage.layer.cornerRadius = avatarImage.frame.height/2
        avatarImage.clipsToBounds = true
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
