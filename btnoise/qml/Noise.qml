/***************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the QtBluetooth module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.5
import QtQuick.Layouts 1.11
import QtQuick.Controls 2.4

AppPage {

    errorMessage: deviceFinder.error
    infoMessage: deviceFinder.info

    ColumnLayout {

        Rectangle {
            height: AppSettings.fieldMargin
        }

        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width - AppSettings.fieldMargin*2

        Text {
            id: title
            width: parent.width
            height: AppSettings.fieldHeight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: AppSettings.textColor
            font.pixelSize: AppSettings.mediumFontSize
            text: qsTr("Volume")
        }

        Slider {
            anchors.left: parent.left
            anchors.right: parent.right
            height: AppSettings.fieldHeight
            width: parent.width

            from: 0
            to: 100
            stepSize: 1.0

            value: deviceFinder.volume

            onMoved: deviceFinder.setVolume(value)
        }

        Rectangle {
            height: AppSettings.fieldMargin
        }

        Rectangle {
            width: parent.width
            height: AppSettings.fieldHeight
            color: "transparent"

            AppButton {
                anchors.left: parent.left;
                width: parent.width/2 - AppSettings.fieldMargin / 4
                height: AppSettings.fieldHeight
                enabled: deviceFinder.playing
                onClicked: deviceFinder.stop()

                Text {
                    anchors.centerIn: parent
                    font.pixelSize: AppSettings.tinyFontSize
                    text: qsTr("Stop")
                    color: AppSettings.textColor
                }
            }

            AppButton {
                anchors.right: parent.right;
                width: parent.width/2 - AppSettings.fieldMargin / 4
                height: AppSettings.fieldHeight
                enabled: !deviceFinder.playing
                onClicked: deviceFinder.play()

                Text {
                    anchors.centerIn: parent
                    font.pixelSize: AppSettings.tinyFontSize
                    text: qsTr("Play")
                    color: AppSettings.textColor
                }
            }
        }

        Rectangle {
            color: "transparent"
            height: AppSettings.fieldMargin
        }

        Text {
            width: parent.width
            visible: !deviceFinder.playerConnected
            height: AppSettings.fieldHeight
            color: AppSettings.textColor
            font.pixelSize: AppSettings.mediumFontSize
            text: qsTr("Player is disconnected")
        }

        Text {
            width: parent.width
            anchors.topMargin: AppSettings.fieldMargin
            visible: !deviceFinder.speakerConnected
            height: AppSettings.fieldHeight
            color: AppSettings.textColor
            font.pixelSize: AppSettings.mediumFontSize
            text: qsTr("Speaker is disconnected")
        }
    }
}
