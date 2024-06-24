//
//  GeneralCollectionViewCell.swift
//  NewsApp
//
//  Created by Maksims Šalajevs on 09/06/2024.
//

import UIKit
import SnapKit

final class GeneralCollectionViewCell: UICollectionViewCell {
    
    /// создадим айди ячейки тут, что бы в местах ее имплементации не ошибиться в написании
    static let reuseID = "GeneralCollectionViewCell"

    //MARK: - GUI Variables

    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        /// Не позволяет картинке изменить свои пропорции (почитай про другие модификаторы, какие есть, как влияют)
        view.contentMode = .scaleAspectFill
        /// Обрежет картинку по краям контейнера
        view.clipsToBounds = true
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        /// Это свойство снимает ограничение на количество строк текста
        label.numberOfLines = 0
        /// Добавим бэкграунд лейблу, тогда мы можем избавиться от "blackView"
        label.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        label.textColor = .white
        return label
    }()

    //MARK: - Initializations

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

    func set(article: ArticleDTO) {
        titleLabel.text = article.title
        /// Старайся использовать guard
        guard let data = article.imageData,
              let image = UIImage(data: data) else {
            imageView.image = UIImage(named: "Image")
            return
        }
        imageView.image = image
    }

    //MARK: - Private methods

    private func setupUI() {
        [imageView, titleLabel].forEach { addSubview($0) }
        setupConstraints()
    }

    private func setupConstraints() {
        imageView.snp.makeConstraints { $0.size.edges.equalToSuperview() }
        titleLabel.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
