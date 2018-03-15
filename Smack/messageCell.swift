import UIKit

class messageCell: UITableViewCell {
    
    
    //outlets 
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var messageLable: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configerCell(message: Message) {
        messageLable.text = message.message
        userName.text = message.userName
        userImage.image = UIImage(named: message.userAvatar)
        userImage.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
        
    }
    
}
