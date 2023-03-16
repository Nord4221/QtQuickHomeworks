#include "PropertiesHandler.h"
#include <QtMath>
#include <QDebug>
PropertiesHandler::PropertiesHandler(QObject *parent) : QObject(parent)
{

}

void PropertiesHandler::setPropertyGraphType(const GraphType& newType)
{
    propertyValuesX.clear();
    double currentValue = 0.0;
    for (int i = 0; i < 50; i++)
    {
        propertyValuesX.append(currentValue);
        currentValue += 0.1;
    }
    for (int i = 0; i < 50; i++)
    {
         qDebug() <<propertyValuesX.at(i);
    }
    propertyValuesY.clear();
    if(newType == GraphType::GRAPH_LIN)
    {
        for (int i = 0; i < 50; i++)
            propertyValuesY.append(propertyValuesX);
    }
    else if(newType == GraphType::GRAPH_SIN)
    {
        for (int i = 0; i < 50; i++)
            propertyValuesY.append(qSin(propertyValuesX.at(i)));
    }
    else if(newType == GraphType::GRAPH_MOD)
    {
        for (int i = 0; i < 50; i++)
            propertyValuesY.append(qSqrt(qPow(propertyValuesX.at(i) - 2.5, 2)));
    }
    else if(newType == GraphType::GRAPH_POW)
    {
        for (int i = 0; i < 50; i++)
            propertyValuesY.append(qPow(propertyValuesX.at(i), 2));
    }
    else if(newType == GraphType::GRAPH_LOG)
    {
        for (int i = 0; i < 50; i++)
            propertyValuesY.append(qLn(propertyValuesX.at(i))/qLn(2));
    }


    emit propertyValuesYChanged();
}
