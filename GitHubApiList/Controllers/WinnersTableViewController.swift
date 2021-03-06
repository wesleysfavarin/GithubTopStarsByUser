//
//  WinnersTableViewController.swift
//  GitHubApiList
//
//  Created by mac on 29/01/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
class WinnersTableViewController: UITableViewController {

    var githubData: [Item] = []
    var currentPage = 0
    var total = 0
    var loadingTopStars = false
   
    override func viewDidLoad() {
        super.viewDidLoad()
      loadTopStars()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination  as! DetalhesViewController
        let repoSelected = githubData[tableView.indexPathForSelectedRow!.row]
        vc.repoSelected = repoSelected
    }
    
    func loadTopStars(){
       
        GithubApi.LoadGithubRanking(){ (info) in
            if let info = info{
                //print(info)
                self.githubData += info.items
                
                self.total = info.totalCount
              
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.total
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cells", for: indexPath) as! GithubTableViewCell
        
       let result = githubData[indexPath.row]
        cell.prepare(with: result)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
