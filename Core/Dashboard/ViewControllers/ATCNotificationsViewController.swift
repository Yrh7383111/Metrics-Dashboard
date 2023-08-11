import UIKit


class ATCNotificationsViewController: ATCGenericCollectionViewController {
    static func notificationsViewController(uiConfig: ATCUIGenericConfigurationProtocol) -> ATCNotificationsViewController {
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
        let notificationsVC = ATCNotificationsViewController(configuration: homeConfig)
        notificationsVC.title = "Notifications"

        let dataSource = ATCGenericLocalHeteroDataSource(items: ATCDashboardMockStore.notifications)
        notificationsVC.genericDataSource = dataSource

        notificationsVC.use(adapter: ATCNotificationAdapter(uiConfig: uiConfig), for: "ATCNotification")

        return notificationsVC
    }
}
