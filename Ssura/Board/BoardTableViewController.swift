//
//  BoardTableViewController.swift
//  Ssura
//
//  Created by 겨울나무 on 23/12/2018.
//  Copyright © 2018 겨울나무. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct BoardPost {
    var key: String!
    var title: String?
    var postDate: String?
    var writerID: String?
    var writerName: String?
    var writerAvatarImage: String? = ""
    
}

class BoardTableViewController: UITableViewController {
    var posts: [BoardPost] = []
    var ref: DatabaseReference!
    
    func resolveBoard () {
        posts = []
        
        ref.child("board").observeSingleEvent(of: DataEventType.value) { (snapshot: DataSnapshot) in
            for child in snapshot.children {
                let node = child as! DataSnapshot
                let post = node.value as! [String: String]
                var item = BoardPost()
                
                item.title = post["title"]
                item.postDate = post["postDate"]
                item.writerName = post["writerName"]
                item.writerID = post["wirterID"]
                self.posts.append(item)
            }
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoardCell", for: indexPath) as! BoardTableViewCell

        let post = posts[indexPath.row]
        cell.boardWriteTitle.text = post.title
        
//        if let url = URL(string: post.writerAvatarImage!),
//            let data = try? Data(contentsOf: url) {
//            let avaterImage = UIImage(data: data)
//            cell.boardWriterAvatar.image = avaterImage
//        }

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
