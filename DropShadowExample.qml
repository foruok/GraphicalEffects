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
        source: "butterfly.png";
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

    Text {
        id: effectsLabel;
        anchors.top: origImage.bottom;
        anchors.margins: 4;
        anchors.left: parent.left;
        font.pointSize: 20;
        font.bold: true;
        text: "Shadow Effects:";
        color: "blue";
    }

    Rectangle {
        id: shadowEffects;
        anchors.left: effectsLabel.right;
        anchors.leftMargin: 4;
        anchors.top: effectsLabel.top;
        anchors.right: parent.right;
        anchors.rightMargin: 4;
        height: 40;
        color: "gray";

        ListView {
            anchors.fill: parent;
            clip: true;
            focus: true;
            orientation: ListView.Horizontal;
            spacing: 20;
            delegate: Text {
                id: wrapper;
                height: 40;
                verticalAlignment: Text.AlignVCenter;
                text: name;
                font.pointSize: 18;
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
                height: parent.height;
                color: "lightblue";
            }

            model: shadowsModel;
        }
    }

    Loader {
        id: effectControl;
        anchors.top: shadowEffects.bottom;
        anchors.left: parent.left;
        anchors.bottom: parent.bottom;
        anchors.right: parent.right;
        anchors.margins: 4;
        source: "DropShadowEx.qml";
    }

    ListModel {
        id: shadowsModel;
        ListElement {
            name: "DropShadow";
            example: "DropShadowEx.qml";
        }
        ListElement {
            name: "InnerShadow";
            example: "InnerShadowEx.qml";
        }
    }
}
