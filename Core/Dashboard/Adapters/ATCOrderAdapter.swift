import UIKit


class ATCOrderAdapter: ATCGenericCollectionRowAdapter {
    let uiConfig: ATCUIGenericConfigurationProtocol

    init(uiConfig: ATCUIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let viewModel = object as? ATCOrder, let cell = cell as? ATCOrderCollectionViewCell else { return }
        cell.orderImageView.kf.setImage(with: URL(string: viewModel.imageURL))
        cell.orderImageView.layer.cornerRadius = 45.0/2.0
        cell.orderImageView.layer.borderColor = UIColor.gray.darkModed.cgColor
        cell.orderImageView.layer.borderWidth = 0.5
        cell.orderImageView.clipsToBounds = true
        cell.orderImageView.contentMode = .scaleAspectFill

        cell.orderPriceLabel.text = viewModel.price
        cell.orderPriceLabel.textColor = UIColor(hexString: (viewModel.isRefund ? "#CC3530" : "#3068CC"))
        cell.orderPriceLabel.font = uiConfig.regularMediumFont

        cell.orderTitleView.text = viewModel.productName
        cell.orderTitleView.font = uiConfig.regularMediumFont
        cell.orderTitleView.textColor = uiConfig.mainTextColor

        let separator = " \u{2022} "
        cell.orderDescriptionLabel.text = viewModel.customerName + separator + viewModel.gateway + separator + viewModel.receiptNumber + separator + TimeFormatHelper.string(for: viewModel.createdAt, format: "MMM dd")
        cell.orderDescriptionLabel.font = uiConfig.regularSmallFont
        cell.orderDescriptionLabel.textColor = uiConfig.mainSubtextColor
        cell.orderContainerView.backgroundColor = uiConfig.mainThemeBackgroundColor
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCOrderCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: ATCGenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCOrder else { return .zero }
        return CGSize(width: containerBounds.width, height: 70)
    }
}
