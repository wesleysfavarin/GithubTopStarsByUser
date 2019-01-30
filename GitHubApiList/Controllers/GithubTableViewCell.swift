//
//  GithubTableViewCell.swift
//  GitHubApiList
//
//  Created by mac on 29/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class GithubTableViewCell: UITableViewCell {

    @IBOutlet weak var lbRepoName: UILabel!
    @IBOutlet weak var ivAvatar: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func prepare(with repo: Item){
           lbRepoName?.text = " Autor name: \(repo.name)"
    }
}
