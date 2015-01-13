import QtQuick 2.2
import QtGraphicalEffects 1.0
import QtQuick.Controls 1.2

Rectangle {
    anchors.fill: parent;
    Image {
        id: opImage;
        x: 4;
        y: 4;
        width: 220;
        height: 220;
        source: "butterfly.png";
        sourceSize: Qt.size(220, 220);
        smooth: true;
        visible: false;
    }

    LevelAdjust {
        id: level;
        anchors.fill: opImage;
        source: opImage;
        minimumInput: minInput.color;
        maximumInput: maxInput.color;
        minimumOutput: minOutput.color;
        maximumOutput: maxOutput.color;
    }

    GammaVector {
        id: gammaSelector;
        anchors.left: opImage.left;
        anchors.top: opImage.bottom;
        anchors.topMargin: 4;
        onSelected: level.gamma = gammaSelector.gamma;
    }

    Grid {
        anchors.top: gammaSelector.bottom;
        anchors.topMargin: 4;
        anchors.left: gammaSelector.left;
        columns: 4;
        rowSpacing: 4;
        columnSpacing: 2;
        verticalItemAlignment: Grid.AlignVCenter;
        Text {
            text: "minimumInput:";
        }
        ColorPicker {
            id: minInput;
            width: 90;
            height: 28;
            color: "#00000000";
        }
        Text {
            text: "maximumInput:";
        }
        ColorPicker {
            id: maxInput;
            width: 90;
            height: 28;
            color: "#ffffffff";
        }
        Text {
            text: "minimumOutput:";
        }
        ColorPicker {
            id: minOutput;
            width: 90;
            height: 28;
            color: "#00000000";
        }
        Text {
            text: "maximumOutput:";
        }
        ColorPicker {
            id: maxOutput;
            width: 90;
            height: 28;
            color: "#ffffffff";
        }
    }
}
