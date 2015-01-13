import QtQuick 2.2
import QtQuick.Controls 1.2

Rectangle {
    id: example;
    signal back();
    anchors.fill: parent;

    Text {
        id: origLabel;
        x: 10;
        y: 4;
        font.pointSize: 20;
        text: "Original Image";
    }

    Button {
        anchors.right: parent.right;
        anchors.top: parent.top;
        anchors.margins: 4;
        text: "Back";
        onClicked: example.back();
    }


    Image {
        id: origImage;
        width: 240;
        height: 240;
        anchors.left: parent.left;
        anchors.top: origLabel.bottom;
        anchors.margins: 4;
        source: "bug.jpg";
        sourceSize: Qt.size(240, 240);
        smooth: true;
    }

    Rectangle{
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        anchors.top: origImage.bottom;
        height: 2;
        border.width: 1;
        border.color: "darkgray";
    }

    Image {
        anchors.left: origImage.right;
        anchors.leftMargin: 6;
        anchors.top: origImage.top;
        source: "butterfly.png";
        sourceSize: Qt.size(240, 240);
        smooth: true;
    }

    Text {
        id: colorLabel;
        anchors.top: origImage.bottom;
        anchors.margins: 4;
        anchors.left: parent.left;
        font.pointSize: 20;
        font.bold: true;
        text: "Color Effects";
        color: "blue";
    }

    Rectangle {
        id: colorEffects;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.top: colorLabel.bottom;
        anchors.topMargin: 10;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 10;
        width: 260;
        color: "gray";

        ListView {
            anchors.fill: parent;
            clip: true;
            focus: true;
            delegate: Text {
                id: wrapper;
                text: name;
                width: parent.width;
                height: 36;
                font.pointSize: 20;
                Keys.onEnterPressed: {
                    event.accepted = true;
                    effectControl.source = example;
                }

                Keys.onReturnPressed: {
                    event.accepted = true;
                    effectControl.source = example;
                }

                MouseArea {
                    anchors.fill: parent;
                    onClicked: {
                        wrapper.ListView.view.currentIndex = index;
                        effectControl.source = example;
                    }
                }
            }
            highlight: Rectangle {
                width: parent.width;
                color: "lightblue";
            }

            model: colorsModel;
        }
    }

    Loader {
        id: effectControl;
        anchors.top: colorLabel.top;
        anchors.leftMargin: 8;
        anchors.left: colorEffects.right;
        anchors.bottom: colorEffects.bottom;
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        source: "BrightnessContrastEx.qml";
    }

    ListModel {
        id: colorsModel;
        ListElement {
            name: "BrightnessContrast";
            example: "BrightnessContrastEx.qml";
        }
        ListElement {
            name: "ColorOverlay";
            example: "ColorOverlayEx.qml";
        }
        ListElement {
            name: "Colorize";
            example: "ColorizeEx.qml";
        }
        ListElement {
            name: "Desaturate";
            example: "DesaturateEx.qml";
        }
        ListElement {
            name: "GammaAdjust";
            example: "GammaAdjustEx.qml";
        }
        ListElement {
            name: "HueSaturation";
            example: "HueSaturationEx.qml";
        }
        ListElement {
            name: "LevelAdjust";
            example: "LevelAdjustEx.qml";
        }
    }
}
