#include "simple_table_model.h"

SimpleTableModel::SimpleTableModel(
        std::vector<QString> const& column_names,
        std::vector<std::vector<QVariant>> const& data,
        QObject* parent)
    : QAbstractTableModel{parent}
    , column_names_{column_names}
    , data_{data}
{}

int SimpleTableModel::rowCount(QModelIndex const& parent) const {
    return static_cast<int>(data_.size());
}

int SimpleTableModel::columnCount(QModelIndex const& parent) const {
    return data_.size() == 0
        ? 0
        : static_cast<int>(data_[0].size());
}

QVariant SimpleTableModel::data(QModelIndex const& index, int role) const {
    if (!index.isValid()) 
        return {};

    if (index.row() >= rowCount()) 
        return {};

    auto const& row = data_[index.row()];
    if (index.column() >= columnCount()) 
        return {};

    return row[index.column()];
}

QVariant SimpleTableModel::headerData(
        int section, Qt::Orientation orientation,
        int role) const {
    if (orientation == Qt::Horizontal) {
        if (section >= columnCount())
            return {};
        return column_names_[section];
    }
    else {
        if (section >= rowCount())
            return {};
        return QStringLiteral("Row %1").arg(section);
    }
}
