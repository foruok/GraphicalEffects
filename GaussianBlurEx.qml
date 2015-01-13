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

    GaussianBlur {
        id: gaussian;
        anchors.fill: opImage;
        source: opImage;
        samples: 8;
        radius: 5;
        deviation: 4;
    }

    Rectangle {
        anchors.left: opImage.right;
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
                text: "5.0";
                validator: DoubleValidator{bottom: 0;}
            }
        }

        Text {
            id: deviationLabel;
            anchors.left: transparentBorder.left;
            anchors.top: radiusArea.bottom;
            anchors.topMargin: 8;
            text: "deviation:";
        }

        Rectangle {
            id: deviationArea;
            anchors.left: deviationLabel.right;
            anchors.leftMargin: 4;
            anchors.top: deviationLabel.top;
            height: 30;
            width: 160;
            color: "lightgray";
            border.width: 1;
            border.color: "darkgray";
            TextInput {
                anchors.fill: parent;
                anchors.margins: 2;
                id: deviationEdit;
                font.pointSize: 18;
                text: "4.0";
                validator: DoubleValidator{bottom: 0;}
            }
        }

        Text {
            id: sampleLabel;
            anchors.left: transparentBorder.left;
            anchors.top: deviationArea.bottom;
            anchors.topMargin: 8;
            text: "samples:";
        }

        Slider {
            id: sampleSlider;
            anchors.left: sampleLabel.right;
            anchors.leftMargin: 4;
            anchors.top: sampleLabel.top;
            minimumValue: 0;
            maximumValue: 32;
            value: 8.0;
            width: 160;
            height: 30;
            stepSize: 1.0;
        }

        Button {
            id: applyBtn;
            anchors.left: parent.left;
            anchors.leftMargin: 4;
            anchors.top: sampleSlider.bottom;
            anchors.topMargin: 12;
            text: "Apply";
            onClicked: {
                gaussian.transparentBorder = transparentBorder.checked;
                gaussian.radius = parseFloat(radiusEdit.text);
                gaussian.samples = sampleSlider.value;
                gaussian.deviation = deviationEdit.text;
            }
        }
    }
}
