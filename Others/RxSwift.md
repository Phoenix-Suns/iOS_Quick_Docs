# RxSwift

```swift
// Test FlatMap: Thành công
NetworkProvider.shared.services.getPostCategory(withPage: 1, itemsPerPage: -1).asObservable()
    .flatMap { [weak self] response -> Observable<Response<PostDetailDocs?>> in
        guard let _ = self, let data = response.data else { return Observable.empty() }
        let categories = data.docs
        DataPreferences.shared.setCategories(categories)
        return NetworkProvider.shared.services.getNewestPosts(page: 1, itemsPerPage: NUMBER_ITEMS).asObservable()
    }.subscribe(
        onNext: { [weak self] response in
            guard let self = self, let data = response.data else { return }
            self.startMainViewVC()
        }, onError: { [weak self] error in
            guard self != nil else { return }
        }, onCompleted: { [weak self] in
            guard self != nil else { return }
        }
    ).disposed(by: disposeBag)

// Test Zip: Ko thành công
private func fetchListPost(categories: [Category]) {
    var observableList: [Observable<Response<PostDetailDocs?>>] = []
    for category in categories {
        let observable = NetworkProvider.shared.services.getPosts(withCategory: category.identifier, page: 1, itemsPerPage: defaultItemsPerType).asObservable()
        observableList.append(observable)
    }


    Observable.zip(observableList).asObservable()
        .subscribe(
            onNext: { response in

                var nghia = response

                //self.startMainViewVC()
            }, onError: { error in
                print(error)
            }, onCompleted: {
            }
        ).disposed(by: disposeBag)
}
```
