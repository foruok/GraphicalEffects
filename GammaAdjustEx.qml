import QtQuick 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.2

Rectangle {
    anchors.fill: parent;
    Image {
        id: opImage;
        x: 4;
        y: 4;
        width: 250;
        height: 250;
        source: "bug.jpg";
        sourceSize: Qt.size(250, 250);
        smooth: true;
        visible: false;
    }

    GammaAdjust {
        anchors.fill: opImage;
        source: opImage;
        gamma: gslider.value;
    }
    Text {
        id: glabel;
        text: "gamma:";
        anchors.left: opImage.left;
        anchors.top: opImage.bottom;
        anchors.margins: 4;
    }

    Slider {
        id: gslider;
        anchors.left: glabel.right;
        anchors.leftMargin: 8;
        anchors.verticalCenter: glabel.verticalCenter;
        width: 220;
        height: 40;
        maximumValue: 10.0;
        value: 0.5;
    }
}
