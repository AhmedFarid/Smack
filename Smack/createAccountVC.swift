import UIKit

class createAccountVC: UIViewController {
    
    
    //outlets
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordTex: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    
    // variables
    
    var avaterName = "profileDefault"
    var avaterColor = "[0.5, 0.5, 0.5, 1]"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func pickAvatareBTN(_ sender: Any) {
    }
    
    @IBAction func generateBackColorBTN(_ sender: Any) {
    }
    
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: "unwindToChannel", sender: nil)
    }
    
    
    @IBAction func creatAcountBTN(_ sender: Any) {
        
        guard let name = userNameText.text , userNameText.text != "" else {return}
        guard let email = emailText.text , emailText.text != "" else {return}
        guard let password = passwordTex.text , passwordTex.text != "" else {return}
        
        AuthService.instance.registerUser(email: email, password: password) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: password, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avaterName, avatarColor: self.avaterColor, complation: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
}
