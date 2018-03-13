import UIKit

class createAccountVC: UIViewController {
    
    
    //outlets
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordTex: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    
    // variables
    
    var avaterName = "profileDefault"
    var avaterColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor : UIColor?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            avaterName = UserDataService.instance.avatarName
            
            if avaterName.contains("light") && bgColor == nil {
                userImage.backgroundColor = UIColor.lightGray
            }
            
        }
    }
    
    
    //Actions
    @IBAction func pickAvatareBTN(_ sender: Any) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBackColorBTN(_ sender: Any) {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        
        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        UIView.animate(withDuration: 0.2){
            self.userImage.backgroundColor = self.bgColor
        }
        
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToChannel", sender: nil)
    }
    
    
    @IBAction func creatAcountBTN(_ sender: Any) {
        spiner.isHidden = false
        spiner.startAnimating()
        guard let name = userNameText.text , userNameText.text != "" else {return}
        guard let email = emailText.text , emailText.text != "" else {return}
        guard let password = passwordTex.text , passwordTex.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avaterName, avatarColor: self.avaterColor, complation: { (success) in
                            if success {
                                self.spiner.isHidden = true
                                self.spiner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    //func
    func setupView() {
        spiner.isHidden = true
        userNameText.attributedPlaceholder = NSAttributedString(string: "User Name", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        emailText.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        passwordTex.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(createAccountVC.handleTap))
        view.addGestureRecognizer(tap)
        
    }
    
    @objc func handleTap(){
        view.endEditing(true)
    }
    
    
    
    
    
}

