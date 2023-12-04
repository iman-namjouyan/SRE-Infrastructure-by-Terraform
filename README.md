# Infrastructure-By-Terraform
Deploying NginxIngress, Longhorn, Prometheus-Stack,MinIO, Velero, ArgoCD, Hashicorp-Vault, EFK and Gitlab On Kubernetes Cluster

**LOM:**
Tools|Version
-----|-------
Kubernetes|1.26.6
Terraform|1.0.4
Helm|3.12.3
htpasswd|1.0.1 (loafoe/htpasswd)


**Terraform Providers:**
Provider Name|
--------------|
Kubernetes
Helm


**List Of Terraform Modules That Must Be Installed**
Module Name|
-----------|
Nginx-ingress|
Prometheus-stack|
Minio|
Velero|
ArgoCD|
hashicorp vault|
Elasticsearch Fluentbit Kibana (EFK)|
Gitlab|


**Einführung:**

In diesem Projekt wird von Terraform eine Infrastruktur geschaffen, um den CI/CD-Zyklus in Kubernetes zu nutzen. Terraform-Codes werden als separate Module geschrieben, um sie lesbar und verständlich zu machen. Diese Module befinden sich im Modulverzeichnis. Die Liste der Module ist in der Tabelle enthalten.

In jedem Modulverzeichnis befinden sich zwei Verzeichnisse:

Das Verzeichnis helm-chart, das das Helm-Chart für das betreffende Modul enthält.
Das Verzeichnis values, das Werte enthält, die die Standardwerte des Helm-Charts ersetzen sollen.
Außerdem befindet sich im Stammverzeichnis jedes Moduls die Hauptcodedatei des Moduls.

In einigen Modulen werden auch Ausgabevariablen verwendet. Ausgabevariablen übertragen einen Wert, der von einem Modul erzeugt wird, an ein anderes Modul.

In diesem Projekt wird Kubernetes-Version 1.26.5 verwendet.


**Nginx-ingress:**

Nginx-Ingress ist ein Ingress Controller für Kubernetes, der Nginx verwendet. Ein Ingress Controller ist ein Kubernetes-Element, das externen Datenverkehr an interne Dienste in einem Kubernetes-Cluster weiterleitet. Nginx-Ingress ist einer der beliebtesten Ingress Controller und bekannt für seine Funktionen und gute Leistung.

Nginx-Ingress kann verschiedene Arten von Datenverkehr verarbeiten, einschließlich HTTP, HTTPS, WebSockets usw. Er kann auch verschiedene Funktionen wie Lastausgleich, SSL-Terminierung, HTTP-Weiterleitungen usw. unterstützen.

Nginx-Ingress kann manuell oder mit einem Verwaltungstool wie Helm installiert werden. Nach der Installation können Sie ihn zum Verwalten des externen Datenverkehrs zu Ihren Kubernetes-Diensten verwenden.

Hier sind einige der Hauptfunktionen von Nginx-Ingress:

Unterstützung für verschiedene Arten von Datenverkehr
Unterstützung für verschiedene Funktionen wie Lastausgleich, SSL-Terminierung, HTTP-Weiterleitungen usw.
Gute Leistung
Nginx-Ingress ist eine gute Wahl für die Abwicklung des externen Datenverkehrs zu Kubernetes-Diensten. Wenn Sie nach einem leistungsstarken und flexiblen Ingress Controller suchen, ist Nginx-Ingress einen Blick wert.

Hier sind einige Beispiele für die Verwendung von Nginx-Ingress:

Bereitstellung von Webdiensten wie Websites, Portalen usw.
Bereitstellung von API-Diensten
Bereitstellung von VoIP-Diensten
Bereitstellung von CDN-Diensten
Nginx-Ingress ist ein leistungsstarkes Tool, das für eine Vielzahl von Anwendungen eingesetzt werden kann.

**Longhorn Block Storage**

Longhorn-Blockspeicher ist ein verteiltes Blockspeichersystem für Kubernetes. Es nutzt Kubernetes und Containerelemente, um eine einfache, zuverlässige und skalierbare Speicherlösung bereitzustellen.

Longhorn-Blockspeicher verwendet ein Controller-basiertes Modell. Jeder Controller ist für ein Blockvolumen verantwortlich. Controller kopieren Daten synchron auf mehrere Knoten, um die Daten bei einem Ausfall eines Knotens zu erhalten.

Longhorn-Blockspeicher bietet folgende Funktionen:

