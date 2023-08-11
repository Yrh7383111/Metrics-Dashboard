import UIKit


class ATCTotalCard: ATCGenericBaseModel {
    var totalTitle: String
    var numberText: String
    var iconPath: String
    var gradientStartColor: String
    var gradientEndColor: String

    init(totalTitle: String, numberText: String, iconPath: String, gradientStartColor: String, gradientEndColor: String) {
        self.totalTitle = totalTitle
        self.numberText = numberText
        self.iconPath = iconPath
        self.gradientStartColor = gradientStartColor
        self.gradientEndColor = gradientEndColor
    }

    required init(jsonDict: [String: Any]) {
        fatalError()
    }

    var description: String {
        return totalTitle
    }
}
