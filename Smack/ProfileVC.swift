import UIKit

class ProfileVC: UIViewController {
    
    //Outlets
    
    @IBOutlet weak var profileIMG: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var bgview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
    }
    
    //Actions
    
    @IBAction func closeBTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func logOutBTN(_ sender: Any) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        dismiss(animated: true, completion: nil)
    }
    
    //func
    
    func setupView() {
        userName.text = UserDataService.instance.name
        userEmail.text = UserDataService.instance.email
        profileIMG.image = UIImage(named: UserDataService.instance.avatarName)
        profileIMG.backgroundColor = UserDataService.instance.returnUIColor(componets: UserDataService.instance.avatarColor)
        
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeTap(_:)))
        bgview.addGestureRecognizer(closeTouch)
    
    }
    
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
}
