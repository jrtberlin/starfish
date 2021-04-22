/*
 * Copyright (C) 2018 - Florent Revest <revestflo@gmail.com>
 *               2016 - Andrew Branson <andrew.branson@jollamobile.com>
 *                      Ruslan N. Marchenko <me@ruff.mobi>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.2
import QtQuick.Layouts 1.1
import Sailfish.Silica 1.0
import "../pullDownMenus"

Page {
    SilicaListView {
        anchors.fill: parent
        model: watches

        StarfishPullDownMenu {}

        header: PageHeader {
            title: qsTr("Starfish")
            description: qsTr("Manage Watches")
        }

        delegate: ListItem {
            enabled: watches.count !== 0
            width: parent.width

            RowLayout {
                    height: Theme.iconSizeLarge
                    width: parent.width

                Icon {
                    height: Theme.iconSizeSmall
                    width: height
                    source: "image://theme/icon-m-watch"
                }

                ColumnLayout {
                    Label {
                        text: name
                    }

                    Label {
                        text: address
                    }
                }
            }

            onClicked: watches.selectWatch(index)
        }

        ViewPlaceholder {
            anchors.fill: parent
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            width: parent.width

            enabled: watches.count === 0

            Label {
                text: qsTr("No smartwatches configured yet. Please connect your smartwatch using System Settings.")
                font.pixelSize: Theme.fontSizeLarge
                width: parent.width-(Theme.paddingSmall*2)
                anchors.centerIn: parent
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
            }

            Button {
                text: qsTr("Open Bluetooth Settings")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: Theme.paddingLarge
                anchors.bottom: parent.bottom
                onClicked: starfish.startBT()
            }
        }
    }
}
