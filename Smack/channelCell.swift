import UIKit

class channelCell: UITableViewCell {
    
    //outlets
    @IBOutlet weak var channeName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func conifgerCell(channel : Channel) {
        let title = channel.channelTitle ?? ""
        channeName.text = "#\(title)"
    }
}
