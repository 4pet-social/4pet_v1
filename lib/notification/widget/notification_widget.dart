part of petisland.notification.widget;

class NotificationWidget extends StatelessWidget {
  final PetNotification item;

  const NotificationWidget({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageWidget = _buildImage(item.sender?.user?.avatar?.url);

    return Container(
      height: 85,
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.start,
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: imageWidget,
            ),
          ),
          Flexible(
            child: NotificationMessageWidget(
              message: item.message,
              createdTime: item.createAt,
            ),
            flex: 6,
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    return AspectRatio(
      aspectRatio: 1,
      child: FittedBox(child: AvatarWidget(url: url)),
    );
  }
}