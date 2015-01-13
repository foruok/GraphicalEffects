import QtQuick 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.2

Rectangle {
    anchors.fill: parent;
    Image {
        id: opImage;
        x: 20;
        y: 20;
        width: 220;
        height: 220;
        source: "bug.jpg";
        sourceSize: Qt.size(240, 240);
        smooth: true;
        visible: false;
    }

    Text {
        id: progressLabel;
        anchors.bottom: parent.bottom;
        anchors.left: parent.left;
        anchors.margins: 4;
        text: "Blur Progress:";
    }

    ProgressBar {
        anchors.bottom: progressLabel.bottom;
        anchors.left: progressLabel.right;
        anchors.leftMargin: 2;
        height: 20;
        width: 150;
        value: recursive.progress;
    }

    RecursiveBlur {
        id: recursive;
        anchors.fill: opImage;
        source: opImage;
        radius: 7.5;
        loops: 4;
    }

    Rectangle {
        anchors.left: opImage.right;
        anchors.leftMargin: 40;
        anchors.top: opImage.top;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;
        anchors.margins: 2;
        color: "lightsteelblue";

        CheckBox {
            id: transparentBorder;
            anchors.top: parent.top;
            anchors.topMargin: 4;
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            checked: true;
            text: "transparentBorder";
        }

        Text {
            id: radiusLabel;
            anchors.left: transparentBorder.left;
            anchors.top: transparentBorder.bottom;
            anchors.topMargin: 8;
            text: "radius:";
        }

        Rectangle {
            id: radiusArea;
            anchors.left: radiusLabel.right;
            anchors.leftMargin: 4;
            anchors.top: radiusLabel.top;
            height: 30;
            width: 160;
            color: "lightgray";
            border.width: 1;
            border.color: "darkgray";
            TextInput {
                anchors.fill: parent;
                anchors.margins: 2;
                id: radiusEdit;
                font.pointSize: 18;
                text: "7.5";
                validator: DoubleValidator{bottom: 0;}
            }
        }

        Text {
            id: loopsLabel;
            anchors.left: transparentBorder.left;
            anchors.top: radiusArea.bottom;
            anchors.topMargin: 8;
            text: "loops:";
        }

        Rectangle {
            id: loopsArea;
            anchors.left: loopsLabel.right;
            anchors.leftMargin: 4;
            anchors.top: loopsLabel.top;
            height: 30;
            width: 160;
            color: "lightgray";
            border.width: 1;
            border.color: "darkgray";
            TextInput {
                anchors.fill: parent;
                anchors.margins: 2;
                id: loopsEdit;
                font.pointSize: 18;
                text: "4.0";
                validator: DoubleValidator{bottom: 0;}
            }
        }

        Button {
            id: applyBtn;
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            anchors.top: loopsArea.bottom;
            anchors.topMargin: 12;
            text: "Apply";
            onClicked: {
                recursive.transparentBorder = transparentBorder.checked;
                recursive.radius = parseFloat(radiusEdit.text);
                recursive.loops = loopsEdit.text;
            }
        }
    }
}
