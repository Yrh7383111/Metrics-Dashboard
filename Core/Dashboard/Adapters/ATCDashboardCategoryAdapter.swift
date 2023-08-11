import ChameleonFramework
import UIKit


class ATCDashboardCategoryAdapter: ATCGenericCollectionRowAdapter {
    let uiConfig: ATCUIGenericConfigurationProtocol

    init(uiConfig: ATCUIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let category = object as? ATCDashboardCategory, let cell = cell as? ATCDashboardCategoryCollectionViewCell else { return }
        cell.categoryContainerView.backgroundColor = uiConfig.mainThemeBackgroundColor
        cell.categoryContainerView.clipsToBounds = true
        cell.categoryContainerView.layer.cornerRadius = 7
        cell.categoryContainerView.dropShadow()

        let color = UIColor(hexString: category.colorString)
        cell.iconContainerView.layer.borderWidth = 1.2
        cell.iconContainerView.layer.borderColor = color.cgColor
        cell.iconContainerView.layer.cornerRadius = 22
        cell.iconContainerView.backgroundColor = UIColor(hexString: category.colorString, alpha: 0.25)

        cell.iconImageView.image = UIImage.localImage(category.iconName, template: true)
        cell.iconImageView.tintColor = color

        cell.categoryLabel.text = category.name
        cell.categoryLabel.textColor = uiConfig.mainTextColor
        cell.categoryLabel.font = uiConfig.mediumBoldFont
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCDashboardCategoryCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: ATCGenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCDashboardCategory else { return .zero }
        return CGSize(width: (containerBounds.width - 4 * 10.0) / 3 , height: 140)
    }
}
