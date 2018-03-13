import Foundation




typealias CompletionHandler = (_ Success: Bool) -> ()


// URL Constants

let BASE_URL = "https://faridoapp.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
let URL_LOGIN = "\(BASE_URL)account/login"
let URL_ADD_USER = "\(BASE_URL)/user/add"


// Colors
let smackPurplePlaceholder = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.5)

// Notification Constants
let NOTIF_USER_DATA_DID_CHANGE = Notification.Name("notifUserDataChanged")

//Segues

let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"
let TO_AVATAR_PICKER = "toAvatarPicker"


// User Defaults

let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"


// Headers

let HEADER = [
    "Content-Type": "application/json; charset=utf-8"
]















