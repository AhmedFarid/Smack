import Foundation



class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    
    
    func setUserData(id: String, avatarColor: String, avatarName:String ,email: String, name:String) {
        
        
        self.id = id
        self.avatarName = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
        
        
    }
    
    func setAvaterName(avaterName: String) {
        self.avatarName = avaterName
    }
    
    
    
    
    
}
