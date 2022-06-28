#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QTimer>
#include <QQmlEngine>
#include <QList>


class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int speed READ speed WRITE setSpeed NOTIFY speedChanged)
    Q_PROPERTY(bool parkingBrakeOn READ parkingBrakeOn WRITE setParkingBrakeOn NOTIFY parkingBrakeOnChanged)
    Q_PROPERTY(bool turnRightOn READ turnRightOn WRITE setTurnRightOn NOTIFY turnRightOnChanged)
    Q_PROPERTY(bool turnLeftOn READ turnLeftOn WRITE setTurnLeftOn NOTIFY turnLeftOnChanged)
    Q_PROPERTY(QList<float> carPosition READ carPosition WRITE setCarPosition NOTIFY carPositionChanged)
    Q_PROPERTY(int fuel READ fuel WRITE setFuel NOTIFY fuelChanged)
    QML_ELEMENT
    QML_SINGLETON


public:
    explicit Backend(QObject *parent = nullptr);

    Q_INVOKABLE void startSpeed();
    Q_INVOKABLE void startBlinking(int blinker); //
    Q_INVOKABLE void startFuel();

    void startSpeedTimer();
    void stopSpeedTimer();


    bool parkingBrakeOn() const;
    void setParkingBrakeOn(bool newParkingBrakeOn);

    enum TurnBlinker { Left, Right, All };
    Q_ENUM(TurnBlinker);


    bool turnRightOn() const;
    void setTurnRightOn(bool newTurnRightOn);

    bool turnLeftOn() const;
    void setTurnLeftOn(bool newTurnLeftOn);

    void setTurnLeftOff(bool newTurnLeftOff);


    const QList<float> &carPosition() const;
    void setCarPosition(const QList<float> &newCarPosition);

    int fuel() const;
    void setFuel(int newFuel);

private:

    void setSpeed(int newSpeed);
    void simulateSpeed();
    void simulateFuel();

    int speed() const;
    bool speedOn = false; //replace window.speedStop


    int m_speed = 0;
    QTimer m_speedTimer;


    bool m_parkingBrakeOn = false;

    bool m_turnRightOn = false;

    bool m_turnLeftOn = false;



    QList<float> m_carPosition = {50.14, 0.25};

    QTimer m_fuelTimer;

    int m_fuel = 2;

signals:

    void speedChanged();
    void parkingBrakeOnChanged();
    void turnRightOnChanged();
    void turnLeftOnChanged();

    void carPositionChanged();
    void fuelChanged();
};

#endif // BACKEND_H
