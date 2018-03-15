import UIKit

class signinVC: UIViewController {

    
    //Outlets 
    @IBOutlet weak var userNameTXT: UITextField!
    @IBOutlet weak var passwordTXT: UITextField!
    @IBOutlet weak var spiner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    
    //Actions
    @IBAction func loginBTN(_ sender: Any) {
        spiner.isHidden = false
        spiner.startAnimating()
        
        guard let email = userNameTXT.text , userNameTXT.text != "" else{return}
        guard let password = passwordTXT.text , passwordTXT.text != "" else{return}
        
        AuthService.instance.loginUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spiner.isHidden = true
                        self.spiner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    @IBAction func cancelBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccntBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    //Funcs
    
    func setupView() {
        spiner.isHidden = true
        userNameTXT.attributedPlaceholder = NSAttributedString(string: "User Name", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        passwordTXT.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName: smackPurplePlaceholder])
        
    }
}
