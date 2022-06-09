#ifndef table_model_h
#define table_model_h

#include <vector>

#include "QAbstractTableModel"

class SimpleTableModel : public QAbstractTableModel {
    Q_OBJECT
  
public:
    SimpleTableModel(
            std::vector<QString> const&,
            std::vector<std::vector<QVariant>> const&,
            QObject* parent = nullptr);
  
    int rowCount(QModelIndex const& parent = QModelIndex()) const override;
    int columnCount(QModelIndex const& parent = QModelIndex()) const override;
  
    QVariant data(QModelIndex const&, int role) const override;
  
    QVariant headerData(
            int section, Qt::Orientation orientation,
            int role = Qt::DisplayRole) const override;
private:
    std::vector<QString> column_names_;
    std::vector<std::vector<QVariant>> data_;
};

#endif
