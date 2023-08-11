import ChameleonFramework
import UIKit


protocol ATCTotalCardCollectionViewCellDisplayable {
    var totalTitleLabel: UILabel! {get set}
    var totalNumberLabel: UILabel! {get set}
    var cardImageView: UIImageView! {get set}
    var cardContainerView: UIView! {get set}
}

class ATCTotalCardAdapter: ATCGenericCollectionRowAdapter {
    let uiConfig: ATCUIGenericConfigurationProtocol

    init(uiConfig: ATCUIGenericConfigurationProtocol) {
        self.uiConfig = uiConfig
    }

    func configure(cell: UICollectionViewCell, with object: ATCGenericBaseModel) {
        guard let viewModel = object as? ATCTotalCard, let cell = cell as? ATCTotalCardCollectionViewCellDisplayable else { return }
        cell.cardImageView.image = UIImage.localImage(viewModel.iconPath, template: true)
        cell.cardImageView.tintColor = UIColor(hexString: "#FDE2DF").darkModed
        cell.cardImageView.contentMode = .scaleAspectFill
        cell.cardImageView.isHidden = true

        cell.totalNumberLabel.text = viewModel.numberText
        cell.totalNumberLabel.textColor = UIColor(hexString: "#2662A4")
        cell.totalNumberLabel.font = uiConfig.boldLargeFont

        cell.totalTitleLabel.text = viewModel.totalTitle
        cell.totalTitleLabel.textColor = uiConfig.mainSubtextColor
        cell.totalTitleLabel.font = uiConfig.regularMediumFont

//        let startColor = UIColor(hexString: viewModel.gradientStartColor)
//        let endColor = UIColor(hexString: viewModel.gradientEndColor)
//        cell.cardContainerView.backgroundColor = UIColor.init(gradientStyle: .leftToRight, withFrame: cell.cardContainerView.bounds, andColors: [startColor, endColor])
        cell.cardContainerView.backgroundColor = uiConfig.mainThemeBackgroundColor
        cell.cardContainerView.clipsToBounds = true
        cell.cardContainerView.layer.cornerRadius = 10
        cell.cardContainerView.dropShadow()
    }

    func cellClass() -> UICollectionViewCell.Type {
        return ATCTotalCardCollectionViewCell.self
    }

    func size(containerBounds: CGRect, object: ATCGenericBaseModel) -> CGSize {
        guard let viewModel = object as? ATCTotalCard else { return .zero }
        return CGSize(width: 140, height: 90)
    }
}
