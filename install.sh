#!/bin/bash

echo "======================================================"
echo " STARTE INSTALLATION DER SCHIESSBAHN-KAMERA"
echo "======================================================"

# 1. System aktualisieren & uStreamer installieren
echo "--> Installiere uStreamer und V4L-Tools..."
sudo apt update
sudo apt install ustreamer v4l-utils qv4l2 -y

# 2. Blockierenden Motion-Dienst deaktivieren
echo "--> Entferne blockierenden Motion-Dienst aus dem System..."
sudo systemctl stop motion 2>/dev/null
sudo systemctl disable motion 2>/dev/null

# 3. uStreamer Service-Datei aus dem Repo an den richtigen Ort kopieren
echo "--> Richte den uStreamer Systemdienst ein..."
sudo cp ustreamer.service /etc/systemd/system/ustreamer.service

# 4. Systemd neu laden und Dienst aktivieren (Autostart)
echo "--> Aktiviere Autostart und starte den Kamera-Stream..."
sudo systemctl daemon-reload
sudo systemctl reset-failed ustreamer.service
sudo systemctl enable ustreamer.service
sudo systemctl restart ustreamer.service

echo "======================================================"
echo " FERTIG! Die Kamera läuft im Hintergrund."
echo " Stream-Adresse: http://$(hostname -I | awk '{print $1}'):9000/stream"
echo "======================================================"
