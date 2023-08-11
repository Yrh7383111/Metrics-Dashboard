import UIKit


class ATCDashboardCategory: ATCGenericBaseModel {
    var name: String
    var colorString: String
    var iconName: String

    init(name: String, iconName: String, colorString: String) {
        self.name = name
        self.iconName = iconName
        self.colorString = colorString
    }

    required init(jsonDict: [String: Any]) {
        fatalError()
    }

    var description: String {
        return name
    }
}
