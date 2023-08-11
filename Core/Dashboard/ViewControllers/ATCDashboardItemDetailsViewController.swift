import UIKit


class ATCDashboardItemDetailsViewController: ATCGenericCollectionViewController {
    static func vc(uiConfig: ATCUIGenericConfigurationProtocol,
                   item: ATCDashboardItem) -> ATCDashboardItemDetailsViewController {
        let config = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
                                                                     pullToRefreshTintColor: .white,
                                                                     collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                     collectionViewLayout: ATCLiquidCollectionViewLayout(),
                                                                     collectionPagingEnabled: false,
                                                                     hideScrollIndicators: true,
                                                                     hidesNavigationBar: false,
                                                                     headerNibName: nil,
                                                                     scrollEnabled: true,
                                                                     uiConfig: uiConfig,
                                                                     emptyViewModel: nil)
        let vc = ATCDashboardItemDetailsViewController(configuration: config)
        vc.title = item.title

        var objects: [ATCGenericBaseModel] = []
        objects.append(ATCDivider(""))
        objects.append(ATCImage(item.imageURL))
        objects.append(ATCDivider(""))
        objects.append(ATCDivider(item.title))
        objects.append(ATCText(text: item.descriptionString))
        item.properties.forEach { (property) in
            objects.append(property)
        }

        let dataSource = ATCGenericLocalHeteroDataSource(items: objects)
        vc.genericDataSource = dataSource
        vc.use(adapter: ATCDashboardItemPropertyAdapter(uiConfig: uiConfig), for: "ATCDashboardProperty")
        vc.use(adapter: ATCImageRowAdapter(cellHeight: 100, contentMode: .scaleAspectFit), for: "ATCImage")
        vc.use(adapter: ATCDividerRowAdapter(titleFont: uiConfig.regularLargeFont, minHeight: 15, titleColor: uiConfig.mainTextColor), for: "ATCDivider")
        vc.use(adapter: ATCTextRowAdapter(font: uiConfig.regularSmallFont, textColor: uiConfig.mainSubtextColor), for: "ATCText")

        return vc
    }
}
