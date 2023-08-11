import UIKit


class ATCDashboardFeedViewController: ATCGenericCollectionViewController {
    static func feedViewController(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCDashboardFeedViewController {
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
        let feedVC = ATCDashboardFeedViewController(configuration: homeConfig)
        feedVC.title = "Activity Feed"

        let dataSource = ATCGenericLocalHeteroDataSource(items: ATCDashboardMockStore.feedItems)
        feedVC.genericDataSource = dataSource
        feedVC.use(adapter: ATCDashboardFeedItemAdapter(uiConfig: uiConfig), for: "ATCDashboardFeedItem")

        return feedVC
    }
}
