import UIKit


protocol ATCDashboardConfigurationProtocol: ATCUIGenericConfigurationProtocol {
    var homeImage: UIImage { get }
    var categoriesImage: UIImage { get }
    var ordersImage: UIImage { get }
    var notificationsImage: UIImage { get }
    var composeImage: UIImage { get }
    var savedImage: UIImage { get }
    var searchImage: UIImage { get }
}
