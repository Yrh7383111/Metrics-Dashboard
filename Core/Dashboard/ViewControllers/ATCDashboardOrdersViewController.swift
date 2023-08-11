import UIKit


class ATCDashboardOrdersViewController: ATCGenericCollectionViewController {
    static func ordersViewController(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCDashboardOrdersViewController {
        let layout = ATCLiquidCollectionViewLayout()
        let homeConfig = ATCGenericCollectionViewControllerConfiguration(pullToRefreshEnabled: true,
                                                                         pullToRefreshTintColor: .white,
                                                                         collectionViewBackgroundColor: uiConfig.mainThemeBackgroundColor,
                                                                         collectionViewLayout: layout,
                                                                         collectionPagingEnabled: false,
                                                                         hideScrollIndicators: true,
                                                                         hidesNavigationBar: false,
                                                                         headerNibName: nil,
                                                                         scrollEnabled: true,
                                                                         uiConfig: uiConfig,
                                                                         emptyViewModel: nil)
        let ordersVC = ATCDashboardOrdersViewController(configuration: homeConfig)
        ordersVC.title = "Orders"

        let dataSource = ATCGenericLocalHeteroDataSource(items: ATCDashboardMockStore.orders)
        ordersVC.genericDataSource = dataSource

        ordersVC.use(adapter: ATCOrderAdapter(uiConfig: uiConfig), for: "ATCOrder")

        ordersVC.selectionBlock = { (navController, object, indexPath) in
            if let item = object as? ATCDashboardItem {
                let vc = ATCDashboardItemDetailsViewController.vc(uiConfig: uiConfig, item: item)
                navController?.pushViewController(vc, animated: true)
            }
        }
        return ordersVC
    }
}
