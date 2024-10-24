class NotificationModel {
  final String message;

  NotificationModel({required this.message});
}

class NotificationManager {
  final List<NotificationModel> _notifications = [
    NotificationModel(message: "H&M End of Season Sale discounts from 50% to 70%"),
    NotificationModel(message: "Get free coupons worth Rs. 2000 on purchase of Rs. 3500"),
    NotificationModel(message: "Zudio end of the year sale, discounts up to 50%"),
    NotificationModel(message: "Get 10% off on your first purchase"),
    NotificationModel(message: "Get 20% off on your second purchase"),
  ];

  List<NotificationModel> get notifications => List.unmodifiable(_notifications);

  void addNotification(String message) {
    _notifications.add(NotificationModel(message: message));
  }

  void removeNotification(int index) {
    _notifications.removeAt(index);
  }
}