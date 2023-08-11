import UIKit

class ATCDashboardProperty: ATCGenericBaseModel {
    var name: String
    var value: String

    init(name: String, value: String) {
        self.name = name
        self.value = value
    }

    required init(jsonDict: [String: Any]) {
        fatalError()
    }

    var description: String {
        return name
    }
}

class ATCDashboardItem: ATCGenericBaseModel {
    var id: String
    var title: String
    var descriptionString: String
    var valueString: String
    var valueColor: String
    var imageURL: String
    var properties: [ATCDashboardProperty]

    init(id: String, title: String, valueString: String, valueColor: String, descriptionString: String, imageURL: String, properties: [ATCDashboardProperty]) {
        self.id = id
        self.title = title
        self.valueString = valueString
        self.descriptionString = descriptionString
        self.imageURL = imageURL
        self.descriptionString = descriptionString
        self.properties = properties
        self.valueColor = valueColor
    }

    required init(jsonDict: [String: Any]) {
        fatalError()
    }

    var description: String {
        return title
    }
}
