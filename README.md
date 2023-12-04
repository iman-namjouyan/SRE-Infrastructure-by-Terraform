# Infrastructure-By-Terraform
Deploying NginxIngress, Longhorn, Prometheus-Stack,MinIO, Velero, ArgoCD, Hashicorp-Vault, EFK and Gitlab On Kubernetes Cluster
Table 
[Specs](README.md#specs)

[Einführung](README.md#Einführung)

[Modules](README.md#modules)





Specs
=======
**LOM:**
Tools|Version
-----|-------
Kubernetes|1.26.5
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


Einführung:
=======

In diesem Projekt wird von Terraform eine Infrastruktur geschaffen, um den CI/CD-Zyklus in Kubernetes zu nutzen. Terraform-Codes werden als separate Module geschrieben, um sie lesbar und verständlich zu machen. Diese Module befinden sich im Modulverzeichnis. Die Liste der Module ist in der Tabelle enthalten.

In jedem Modulverzeichnis befinden sich zwei Verzeichnisse:

Das Verzeichnis helm-chart, das das Helm-Chart für das betreffende Modul enthält.
Das Verzeichnis values, das Werte enthält, die die Standardwerte des Helm-Charts ersetzen sollen.
Außerdem befindet sich im Stammverzeichnis jedes Moduls die Hauptcodedatei des Moduls.

In einigen Modulen werden auch Ausgabevariablen verwendet. Ausgabevariablen übertragen einen Wert, der von einem Modul erzeugt wird, an ein anderes Modul.

In diesem Projekt wird Kubernetes-Version 1.26.5 verwendet.

Modules:
=======
**Nginx-ingress:**
-------

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

-----------------
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

*****Fazit:*****

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

*****Fazit:*****

Prometheus-Stapel ist eine ausgezeichnete Wahl für Organisationen, die eine einfache, anpassbare und erweiterbare Überwachungs- und Warnlösung für ihren Kubernetes-Cluster suchen.

-----------------
<a name="MinIO">MinIO</a>

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

*****Fazit:*****

Minio ist eine ausgezeichnete Wahl für Unternehmen, die ein einfaches, zuverlässiges und skalierbares Objektspeichersystem suchen.

-----------------
**Velero:**

Velero ist ein Open-Source-Tool, das Kubernetes-Daten sichert, wiederherstellt und migriert. Es verwendet ein Controller-basiertes Modell, bei dem jeder Controller für eine Sicherung oder Wiederherstellung verantwortlich ist.

Hauptfunktionen:

Vollständige oder selektive Sicherungen: Velero kann vollständige oder selektive Sicherungen von Kubernetes-Daten durchführen.
Redundante Sicherungen: Velero kann redundante Datensicherungen durchführen, sodass frühere Datenversionen wiederhergestellt werden können.
Wiederherstellung in einem neuen Cluster: Velero kann Daten in einem neuen Kubernetes-Cluster wiederherstellen.
Daten zwischen Clustern übertragen: Velero kann Daten zwischen Kubernetes-Clustern übertragen.
Anwendungsbereiche:

Tägliche oder wöchentliche Sicherungen von Kubernetes-Daten
Datenwiederherstellung bei Datenausfall oder -verlust
Daten in einen neuen Kubernetes-Cluster migrieren
Beispiele für die Verwendung von Velero:

Datensicherung von Datenbanken
Datenwiederherstellung von Anwendungen
Datenmigration in einen neuen Kubernetes-Cluster
Vorteile der Verwendung von Velero:

Einfach und leicht zu bedienen
Zuverlässig
Skalierbar
Sicher
Anpassbar
Kostenlos

*****Fazit:*****

Velero ist eine ausgezeichnete Wahl für Unternehmen, die eine einfache, zuverlässige und skalierbare Backup- und Wiederherstellungslösung für ihre Kubernetes-Daten suchen.

-----------------
**ArgoCD**

ArgoCD ist ein Open-Source-Tool, das Kubernetes-Anwendungen aus einem Git-Repository bereitstellt, aktualisiert und wiederherstellt. Es verwendet ein Controller-basiertes Modell, bei dem jeder Controller für eine Kubernetes-Anwendung verantwortlich ist.

Hauptfunktionen:

Automatische Anwendungsbereitstellung: ArgoCD kann Kubernetes-Anwendungen automatisch aus einem Git-Repository bereitstellen.
Automatische Anwendungsaktualisierungen: ArgoCD kann Kubernetes-Anwendungen automatisch auf neuere Versionen aktualisieren.
Automatische Wiederherstellung von Anwendungen: ArgoCD kann Kubernetes-Anwendungen im Fehlerfall wiederherstellen.
Anwendungsbereiche:

Bereitstellung neuer Anwendungen
Vorhandene Anwendungen aktualisieren
Wiederherstellung von Anwendungen nach einem Fehler
Beispiele für die Verwendung von ArgoCD:

Bereitstellung neuer Anwendungen aus einem Git-Repository
Aktualisierung vorhandener Anwendungen auf neuere Versionen
Wiederherstellung von Anwendungen nach Abstürzen
Vorteile der Verwendung von ArgoCD:

Einfach und benutzerfreundlich
Zuverlässig
Skalierbar
Sicher
Anpassbar
Kostenlos

*****Fazit:*****

ArgoCD ist eine ausgezeichnete Wahl für Unternehmen, die eine einfache, zuverlässige und skalierbare Lösung für das Anwendungslebenszyklusmanagement für ihre Kubernetes-Anwendungen suchen.

-----------------
**Hashicorp-vault**

HashiCorp Vault ist ein Open-Source-Tool zur sicheren Speicherung und Verwaltung von Geheimnissen. Es verwendet ein Controller-basiertes Modell, bei dem jeder Controller für eine Geheimnisquelle verantwortlich ist.

Hauptfunktionen:

Sichere Geheimspeicherung: Vault verwendet starke Verschlüsselung und Authentifizierung, um Geheimnisse zu schützen.
Identitätsbasierte Zugriffsverwaltung: Vault verwendet rollenbasierte Zugriffskontrolle (RBAC), um den Zugriff auf Geheimnisse zu steuern.
Geheimgenerierung in Echtzeit: Vault kann Geheimnisse in Echtzeit generieren.
Secret Lifecycle Management: Vault kann den Lebenszyklus von Secrets verwalten.
Anwendungsbereiche:

Speicherung von Passwörtern und API-Schlüsseln
Generieren Sie zufällige Benutzernamen und Passwörter
Erstellen Sie Token für den Zugriff auf Ressourcen
Beispiele für die Verwendung von Vault:

Speichern von Datenbankkennwörtern
Generieren von zufälligen Benutzernamen und Passwörtern
Generieren von Token für den Zugriff auf die API
Vorteile der Verwendung von Vault:

Starke Sicherheit: Vault verwendet starke Verschlüsselung und Authentifizierung, um Geheimnisse zu schützen.
Verwaltbarkeit: Vault verfügt über eine Reihe von Verwaltungsfunktionen, mit denen Sie Vault einfach verwalten können.
Skalierbarkeit: Vault kann automatisch skaliert werden, wenn die Anzahl der Benutzer und Anfragen steigt.
Anpassbarkeit: Vault kann mithilfe von Plugins und API an Ihre spezifischen Anforderungen angepasst werden.
Kostenlos: Vault ist ein Open-Source-Projekt, das kostenlos verfügbar ist.
*****Fazit:*****

HashiCorp Vault ist eine ausgezeichnete Wahl für Unternehmen, die eine sichere und zuverlässige Zugangs- und Geheimverwaltungslösung suchen.

-----------------
**Elasticsearch Fluentbit Kibana (EFK)**

Elasticsearch Fluentbit Kibana (EFK) ist eine Open-Source-Software-Suite zum Sammeln, Speichern und Analysieren von Anwendungsdaten. Sie besteht aus drei Komponenten:

Elasticsearch ist ein Open-Source-Such- und Analysesystem, das große Datenmengen speichern und verarbeiten kann.
Fluentbit ist ein Open-Source-Datenaggregator, der Daten aus verschiedenen Quellen sammeln kann.
Kibana ist ein Open-Source-Datenvisualisierungstool, das in Elasticsearch gespeicherte Daten analysieren kann.
EFK ist eine beliebte Lösung zum Sammeln und Analysieren von Anwendungsdaten. Sie bietet folgende Vorteile:

Skalierbarkeit: EFK kann bei steigendem Datenvolumen automatisch skaliert werden.
Anpassbarkeit: EFK kann mithilfe von Plugins und API an Ihre spezifischen Anforderungen angepasst werden.
Sicherheit: EFK verwendet Verschlüsselung und Authentifizierung, um Daten zu schützen.
EFK eignet sich für ein breites Anwendungsspektrum, darunter:

Überwachung der Leistung von Anwendungen
Sicherheitsdatenanalyse
Analyse von Betriebsdaten
Beispiele für die Verwendung von EFK:

Leistungsüberwachung: Sie können EFK verwenden, um die Leistung Ihrer Anwendungen zu überwachen. Dadurch können Sie die Leistung Ihrer Anwendungen verfolgen und Probleme erkennen, wenn sie auftreten.
Sicherheitsanalyse: Sie können EFK zur Analyse Ihrer Sicherheitsdaten verwenden. Dadurch können Sie Sicherheitsangriffe erkennen und verhindern.
Betriebsanalyse: Sie können EFK zur Analyse Ihrer Betriebsdaten verwenden. Dadurch können Sie die Leistung Ihrer Infrastruktur verfolgen und Muster erkennen.
*****Fazit:*****

EFK ist eine leistungsstarke und flexible Lösung zum Sammeln und Analysieren von Anwendungsdaten. Sie ist eine gute Wahl für Unternehmen, die eine skalierbare, anpassbare und sichere Lösung suchen.

-----------------
**GitLab:**

GitLab ist eine Open-Source-Plattform zur Quellcodeverwaltung, die Build-Management, Bug-Tracking, Release-Management, Secret-Management und Code-Analyse integriert. Sie ist für Softwareentwickler, Ingenieurteams und Unternehmen konzipiert.

Hauptfunktionen:

Git-Versionskontrolle: GitLab verwendet Git, ein Open-Source-Versionskontrollsystem. Mit GitLab können Entwickler ihren Code in einem gemeinsamen Git-Repository speichern.
Build-Management: GitLab verfügt über ein integriertes Build-Management-System, mit dem Entwickler ihren Code automatisch kompilieren und testen können.
Bug-Tracking: GitLab verfügt über ein integriertes Bug-Tracking-System, mit dem Entwickler Fehler in ihrem Code melden können.
Release-Management: GitLab verfügt über ein integriertes Release-Management-System, das es Entwicklern ermöglicht, ihren Code automatisch zu veröffentlichen.
Secret-Management: GitLab verfügt über ein integriertes Secret-Management-System, mit dem Entwickler Geheimnisse wie Passwörter und API-Schlüssel sicher speichern können.
Code-Analyse: GitLab verfügt über ein integriertes Code-Analyse-Tool, mit dem Entwickler ihren Code auf Fehler und potenzielle Probleme überprüfen können.
Anwendungsbereiche:

Softwareentwicklung
Softwaretest
Softwareverteilung
Softwaresicherheit
Beispiele für die Verwendung von GitLab:

Softwareentwicklung: GitLab kann für die gemeinsame Speicherung, Kompilierung, Testung, Fehlermeldung und Veröffentlichung von Code verwendet werden.
Softwaretest: GitLab kann zum automatischen Ausführen von Tests und zur Analyse von Testergebnissen verwendet werden.
Softwareverteilung: GitLab kann zum automatischen Verteilen von Software an Benutzer verwendet werden.
Softwaresicherheit: GitLab kann zum Überprüfen von Code auf Fehler und potenzielle Probleme verwendet werden.
Vorteile der Verwendung von GitLab:

Kostenlos und Open Source: GitLab ist ein Open-Source-Projekt, das frei verfügbar ist.
Skalierbarkeit: GitLab kann automatisch skaliert werden, wenn Benutzer und Projekte wachsen.
Anpassbarkeit: GitLab kann mithilfe von Plugins und API an Ihre spezifischen Anforderungen angepasst werden.
Sicherheit: GitLab verwendet Verschlüsselung und Authentifizierung, um Daten zu schützen.
*****Fazit:*****

GitLab ist eine leistungsstarke und umfassende Plattform zur Quellcodeverwaltung, die für eine Vielzahl von Anwendungen geeignet ist.
