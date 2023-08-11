import UIKit


struct ATCProfileScreenConfiguration {
    var viewer: ATCUser
    var viewee: ATCUser
    var messageButtonAction: ((_ viewer: ATCUser, _ viewee: ATCUser) -> Void)?
    var followButtonAction: ((_ viewer: ATCUser, _ viewee: ATCUser) -> Void)?
}


protocol ATCProfileScreenPresenterProtocol: class {
    func presentProfileScreen(viewController: UIViewController, user: ATCUser) -> Void
}


protocol ATCProfileScreenProtocol: class {
    var configuration: ATCProfileScreenConfiguration {get}
}
