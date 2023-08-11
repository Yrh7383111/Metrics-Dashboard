import UIKit


class ATCDashboardItemAdapter: ATCGenericCollectionRowAdapter {
    let uiConfig: ATCUIGenericConfigurationProtocol

    init(uiConfig: ATCUIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let item = object as? ATCDashboardItem, let cell = cell as? ATCDashboardItemCollectionViewCell else { return }
        if (item.imageURL.count > 0) {
            cell.itemImageView.kf.setImage(with: URL(string: item.imageURL))
            cell.itemImageView.isHidden = false
        } else {
            cell.itemImageView.isHidden = true
        }
        cell.itemImageView.layer.cornerRadius = 45.0/2.0
        cell.itemImageView.layer.borderColor = UIColor.gray.cgColor
        cell.itemImageView.layer.borderWidth = 0.5
        cell.itemImageView.clipsToBounds = true
        cell.itemImageView.contentMode = .scaleAspectFill

        cell.itemTitleLabel.text = item.title
        cell.itemTitleLabel.font = uiConfig.regularMediumFont
        cell.itemTitleLabel.textColor = uiConfig.mainTextColor

        cell.itemDescriptionLabel.text = String(item.descriptionString.prefix(23))
        cell.itemDescriptionLabel.font = uiConfig.regularSmallFont
        cell.itemDescriptionLabel.textColor = uiConfig.mainSubtextColor

        cell.itemValueLabel.text = item.valueString
        cell.itemValueLabel.font = uiConfig.regularSmallFont
        cell.itemValueLabel.textColor = UIColor(hexString: item.valueColor)
        
        cell.containerView.backgroundColor = uiConfig.mainThemeBackgroundColor
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCDashboardItemCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: ATCGenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCDashboardItem else { return .zero }
        return CGSize(width: containerBounds.width, height: 70)
    }
}
