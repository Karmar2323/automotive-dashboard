
#include "backend.h"

Backend::Backend(QObject *parent)
    : QObject{parent}
{

    m_speedTimer.setInterval(5);
    connect(&m_speedTimer, &QTimer::timeout, this, &Backend::simulateSpeed);

    m_fuelTimer.setInterval(50);
    connect(&m_fuelTimer, &QTimer::timeout, this, &Backend::simulateFuel);

}

void Backend::startSpeed()
{
    //Backend.startSpeed() // Backend version
    if (speedOn) {
        stopSpeedTimer();
    } else {
        startSpeedTimer();
    }
    speedOn = !speedOn;

}

void Backend::startBlinking(int blinker)
{
    //Left, Right, All
    switch (blinker) {
    case Left:
        if (m_turnLeftOn && m_turnRightOn) {
            return;
        }
        setTurnLeftOn(!m_turnLeftOn);
        qDebug() << "m_turnLeftOn" << m_turnLeftOn;
        break;
    case Right:
        //m_turnRightOn = !m_turnRightOn;
        if (m_turnLeftOn && m_turnRightOn) {
            return;
        }
        setTurnRightOn(!m_turnRightOn);
        qDebug() << "m_turnRightOn: " << m_turnRightOn;

        break;
    case All:
        if (!m_turnLeftOn || !m_turnRightOn) {
            setTurnRightOn(true);
            setTurnLeftOn(true);
            qDebug() << "All blink ON";
        }
        else {
            setTurnRightOn(false);
            setTurnLeftOn(false);
            qDebug() << "All blink OFF";
        }
        break;

    default:
        qDebug() << "blinker: " << blinker;
    }

}

void Backend::setSpeed(int newSpeed)
{
    m_speed = newSpeed;
}

void Backend::simulateSpeed()
{
    int speed = m_speed;
    int speedMax = 240, speedMin = 0;

    if (speed >= speedMin && speed < speedMax) {
        speed += 1;

    }else {
        speed = speedMin;
    }
    setSpeed(speed);
    //qDebug() << "m_speed" << m_speed;

    emit speedChanged();

}

void Backend::startSpeedTimer()
{
    m_speedTimer.start();
    qDebug() << "Backend: Speed simulation";
}

void Backend::stopSpeedTimer()
{
    if (m_speedTimer.isActive()){
        m_speedTimer.stop();
    } else
        return;
}



int Backend::speed() const
{
    return m_speed;
}


bool Backend::parkingBrakeOn() const
{
    return m_parkingBrakeOn;
}

void Backend::setParkingBrakeOn(bool newParkingBrakeOn)
{
    if (m_parkingBrakeOn == newParkingBrakeOn)
        return;
    m_parkingBrakeOn = newParkingBrakeOn;
    emit parkingBrakeOnChanged();
}

bool Backend::turnRightOn() const
{
    return m_turnRightOn;
}

void Backend::setTurnRightOn(bool newTurnRightOn)
{
    if (m_turnRightOn == newTurnRightOn)
        return;
    m_turnRightOn = newTurnRightOn;
    emit turnRightOnChanged();
}

bool Backend::turnLeftOn() const
{
    return m_turnLeftOn;
}

void Backend::setTurnLeftOn(bool newTurnLeftOn)
{
    if (m_turnLeftOn == newTurnLeftOn)
        return;
    m_turnLeftOn = newTurnLeftOn;
    emit turnLeftOnChanged();
}


const QList<float> &Backend::carPosition() const
{
    return m_carPosition;
}

void Backend::setCarPosition(const QList<float> &newCarPosition)
{
    if (m_carPosition == newCarPosition)
        return;
    m_carPosition = newCarPosition;
    emit carPositionChanged();
}

int Backend::fuel() const
{
    return m_fuel;
}

void Backend::setFuel(int newFuel)
{
    if (m_fuel == newFuel)
        return;
    m_fuel = newFuel;
    emit fuelChanged();
}


void Backend::simulateFuel() {
    int fuelMax = 94, fuelMin = 2;
    int fuelLevel = m_fuel;

    if (fuelLevel < fuelMin) {
        fuelLevel = fuelMax;
    } else {
        fuelLevel -= 1;
    }
    setFuel(fuelLevel);
}

void Backend::startFuel()
{
    if (m_fuelTimer.isActive()) {
        m_fuelTimer.stop();
        //        qDebug() << "Fuel OFF";
    } else {
        m_fuelTimer.start();
        //        qDebug() << "Fuel ON";
    }

}
