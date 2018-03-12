import UIKit

class signinVC: UIViewController {

    
    //Outlets 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func cancelBtnPressed(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
    }
    @IBAction func createAccntBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
}
