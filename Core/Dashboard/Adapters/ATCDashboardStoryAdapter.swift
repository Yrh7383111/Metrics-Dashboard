import ChameleonFramework
import UIKit


class ATCDashboardStoryAdapter: ATCGenericCollectionRowAdapter {
    let uiConfig: ATCUIGenericConfigurationProtocol

    init(uiConfig: ATCUIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let category = object as? ATCDashboardCategory, let cell = cell as? ATCDashboardStoryCollectionViewCell else { return }

        let color = UIColor(hexString: category.colorString)
        cell.imageContainerView.layer.borderWidth = 1.2
        cell.imageContainerView.layer.borderColor = color.cgColor
        cell.imageContainerView.layer.cornerRadius = 54.0/2.0
        cell.imageContainerView.backgroundColor = UIColor(hexString: category.colorString, alpha: 0.25)
        cell.containerView.backgroundColor = uiConfig.mainThemeBackgroundColor

        cell.storyImageView.image = UIImage.localImage(category.iconName, template: true)
        cell.storyImageView.tintColor = color

        cell.nameLabel.text = category.name
        cell.nameLabel.textColor = uiConfig.mainTextColor
        cell.nameLabel.font = uiConfig.boldSmallFont
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCDashboardStoryCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: ATCGenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCDashboardCategory else { return .zero }
        return CGSize(width: 70, height: 80)
    }
}
