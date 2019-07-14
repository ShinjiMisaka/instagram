//
//  PostTableTableViewCell.swift
//  instagram
//
//  Created by 三坂真治 on 2019/07/13.
//  Copyright © 2019 shinji.misaka. All rights reserved.
//

import UIKit
import Firebase

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var commentLabel: UILabel!
    
    
    
    
    
    @IBAction func commentButton(_ sender: Any) {
    
        let commentRef = Database.database().reference().child(Const.CommentPath)
        let name = Auth.auth().currentUser?.displayName
        let comment = self.commentTextField.text!
        let commentDic = ["name":name,"comment":comment]
        commentRef.childByAutoId().setValue(commentDic)
        
        func setComment(_ commentData: CommentData) {
            
            self.commentLabel.text="\(commentData.name!):\(commentData.comment!)"
            self.commentTextField.text=""
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
    
    func setPostData(_ postData: PostData) {
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let dateString = formatter.string(from: postData.date!)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: .normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: .normal)
        }
    }
}
