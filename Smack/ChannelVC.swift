import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //OutletSection
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){}
    @IBOutlet weak var userImage: CircleImage!
    @IBOutlet weak var channelTabble: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelTabble.delegate = self
        channelTabble.dataSource = self
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        
        socketService.instance.getChannel { (success) in
            if success {
                self.channelTabble.reloadData()
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    //Actions
    
    @IBAction func AddChannel(_ sender: Any) {
        let addChannel = AddChannelVC()
        addChannel.modalPresentationStyle = .custom
        present(addChannel, animated: true, completion: nil)
        
    }
    
    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn{
            //show Profile
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        }else{
            
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
    }
    
    //Funcs
    
    @objc func userDataDidChange(_ notif: Notification){
        setupUserInfo()
    }
    
    func setupUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(componets: UserDataService.instance.avatarColor)
        }else{
            loginBtn.setTitle("LOGIN", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }
    
    //tableView SetUp 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? channelCell{
            let channel = MessageService.instance.channels[indexPath.row]
            cell.conifgerCell(channel: channel)
            return cell
        } else{
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
    
    
}