Einfach und benutzerfreundlich: Longhorn-Blockspeicher ist für eine einfache Verwendung konzipiert. Um loszulegen, müssen Sie nur die Controller installieren und ein Blockvolumen erstellen.
Zuverlässig: Longhorn-Blockspeicher verwendet ein Controller-basiertes Modell, das Daten im Falle eines Knotenausfalls bewahrt.
Skalierbar: Longhorn-Blockspeicher kann automatisch skaliert werden, wenn die Anzahl der Knoten zunimmt.
Longhorn-Blockspeicher eignet sich für eine Vielzahl von Anwendungen, darunter:

Datenbankdatenspeicherung
Mediendateispeicherung
Anwendungsdatenspeicherung
Beispiele für die Verwendung von Longhorn-Blockspeicher:

Sie können Longhorn-Blockspeicher verwenden, um Daten in Datenbanken zu speichern. Dadurch können Sie Ihre Datenbanken in einem Kubernetes-Cluster ausführen und die Skalierbarkeit und Verwaltungsfunktionen von Kubernetes nutzen.
Sie können Longhorn-Blockspeicher zum Speichern von Mediendateien verwenden. Dadurch können Sie Ihre Mediendateien auf einem Kubernetes-Cluster hosten und die Verwaltungs- und Kollaborationsfunktionen von Kubernetes nutzen.
Sie können Longhorn-Blockspeicher zum Speichern von Anwendungsdaten verwenden. Dadurch können Sie Ihre Anwendungsdaten in einem Kubernetes-Cluster speichern und die Skalierbarkeit und Verwaltungsfunktionen von Kubernetes nutzen.

Fazit:

Longhorn-Blockspeicher ist eine ausgezeichnete Wahl für Unternehmen, die ein einfaches, zuverlässiges und skalierbares Blockspeichersystem für Kubernetes suchen.

**Prometheus-stack:**

Prometheus-Stapel ist ein Helm-Paket, das eine Sammlung von Überwachungs- und Warntools für Kubernetes-Cluster bereitstellt. Dazu gehören Prometheus, Grafana und Alertmanager.

Prometheus ist ein Open-Source-Überwachungssystem, das Leistungsdaten aus verschiedenen Quellen sammelt und speichert. Grafana ist ein Datenvisualisierungstool, das Prometheus-Daten anzeigt. Alertmanager ist ein Warnsystem, das Warnungen sendet, wenn ungewöhnliche Bedingungen auftreten.

Prometheus-Stapel kann manuell oder mit einem Verwaltungstool wie Helm installiert werden. Nach der Installation können Sie damit die Leistung Ihres Kubernetes-Clusters überwachen und Benachrichtigungen erhalten, wenn ungewöhnliche Bedingungen auftreten.

Hauptfunktionen:

Einfache Installation: Prometheus-Stapel kann einfach mit einem Verwaltungstool wie Helm installiert werden.
Anpassungsfähigkeit: Prometheus-Stapel kann mithilfe von Werten an Ihre spezifischen Anforderungen angepasst werden.
Erweiterbarkeit: Prometheus-Stapel kann durch Hinzufügen zusätzlicher Überwachungs- und Alarmierungstools erweitert werden.
Anwendungsbereiche:

Überwachung der Kubernetes-Clusterleistung
Erhalt von Benachrichtigungen bei Ausfällen oder schlechter Leistung von Ressourcen
Überprüfen des Zustands und der Leistung von Anwendungen
Identifizieren von Mustern der Ressourcennutzung

Fazit:

Prometheus-Stapel ist eine ausgezeichnete Wahl für Organisationen, die eine einfache, anpassbare und erweiterbare Überwachungs- und Warnlösung für ihren Kubernetes-Cluster suchen.

**MinIO:**

Minio ist ein Open-Source-Objektspeichersystem, das das S3-Protokoll unterstützt. Es ist schnell, zuverlässig und skalierbar. Minio kann eigenständig oder als Speicherschicht für Kubernetes verwendet werden.

Hauptfunktionen:

Einfachheit: Minio ist so konzipiert, dass es einfach zu bedienen ist.
Zuverlässigkeit: Minio verwendet ein verteiltes Modell, das Daten beibehält, wenn ein Knoten ausfällt.
Skalierbarkeit: Minio kann automatisch skaliert werden, wenn die Anzahl der Knoten zunimmt.
Anwendungsbereiche:

Speicherung von Mediendateien
Anwendungsdatenspeicherung
Backup-Datenspeicherung
Beispiele für die Verwendung von Minio:

Speichern von Mediendateien wie Bildern, Videos und Musik
Speichern von Anwendungsdaten wie Datenbanken und Konfigurationsdateien
Speichern von Sicherungsdaten
Vorteile der Verwendung von Minio:

Einfach und leicht zu bedienen
Zuverlässig
Skalierbar
Sicher
Anpassbar
Kostenlos

Fazit:

Minio ist eine ausgezeichnete Wahl für Unternehmen, die ein einfaches, zuverlässiges und skalierbares Objektspeichersystem suchen.

