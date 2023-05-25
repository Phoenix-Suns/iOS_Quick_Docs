# Phân biệt các State

- **@State** kiểu dữ liệu đơn giản, thuộc về một view duy nhất, nên được khai báo private
- **@ObservedObject** cho kiểu dữ liệu phức tạp (Object, lưu trữ State), chia sẻ được cho nhiều Views.
- **@EnviromentObject** tạo ở một nơi nào đó trong App, truy xuất ở mọi nơi
- **@Binding** Tạo ở 1 View, chia sẽ View khác