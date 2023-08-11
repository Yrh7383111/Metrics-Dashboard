import UIKit


class ATCDashboardFeedItem: ATCGenericBaseModel {
    var title: String
    var colorString: String
    var valueString: String
    var valueColor: String
    var descriptionString: String

    init(title: String, valueString: String, colorString: String, valueColor: String, descriptionString: String) {
        self.title = title
        self.valueString = valueString
        self.colorString = colorString
        self.valueColor = valueColor
        self.descriptionString = descriptionString
    }

    required init(jsonDict: [String: Any]) {
        fatalError()
    }

    var description: String {
        return title
    }
}
