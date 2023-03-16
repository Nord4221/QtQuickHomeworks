#ifndef PROPERTIESHANDLER_H
#define PROPERTIESHANDLER_H

#include <QObject>
#include <QString>
#include <QColor>
#include <QVector>




class PropertiesHandler : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QColor propertyColor READ getPropertyColor WRITE setPropertyColor)
    Q_PROPERTY(QString propertyName READ getPropertyName WRITE setPropertyName NOTIFY propertyNameChanged)
    Q_PROPERTY(QVector<double> propertyValuesX READ getPropertyValuesX)
    Q_PROPERTY(QVector<double> propertyValuesY READ getPropertyValuesY NOTIFY propertyValuesYChanged)
    Q_PROPERTY(GraphType propertyGraphType READ getPropertyGraphType WRITE setPropertyGraphType NOTIFY propertyGraphTypeChanged)

public:
    enum class GraphType
    {
        GRAPH_SIN,
        GRAPH_LIN,
        GRAPH_MOD,
        GRAPH_POW,
        GRAPH_LOG
    };
    Q_ENUMS(GraphType)

    explicit PropertiesHandler(QObject *parent = nullptr);
    QColor getPropertyColor() const { return propertyColor; }
    QString getPropertyName()  const { return propertyName; }
    QVector<double> getPropertyValuesX() const { return propertyValuesX; }
    QVector<double> getPropertyValuesY() const { return propertyValuesY; }
    GraphType getPropertyGraphType() const { return propertyGraphType; }

    void setPropertyColor(const QColor &newColor) { propertyColor = newColor; }
    void setPropertyName(const QString &newName) { propertyName = newName; }
    void setPropertyGraphType(const GraphType &newType);
signals:
    Q_SIGNAL void propertyGraphTypeChanged(const GraphType newType);
    Q_SIGNAL void propertyValuesYChanged();
    Q_SIGNAL void propertyNameChanged();
public slots:

private:
    QColor propertyColor = Qt::red;
    QString propertyName{"baseName"};
    QVector<double> propertyValuesX;
    QVector<double> propertyValuesY;
    GraphType propertyGraphType = GraphType::GRAPH_SIN;
};

#endif // PROPERTIESHANDLER_H
