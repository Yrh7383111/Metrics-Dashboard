import UIKit


class ATCDashboardFeedItemAdapter: ATCGenericCollectionRowAdapter {
    let uiConfig: ATCUIGenericConfigurationProtocol

    init(uiConfig: ATCUIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let viewModel = object as? ATCDashboardFeedItem, let cell = cell as? ATCDashboardFeedItemCollectionViewCell else { return }

        cell.itemContainerView.backgroundColor = uiConfig.mainThemeBackgroundColor
        cell.badgeView.backgroundColor = UIColor(hexString: viewModel.colorString)
        cell.badgeView.layer.cornerRadius = 10/2.0
        cell.badgeView.layer.borderWidth = 0.5
        cell.badgeView.clipsToBounds = true

        cell.valueLabel.text = viewModel.valueString
        cell.valueLabel.textColor = UIColor(hexString: viewModel.valueColor)
        cell.valueLabel.font = uiConfig.regularMediumFont

        cell.itemTitleLabel.text = viewModel.title
        cell.itemTitleLabel.font = uiConfig.regularMediumFont
        cell.itemTitleLabel.textColor = uiConfig.mainTextColor

        cell.descriptionLabel.text = viewModel.descriptionString
        cell.descriptionLabel.font = uiConfig.regularSmallFont
        cell.descriptionLabel.textColor = uiConfig.mainSubtextColor
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCDashboardFeedItemCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: ATCGenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCDashboardFeedItem else { return .zero }
        return CGSize(width: containerBounds.width, height: 70)
    }
}
