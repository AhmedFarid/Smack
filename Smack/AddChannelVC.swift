import UIKit

class AddChannelVC: UIViewController {

    //Outlests
    @IBOutlet weak var userNameTXT: UITextField!
    @IBOutlet weak var descriptionTXT: UITextField!
    @IBOutlet weak var bgview: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpview()

    }

    
    //Actions
    
    @IBAction func createChannelBTN(_ sender: Any) {
        guard let channelName = userNameTXT.text , userNameTXT.text != "" else{ return }
        guard let description = descriptionTXT.text else{ return }
        socketService.instance.addChannel(channelName: channelName, channelDescription: description) { (success) in
            if success {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func closeBTN(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    //Funcs
    
    func setUpview(){
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgview.addGestureRecognizer(closeTouch)
        userNameTXT.attributedPlaceholder = NSAttributedString(string: "User Name", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        descriptionTXT.attributedPlaceholder = NSAttributedString(string: "Description", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        
    }
    
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
