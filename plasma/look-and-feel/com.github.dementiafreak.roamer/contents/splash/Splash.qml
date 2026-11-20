import QtQuick

Rectangle {
    id: root
    anchors.fill: parent
    color: "#010100"

    Image {
        anchors.fill: parent
        source: "images/flower-back.png"
        fillMode: Image.PreserveAspectCrop
        smooth: true
    }


    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }

    Item {
        id: content
        anchors.fill: parent
        opacity: 0
        TextMetrics {
            id: units
            text: "M"
            property int gridUnit: boundingRect.height
            property int largeSpacing: units.gridUnit
            property int smallSpacing: Math.max(2, gridUnit/4)
        }

        Rectangle {
            width: parent.width
            height: 200
            anchors.bottom: parent.bottom

            gradient: Gradient {
                GradientStop { position: 0.0; color: "transparent" }
                GradientStop { position: 0.55; color: "#010100" }
                GradientStop { position: 1.0; color: "#010100" }

            }
        }

        Image {
            id: logo
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 16
            anchors.leftMargin: 16
            source: "images/kde.svgz"
            sourceSize.height: 60
            sourceSize.width: 60

        }

        Text {
            id: welcome
            text: "Welcome to KDE Plasma"
            color: "#ffffff"
            font.family: "Helvetica"
            font.pixelSize: 40
            font.italic: true

            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.leftMargin: 100
            anchors.bottomMargin: 25
        }

        Image {
            id: animation
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.bottomMargin: 12
            anchors.rightMargin: 16
            source: "images/loading.svg"
            sourceSize.height: 75
            sourceSize.width: 75
            RotationAnimator on rotation {
                id: rotationAnimator
                from: 0
                to: 360
                duration: 2000
                loops: Animation.Infinite
            }
        }
    }

    OpacityAnimator {
        id: introAnimation
        running: false
        target: content
        from: 0
        to: 1
        duration: 1000
        easing.type: Easing.InOutQuad
    }
}
