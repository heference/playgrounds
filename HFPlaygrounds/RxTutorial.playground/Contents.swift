import Foundation
import RxSwift
import RxCocoa

let disposeBag = DisposeBag()

Observable.of("1", "2", "3")
    .map({
        "\($0)A"
    })
    .subscribe(onNext: {
        print("\($0)")
    })
    .disposed(by: disposeBag)
