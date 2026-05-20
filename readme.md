Markdown

# 🎯 Schießbahn Kamera-Stream (8-MP uStreamer)

Dieses Repository enthält das automatische Setup für den Raspberry Pi an der Schießbahn. Es konfiguriert eine angeschlossene USB-Kamera (z. B. mit Sony IMX179 Chip) auf die maximale Auflösung von **8 Megapixeln (3264x2448)** bei flüssigen **15 FPS** und stellt den Live-Stream im Vereins-Netzwerk bereit.

Das Skript kümmert sich vollautomatisch darum, ältere blockierende Dienste (wie `motion`) abzuschalten, uStreamer zu installieren und den Kamera-Stream so einzurichten, dass er bei jedem Neustart des Pi von alleine mit hochfährt.

---

## 🚀 Schnell-Installation (In weniger als 1 Minute)

Öffne einfach das Terminal auf dem Raspberry Pi, an dem die Kamera per USB angeschlossen ist, und füge diesen **einen einzigen Befehl** ein (Ersetze `DEIN_GITHUB_NAME` mit deinem echten GitHub-Namen):

```bash
git clone [https://github.com/DEIN_GITHUB_NAME/schiessbahn-kamera.git](https://github.com/DEIN_GITHUB_NAME/schiessbahn-kamera.git) && cd schiessbahn-kamera && chmod +x install.sh && ./install.sh

Danach läuft die Installation komplett von alleine durch. Am Ende zeigt dir das Terminal die genaue IP-Adresse an, unter der du das Bild abrufen kannst.
📺 Den Stream aufrufen

Sobald das Skript fertig ist, ist die Kamera dauerhaft im Netzwerk erreichbar. Öffne einfach einen Webbrowser auf einem PC, Tablet oder dem Monitor-Pi am Schützenstand und gib folgende Adresse ein:
Plaintext

http://<IP-ADRESSE-DES-PI>:9000/stream

(Beispiel: Wenn der Kamera-Pi die IP 192.168.1.131 hat, lautet die Adresse http://192.168.1.131:9000/stream)
🛠️ Was macht das Skript im Hintergrund?

Falls jemand im Verein wissen möchte, was da genau passiert – das Skript erledigt vier Dinge:

    Dienste installieren: Es lädt ustreamer und die v4l-utils (Kameratools) herunter.

    Kamera befreien: Es stoppt und deaktiviert den alten motion-Dienst dauerhaft, da dieser sonst die Kamera exklusiv blockiert.

    Konfiguration schreiben: Es hinterlegt die uStreamer-Konfiguration mit den vollen 8 Megapixeln im Systemd-Verzeichnis des Linux-Systems.

    Autostart einrichten: Es aktiviert den Dienst (ustreamer.service), damit der Stream nach jedem Einschalten der Schießbahn sofort wieder aktiv ist.

📌 Nützliche Befehle zur Kontrolle

Sollte es mal Probleme geben, kannst du den Status der Kamera jederzeit mit diesem Befehl im Terminal prüfen:
Bash

sudo systemctl status ustreamer.service

Falls du den Stream manuell neu starten möchtest:
Bash

sudo systemctl restart ustreamer.service
