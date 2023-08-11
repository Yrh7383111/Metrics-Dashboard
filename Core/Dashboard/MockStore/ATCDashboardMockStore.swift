import Charts
import UIKit


class ATCDashboardMockStore {
    static let chartLineNumbers: [Double] = [30575.0, 27075.0, 30010.0, 29575.0, 32875.0, 28575.0, 32575.0]
    static let costsLineNumbers: [Double] = [2200, 2400, 2600, 2400, 2300, 2500]

    static let walkthroughs = [
        ATCWalkthroughModel(title: "Quick Overview", subtitle: "Quickly visualize important business metrics. The overview in the home tab shows the most important metrics to monitor how your business is doing in real time.", icon: "analytics-icon"),
        ATCWalkthroughModel(title: "Analytics", subtitle: "Dive deep into charts to extract valuable insights and come up with data driven product initiatives, to boost the success of your business.", icon: "bars-icon"),
        ATCWalkthroughModel(title: "Dashboard Feeds", subtitle: "View your sales feed, orders, customers, products and employees.", icon: "activity-feed-icon"),
        ATCWalkthroughModel(title: "Get Notified", subtitle: "Receive notifications when critical situations occur to stay on top of everything important.", icon: "bell-icon"),
        ]

    static let cards: [ATCTotalCard] = [
        ATCTotalCard(totalTitle: "TOTAL REVENUE", numberText: "$32,575", iconPath: "coins-icon", gradientStartColor: "#746EFF", gradientEndColor: "#D7B0FF"),
        ATCTotalCard(totalTitle: "TOTAL PROFIT", numberText: "$20,590", iconPath: "coins-icon", gradientStartColor: "#FC7F7D", gradientEndColor: "#FCC295"),
        ATCTotalCard(totalTitle: "TOTAL VIEWS", numberText: "17,105", iconPath: "binoculars-icon", gradientStartColor: "#FA79C0", gradientEndColor: "#FE9FCE"),
        ATCTotalCard(totalTitle: "TOTAL USERS", numberText: "15,200", iconPath: "coins-icon", gradientStartColor: "#FC7F7D", gradientEndColor: "#FCC295"),
        ATCTotalCard(totalTitle: "TOTAL SESSIONS", numberText: "17,505", iconPath: "binoculars-icon", gradientStartColor: "#746EFF", gradientEndColor: "#D7B0FF"),
        ATCTotalCard(totalTitle: "ITEMS SHIPPED", numberText: "120", iconPath: "shopping-cart-icon", gradientStartColor: "#FA79C0", gradientEndColor: "#FA79C0"),
    ]

    static let notifications: [ATCNotification] = [
        ATCNotification(category: "CALENDAR", content: "Your staff meeting starts in 15 minutes.", icon: "calendar-grid-icon", isNotSeen: true, createdAt: Date().twoDaysAgo),
        ATCNotification(category: "SALES", content: "An order of $120 has been placed.", icon: "coins-filled-icon", isNotSeen: true, createdAt: Date().fiveHoursAgo),
        ATCNotification(category: "RECOMMENDATIONS", content: "New recommendation for John Doe has been prepared", icon: "bubbles-icon", isNotSeen: true, createdAt: Date().yesterday),
        ATCNotification(category: "USERS", content: "A new account has been created.", icon: "customers-icon", isNotSeen: true, createdAt: Date().twoDaysAgo),
        ATCNotification(category: "MONITORING", content: "Anomaly detected! Your landing page has spiked 10% in page views in the last hour.", icon: "binoculars-icon", isNotSeen: false, createdAt: Date().threeDaysAgo),
        ATCNotification(category: "ALERTS", content: "You site has been down for 5 minutes", icon: "caret-icon", isNotSeen: false, createdAt: Date().threeDaysAgo),
        ATCNotification(category: "HR", content: "One employee went on vacation for 2 weeks.", icon: "customers-icon", isNotSeen: false, createdAt: Date().fourDaysAgo),
    ]

