# 🎯 Schießbahn Kamera-Stream (8-MP uStreamer)

Dieses Repository enthält das automatische Setup für den Raspberry Pi an der Schießbahn. Es konfiguriert eine angeschlossene USB-Kamera (z. B. mit Sony IMX179 Chip) auf die maximale Auflösung von **8 Megapixeln (3264x2448)** bei flüssigen **15 FPS** und stellt den Live-Stream im Vereins-Netzwerk bereit.

Das Skript kümmert sich vollautomatisch darum, ältere blockierende Dienste (wie `motion`) abzuschalten, uStreamer zu installieren und den Kamera-Stream so einzurichten, dass er bei jedem Neustart des Pi von alleine mit hochfährt.

---

## 🚀 Schnell-Installation

Öffne einfach das Terminal auf dem Raspberry Pi, an dem die Kamera per USB angeschlossen ist, und füge diesen **einen einzigen Befehl** ein:

```bash
git clone [https://github.com/DreDayyy92/bahn-cam.git](https://github.com/DreDayyy92/bahn-cam.git) && cd bahn-cam && chmod +x install.sh && ./install.sh
