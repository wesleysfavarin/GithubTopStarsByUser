//
//  DetalhesViewController.swift
//  GitHubApiList
//
//  Created by mac on 29/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import Kingfisher
class DetalhesViewController: UIViewController {
    var repoSelected: Item!
    
    @IBOutlet weak var titlepage: UINavigationItem!
    @IBOutlet weak var ivAvatar: UIImageView!
    @IBOutlet weak var lbRepositorie: UILabel!
    @IBOutlet weak var lbQtdStars: UILabel!
    @IBOutlet weak var lbUsuario: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      loadInfo()
    }

    func loadInfo()
    {
        
        if let url = URL(string: repoSelected.owner.avatarURL){
            ivAvatar.kf.indicatorType = .activity
            ivAvatar.kf.setImage(with: url)
            
        }
        else{
            ivAvatar.image = nil
        }
        
        titlepage.title = repoSelected.name
        lbRepositorie.text = "Nome Repositorio :\(repoSelected.fullName)"
        lbUsuario.text = "Nome usuário: \(repoSelected.owner.login)"
        lbQtdStars.text = "Total estrelas: \(repoSelected.stargazersCount)"
    }

}
