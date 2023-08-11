import UIKit


class ATCDashboardItemPropertyAdapter: ATCGenericCollectionRowAdapter {
    let uiConfig: ATCUIGenericConfigurationProtocol

    init(uiConfig: ATCUIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let item = object as? ATCDashboardProperty, let cell = cell as? ATCDashboardItemPropertyCollectionViewCell else { return }

        cell.containerView.backgroundColor = uiConfig.mainThemeBackgroundColor
        cell.borderView.backgroundColor = uiConfig.mainSubtextColor

        cell.keyLabel.text = item.name
        cell.keyLabel.font = uiConfig.regularMediumFont
        cell.keyLabel.textColor = uiConfig.mainTextColor

        cell.valueLabel.text = item.value
        cell.valueLabel.font = uiConfig.regularSmallFont
        cell.valueLabel.textColor = uiConfig.mainSubtextColor
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCDashboardItemPropertyCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: ATCGenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCDashboardProperty else { return .zero }
        return CGSize(width: containerBounds.width, height: 40)
    }
}