    static let orders: [ATCOrder] = [
        ATCOrder(price: "$149.21", receiptNumber: "#51202325", productName: "Daniel Wellington Classic", customerName: "John Doe", createdAt: Date(), gateway: "Stripe", isNew: true, isRefund: false, imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxoRCYroTrb4HVGwBGX6Z0fm06QtM8UQhHwZuBLaxiZ6dn4Xeb5Q"),
        ATCOrder(price: "$260", receiptNumber: "#645644", productName: "Skater Dress", customerName: "Adele Camp", createdAt: Date(), gateway: "Square", isNew: true, isRefund: false, imageURL: "https://cdn.tobi.com/product_images/md/1/black-ellie-off-the-shoulder-dress.jpg"),

        ATCOrder(price: "$94.54", receiptNumber: "#51202563", productName: "Woodland Shoes", customerName: "Beverly Alen", createdAt: Date().yesterday, gateway: "Paypal", isNew: true, isRefund: false, imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjO3YPLRF9P7ES9WEMH6bqbWsg-Z-exd15GVF78EoXWukyOeZ3"),
        ATCOrder(price: "$68.00", receiptNumber: "#43555", productName: "Adidas Sweatshirt", customerName: "Monica Perez", createdAt: Date().twoDaysAgo, gateway: "Stripe", isNew: true, isRefund: false, imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAAVtDaV4ABTK7oqhmw-MYHHGkrpzMN-_ziAFKtN38XxmNiOgC2A"),
        ATCOrder(price: "$149.21", receiptNumber: "#6545742", productName: "Daniel Wellington Classic", customerName: "Jack Dorsey", createdAt: Date().twoDaysAgo, gateway: "Square", isNew: true, isRefund: false, imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxoRCYroTrb4HVGwBGX6Z0fm06QtM8UQhHwZuBLaxiZ6dn4Xeb5Q"),
        ATCOrder(price: "$68.00", receiptNumber: "#4321", productName: "Adidas Sweatshirt", customerName: "Anthony Valdez", createdAt: Date().twoDaysAgo, gateway: "Braintree", isNew: true, isRefund: false, imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAAVtDaV4ABTK7oqhmw-MYHHGkrpzMN-_ziAFKtN38XxmNiOgC2A"),

        ATCOrder(price: "$94.54", receiptNumber: "#51202563", productName: "Woodland Shoes", customerName: "Cristina Stone", createdAt: Date().threeDaysAgo, gateway: "Paypal", isNew: true, isRefund: false, imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjO3YPLRF9P7ES9WEMH6bqbWsg-Z-exd15GVF78EoXWukyOeZ3"),
        ATCOrder(price: "$199.99", receiptNumber: "#6547", productName: "Skagen Leather Folder", customerName: "Michelle Fernandez", createdAt: Date().threeDaysAgo, gateway: "Stripe", isNew: true, isRefund: true, imageURL: "https://i.pinimg.com/736x/56/5d/bc/565dbc06ed05f29c7e6ad990be6b94a1--skagen-handmade-leather.jpg"),
        ATCOrder(price: "$260", receiptNumber: "#4562344", productName: "Skater Dress", customerName: "Diana Chow", createdAt: Date().fourDaysAgo, gateway: "Stripe", isNew: true, isRefund: false, imageURL: "https://cdn.tobi.com/product_images/md/1/black-ellie-off-the-shoulder-dress.jpg"),
        ATCOrder(price: "$45.56", receiptNumber: "#3464898", productName: "Daniel Wellington Classic", customerName: "Biz Stone", createdAt: Date().fiveHoursAgo, gateway: "Square", isNew: true, isRefund: false, imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxoRCYroTrb4HVGwBGX6Z0fm06QtM8UQhHwZuBLaxiZ6dn4Xeb5Q"),

        ]

    static let categories: [ATCDashboardCategory] = [
        ATCDashboardCategory(name: "Analytics", iconName: "analytics-icon", colorString: "#5E9AFC"),
        ATCDashboardCategory(name: "Customers", iconName: "customers-icon", colorString: "#FF9500"),
        ATCDashboardCategory(name: "Orders", iconName: "orders-icon", colorString: "#e293d9"),
        ATCDashboardCategory(name: "Tasks", iconName: "task-filled-icon", colorString: "#7aba73"),
        ATCDashboardCategory(name: "Sales", iconName: "coins-filled-icon", colorString: "#f9d84f  "),
        ATCDashboardCategory(name: "Products", iconName: "products-icon", colorString: "#c47989"),
    ]

    static let feedItems: [ATCDashboardFeedItem] = [
        ATCDashboardFeedItem(title: "Order Placed", valueString: "#3214123", colorString: "#11A340", valueColor: "#b6b9bf", descriptionString: "Jul 12, 2018"),
        ATCDashboardFeedItem(title: "Payment Received", valueString: "$198.60", colorString: "#CC3530", valueColor: "#3068CC", descriptionString: "Jul 12, 2018"),
        ATCDashboardFeedItem(title: "Product Dispatched", valueString: "#3214123", colorString: "#11A340", valueColor: "#b6b9bf", descriptionString: "Stripe #543534 \u{2022} Jul 2, 2018"),
        ATCDashboardFeedItem(title: "Product Delivered", valueString: "", colorString: "#11A340", valueColor: "#b6b9bf", descriptionString: "#7632423 \u{2022} Jun 10, 2018"),
        ATCDashboardFeedItem(title: "Refund Requested", valueString: "$260", colorString: "#8D8FA3", valueColor: "#3068CC", descriptionString: "Jun 8, 2018"),
        ATCDashboardFeedItem(title: "Customer Registration", valueString: "", colorString: "#11A340", valueColor: "#b6b9bf", descriptionString: "#7632423 \u{2022} Jun 6, 2018"),
        ATCDashboardFeedItem(title: "Shipping Information", valueString: "#3214123", colorString: "#11A340", valueColor: "#b6b9bf", descriptionString: "FedEx Express \u{2022} Jun 4, 2018"),
        ATCDashboardFeedItem(title: "Payment Received", valueString: "$260", colorString: "#CC3530", valueColor: "#3068CC", descriptionString: "Apr 22, 2018"),
        ATCDashboardFeedItem(title: "Refund Processed", valueString: "$142", colorString: "#8D8FA3", valueColor: "#3068CC", descriptionString: "Mar 14, 2018"),
        ATCDashboardFeedItem(title: "Order Returned", valueString: "", colorString: "#CC3530", valueColor: "#3068CC", descriptionString: "#324d23 \u{2022} Apr 21, 2018"),
        ]

    static let pieChart = ATCPieChart(entries: [PieChartDataEntry(value: 14120, label: "Apr"),
                                                PieChartDataEntry(value: 12485, label: "Mar"),
                                                PieChartDataEntry(value: 8430.98, label: "Feb"),
                                                PieChartDataEntry(value: 7400, label: "Jan"),
                                                ],
                                      name: "Profit Breakdown",
                                      format: "$%.00f",
                                      descriptionText: "Monthly Profit")

    static let barChart = ATCBarChart(groups: [ATCBarChartGroup(numbers: [4000, 5500, 7400, 6500], name: "United States"),
                                              ATCBarChartGroup(numbers: [4000, 5000, 6000, 5500], name: "United Kingdom"),
                                              ATCBarChartGroup(numbers: [4400, 4900, 5500, 7200], name: "India")],
                                      name: "Revenue by Country",
                                      labels: ["Q4 17", "Q1", "Q2", "Q3"],
                                      valueFormat: "$%.00f")

    static let acquisitionChart = ATCPieChart(entries: [
        PieChartDataEntry(value: 35, label: "Affiliates"),
        PieChartDataEntry(value: 19, label: "Referral"),
        PieChartDataEntry(value: 30, label: "SEO"),
        PieChartDataEntry(value: 18, label: "Direct"),
        ],
                                              name: "Acquisition",
                                              format: "%.00f%%",
                                              descriptionText: "Acquisition")

    static let customers: [ATCDashboardItem] = [
        ATCDashboardItem(id: "1", title: "John Doe", valueString: "Created Jul 12", valueColor: "#b6b9bf", descriptionString: "iPhone \u{2022} Total Spend $257", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-afx1H8pcNbGNcVGugr5mzqJS2i2oYovCBEeYIa2eCxoCYr3N", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "12", title: "Beverly Alen", valueString: "Created Apr 2", valueColor: "#b6b9bf", descriptionString: "Android \u{2022} Total Spend $230.98", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTktDE0kpOtfeKIrgUVeKaELaZbXTC45nmNkGxlmpETqC3kEADu", properties: [
            ATCDashboardProperty(name: "Name", value: "Beverly Alen"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "431", title: "Michelle Fernandez", valueString: "Created May 27", valueColor: "#b6b9bf", descriptionString: "Web \u{2022} Total Spend $4534.45", imageURL: "https://pbs.twimg.com/profile_images/3028932295/9b0b59b9d0d47ba7e41ec7eb87155d6c.jpeg", properties: [
            ATCDashboardProperty(name: "Name", value: "Michelle Fernandez"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "65", title: "Anthony Valdez", valueString: "Created May 25", valueColor: "#b6b9bf", descriptionString: "iPhone \u{2022} Total Spend $724", imageURL: "https://movement.com/wp-content/uploads/2014/07/Anthony-Valdez_web.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "Anthony Valdez"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "14", title: "Diana Chow", valueString: "Created May 21", valueColor: "#b6b9bf", descriptionString: "iPad \u{2022} Total Spend $150.90", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRWSUVyev6gNUMSmQcP6QUJvZBNgGV5nVwwnSf6VeIJHOse55j9", properties: [
            ATCDashboardProperty(name: "Name", value: "Anthony Valdez"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "345", title: "Monica Wang", valueString: "Created Apr 25", valueColor: "#b6b9bf", descriptionString: "Samsung \u{2022} Total Spend $59", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSN9mE0b53EK2wSjcDYuuEUv9ZLZdqIY42Jf4L_YJ_zou6bcf6r", properties: [
            ATCDashboardProperty(name: "Name", value: "Anthony Valdez"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "1298", title: "Anthony Smith", valueString: "Created Apr 16", valueColor: "#b6b9bf", descriptionString: "iPhone \u{2022} Total Spend $540", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRS7qd3UBf8CM5xaoqjWw8BsFJUasS4npAM3-t1rZ2rAEIFuHGs4A", properties: [
            ATCDashboardProperty(name: "Name", value: "Anthony Valdez"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "45", title: "Gregoire Doe", valueString: "Created Apr 4", valueColor: "#b6b9bf", descriptionString: "iPhone \u{2022} Total Spend $120", imageURL: "https://pixel.nymag.com/imgs/daily/selectall/2017/05/16/16-biz-stone.w710.h473.2x.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "Anthony Valdez"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "665", title: "Jack Dorsey", valueString: "Created Mar 15", valueColor: "#b6b9bf", descriptionString: "iPhone \u{2022} Total Spend $980", imageURL: "https://fs.bitcoinmagazine.com/img/images/jack_dorsey.original.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "Jack Dorsey"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
    ]

    static let products: [ATCDashboardItem] = [
        ATCDashboardItem(id: "6451", title: "Zapatos shows", valueString: "Created Jul 12", valueColor: "#b6b9bf", descriptionString: "The Black 9 Shoes look like b-ball sneaks", imageURL: "https://images-na.ssl-images-amazon.com/images/I/513GzPo2ahL._UY500_.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "436451", title: "Adidas Sweatshirt", valueString: "Published Aug 1", valueColor: "#b6b9bf", descriptionString: "Take it back to classics with help from the adidas 3-Stripes Black Ringer T-Shirt. This go-to tee has a crew neck, an adidas Trefoil logo at the left chest, and the brand's iconic 3-Stripes detailing on the sleeves.", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAAVtDaV4ABTK7oqhmw-MYHHGkrpzMN-_ziAFKtN38XxmNiOgC2A", properties: [
            ATCDashboardProperty(name: "Name", value: "Adidas Sweatshirt"),
            ATCDashboardProperty(name: "Items Sold", value: "432 items"),
            ATCDashboardProperty(name: "Tags", value: "sports, running, discount"),
            ATCDashboardProperty(name: "Categories", value: "Clothes, Sport"),
            ATCDashboardProperty(name: "Price", value: "$169.00"),
            ATCDashboardProperty(name: "SKU", value: ""),
            ATCDashboardProperty(name: "Tax Status", value: "taxable"),
            ATCDashboardProperty(name: "Tax Class", value: "2"),
            ]),
        ATCDashboardItem(id: "871", title: "Daniel Wellington Classic", valueString: "Created Jul 12", valueColor: "#b6b9bf", descriptionString: "Adidas Trefoil logo", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxoRCYroTrb4HVGwBGX6Z0fm06QtM8UQhHwZuBLaxiZ6dn4Xeb5Q", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "1652", title: "Woodland Shoes", valueString: "Created Apr 2", valueColor: "#b6b9bf", descriptionString: "Best seller", imageURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjO3YPLRF9P7ES9WEMH6bqbWsg-Z-exd15GVF78EoXWukyOeZ3", properties: [
            ATCDashboardProperty(name: "Name", value: "Beverly Alen"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Jul 12, 2018"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "1432", title: "Skater Dress", valueString: "Created Jan 13", valueColor: "#b6b9bf", descriptionString: "Off Shoulder Dress", imageURL: "https://cdn.tobi.com/product_images/md/1/black-ellie-off-the-shoulder-dress.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Oct 8, 2017"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "123", title: "Leatherette Sandals", valueString: "Created Jan 12", valueColor: "#b6b9bf", descriptionString: "Latin Dance Shoes", imageURL: "https://cdn-4.jjshouse.com/upimg/jjshouse/o400/10/a6/a71f77ecc27365539892d6c1818810a6.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Oct 8, 2017"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "543", title: "Nudist Sandals", valueString: "Created Jan 11", valueColor: "#b6b9bf", descriptionString: "Our signature stilettos", imageURL: "https://www.stuartweitzman.com/assets/item/zoom/nudist_blasue_12.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Oct 8, 2017"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "4", title: "Single Taken Tank", valueString: "Created Dec 13", valueColor: "#b6b9bf", descriptionString: "Dismantling all heteronormativity", imageURL: "https://image.spreadshirtmedia.com/image-server/v1/mp/products/T917A231MPA1903PT17X0Y36D1014299318S52/views/1,width=378,height=378,appearanceId=231,backgroundColor=E8E8E8,modelId=416,crop=list,version=1529309188/single-taken-vegan-womens-premium-tank-top.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Oct 8, 2017"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ATCDashboardItem(id: "54", title: "Casual Scoop Collar", valueString: "Created Dec 2", valueColor: "#b6b9bf", descriptionString: "A-Line Mini Scoop Neck Summer", imageURL: "https://assets.yandycdn.com/Products/IL_7802_back_PS05192017_yandy-panty-lingerie.jpg", properties: [
            ATCDashboardProperty(name: "Name", value: "John Doe"),
            ATCDashboardProperty(name: "Email", value: "jdoe@gmail.com"),
            ATCDashboardProperty(name: "Account Created", value: "Oct 8, 2017"),
            ATCDashboardProperty(name: "Total Spend", value: "$259"),
            ATCDashboardProperty(name: "Total Orders", value: "2"),
            ]),
        ]

    static let tasks: [ATCDashboardItem] = [
        ATCDashboardItem(id: "18346", title: "Launch iPhone app for Dashboard", valueString: "In Progress", valueColor: "#b6b9bf", descriptionString: "Due Date: Aug 29", imageURL: "https://www.iosapptemplates.com/wp-content/uploads/2018/08/task-blue.png", properties: [
            ATCDashboardProperty(name: "Title", value: "Launch iPhone app for Dashboard"),
            ATCDashboardProperty(name: "Status", value: "In Progress"),
            ATCDashboardProperty(name: "Creation Date", value: "Aug 14, 2018"),
            ATCDashboardProperty(name: "Priority", value: "High"),
            ATCDashboardProperty(name: "Difficulty", value: "2"),
            ATCDashboardProperty(name: "Due Date", value: "Jul 29, 2018"),
            ]),
        ATCDashboardItem(id: "185346", title: "Publish new product page", valueString: "Done", valueColor: "#2ab258", descriptionString: "Due Date: Jul 23", imageURL: "https://www.iosapptemplates.com/wp-content/uploads/2018/08/task-green.png", properties: [
            ATCDashboardProperty(name: "Title", value: "Publish new product page"),
            ATCDashboardProperty(name: "Status", value: "Done"),
            ATCDashboardProperty(name: "Creation Date", value: "Jul 15, 2018"),
            ATCDashboardProperty(name: "Priority", value: "High"),
            ATCDashboardProperty(name: "Difficulty", value: "2"),
            ATCDashboardProperty(name: "Due Date", value: "Jul 29, 2018"),
            ]),
        ATCDashboardItem(id: "4186", title: "Redesign landing screen", valueString: "Not Started", valueColor: "#F4771E", descriptionString: "Due Date: Jul 29", imageURL: "https://www.iosapptemplates.com/wp-content/uploads/2018/08/task-orange.png", properties: [
            ATCDashboardProperty(name: "Title", value: "Redesign landing screen"),
            ATCDashboardProperty(name: "Status", value: "Done"),
            ATCDashboardProperty(name: "Creation Date", value: "Jul 15, 2018"),
            ATCDashboardProperty(name: "Priority", value: "High"),
            ATCDashboardProperty(name: "Difficulty", value: "2"),
            ATCDashboardProperty(name: "Due Date", value: "Jul 29, 2018"),
            ]),
        ATCDashboardItem(id: "18346", title: "Create product category for baby products", valueString: "Not Started", valueColor: "#F4771E", descriptionString: "Due Date: Oct 20", imageURL: "https://www.iosapptemplates.com/wp-content/uploads/2018/08/task-orange.png", properties: [
            ATCDashboardProperty(name: "Title", value: "Create job posting for content writer"),
            ATCDashboardProperty(name: "Status", value: "Done"),
            ATCDashboardProperty(name: "Creation Date", value: "Jul 15, 2018"),
            ATCDashboardProperty(name: "Priority", value: "High"),
            ATCDashboardProperty(name: "Difficulty", value: "2"),
            ATCDashboardProperty(name: "Due Date", value: "Jul 29, 2018"),
            ]),
        ATCDashboardItem(id: "186546", title: "Write blog post about new product", valueString: "Done", valueColor: "#2ab258", descriptionString: "Due Date: Jul 29", imageURL: "https://www.iosapptemplates.com/wp-content/uploads/2018/08/task-green.png", properties: [
            ATCDashboardProperty(name: "Title", value: "Create job posting for content writer"),
            ATCDashboardProperty(name: "Status", value: "Done"),
            ATCDashboardProperty(name: "Creation Date", value: "Jul 15, 2018"),
            ATCDashboardProperty(name: "Priority", value: "High"),
            ATCDashboardProperty(name: "Difficulty", value: "2"),
            ATCDashboardProperty(name: "Due Date", value: "Jul 29, 2018"),
            ]),
        ATCDashboardItem(id: "186", title: "Job posting for content writer", valueString: "Done", valueColor: "#2ab258", descriptionString: "Due Date: Jul 13", imageURL: "https://www.iosapptemplates.com/wp-content/uploads/2018/08/task-blue.png", properties: [
            ATCDashboardProperty(name: "Title", value: "Create job posting for content writer"),
            ATCDashboardProperty(name: "Status", value: "Done"),
            ATCDashboardProperty(name: "Creation Date", value: "Jul 11, 2018"),
            ATCDashboardProperty(name: "Priority", value: "High"),
            ATCDashboardProperty(name: "Difficulty", value: "2"),
            ATCDashboardProperty(name: "Due Date", value: "Jul 13, 2018"),
            ]),
        ]
}
