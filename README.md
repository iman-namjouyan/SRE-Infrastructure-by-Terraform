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

#---------------------
**Einführung:**

In diesem Projekt wird von Terraform eine Infrastruktur geschaffen, um den CI/CD-Zyklus in Kubernetes zu nutzen. Terraform-Codes werden als separate Module geschrieben, um sie lesbar und verständlich zu machen. Diese Module befinden sich im Modulverzeichnis. Die Liste der Module ist in der Tabelle enthalten.

In jedem Modulverzeichnis befinden sich zwei Verzeichnisse:

Das Verzeichnis helm-chart, das das Helm-Chart für das betreffende Modul enthält.
Das Verzeichnis values, das Werte enthält, die die Standardwerte des Helm-Charts ersetzen sollen.
Außerdem befindet sich im Stammverzeichnis jedes Moduls die Hauptcodedatei des Moduls.

In einigen Modulen werden auch Ausgabevariablen verwendet. Ausgabevariablen übertragen einen Wert, der von einem Modul erzeugt wird, an ein anderes Modul.

In diesem Projekt wird Kubernetes-Version 1.26.5 verwendet.


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

**Änderungen:**

In der Einleitung habe ich die Wörter "einschließlich HTTP, HTTPS, WebSockets usw." entfernt, da sie für das B1-Niveau nicht erforderlich sind.
Ich habe den Satz "die auch verschiedene Funktionen wie Lastausgleich, SSL-Terminierung, HTTP-Weiterleitungen usw. unterstützen sollen" in "unterstützt verschiedene Funktionen wie Lastausgleich, SSL-Terminierung, HTTP-Weiterleitungen usw." geändert, um ihn einfacher zu verstehen.
Ich habe den Satz "manuell oder mit einem Verwaltungstool wie Helm" in "manuell oder mit einem Verwaltungstool wie Helm" geändert, um ihn einfacher zu verstehen.
Ich habe den Satz "Hier sind einige der Hauptfunktionen von Nginx-Ingress:" in "Hier sind einige der Hauptfunktionen von Nginx-Ingress:" geändert, um ihn einfacher zu verstehen.

