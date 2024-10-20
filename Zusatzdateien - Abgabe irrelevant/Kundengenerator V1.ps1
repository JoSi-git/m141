function New-CustomerData {
    [CmdletBinding()]
    param (
        # Output-Pfad für die CSV-Datei
        [Parameter(Mandatory=$true)]
        [string]$OutputPath,

        # Anzahl der zu generierenden Zeilen
        [Parameter(Mandatory=$true)]
        [int]$NumberOfRows
    )

    # Überprüfen, ob der Zielordner existiert, und erstellen, falls nötig
    $directory = [System.IO.Path]::GetDirectoryName($OutputPath)
    if (-not (Test-Path $directory)) {
        New-Item -ItemType Directory -Path $directory
    }

    # Definition der Attribute
    $firstNames = @('Max', 'Anna', 'Peter', 'Laura', 'Felix', 'Lena', 'Markus', 'Sandra', 'Simon', 'Julia', 'Thomas', 'Maria', 'David', 'Nina', 'Lukas', 'Katja', 'Kevin', 'Michaela', 'Daniel', 'Sophie')
    $lastNames = @('Meier', 'Müller', 'Schmid', 'Keller', 'Fischer', 'Weber', 'Huber', 'Bachmann', 'Marti', 'Gerber', 'Wenger', 'Lehmann', 'Maurer', 'Roth', 'Steiner', 'Sutter', 'Baumann', 'Kunz', 'Brunner', 'Zürcher')
    $streets = @('Bahnhofstrasse', 'Hauptstrasse', 'Schulstrasse', 'Dorfstrasse', 'Gartenweg', 'Ringstrasse', 'Sonnenweg', 'Seestrasse', 'Birkenweg', 'Poststrasse', 'Bergstrasse', 'Brunnenstrasse', 'Rosenweg', 'Talstrasse', 'Alpenblick', 'Wiesenweg', 'Feldstrasse', 'Tannenweg', 'Weidstrasse', 'Lindenweg')
    $postleitzahl = @('8001', '8050', '9000', '3000', '4001', '6003', '7000', '1000', '5000', '6300', '8002', '8304', '8400', '8500', '9001', '9050', '9100', '9200', '9300', '9400')
    $cities = @('Zürich', 'Bern', 'Luzern', 'Genf', 'Basel', 'St. Gallen', 'Lausanne', 'Winterthur', 'Biel', 'Chur', 'Lugano', 'Thun', 'Schaffhausen', 'Freiburg', 'Solothurn', 'Neuenburg', 'Uster', 'Sitten', 'Zug', 'Baden')
    $phoneNumbers = 1..100 | ForEach-Object { '044' + (Get-Random -Minimum 1000000 -Maximum 9999999).ToString() }
    $mobileNumbers = 1..100 | ForEach-Object { '079' + (Get-Random -Minimum 1000000 -Maximum 9999999).ToString() }
    
    # Geburtsdatum zwischen 1950 und 2000
    $startDate = [datetime]'1950-01-01'
    $endDate = [datetime]'2000-12-31'
    $timeSpan = $endDate - $startDate

    $emailDomains = @('example.com', 'mail.com', 'web.de', 'gmail.com', 'yahoo.com')

    # Leere Liste für die generierten Kunden
    $customers = @()

    # Zufällige Daten zusammenstellen
    for ($i = 0; $i -lt $NumberOfRows; $i++) {
        $firstName = Get-Random $firstNames
        $lastName = Get-Random $lastNames
        $street = "$(Get-Random $streets) $(Get-Random -Minimum 1 -Maximum 100)"
        $postalCode = Get-Random $postleitzahl
        $city = Get-Random $cities
        $phone = Get-Random $phoneNumbers
        $mobile = Get-Random $mobileNumbers
        
        # Erzeuge ein zufälliges Geburtsdatum
        $randomDays = Get-Random -Minimum 0 -Maximum $timeSpan.Days
        $birthDate = $startDate.AddDays($randomDays).ToString("yyyy-MM-dd")
        
        $email = "$firstName.$lastName@" + (Get-Random $emailDomains)

        # Kundendaten als Array speichern (ohne Anführungszeichen)
        $customer = "$lastName;$firstName;$street;$postalCode;$city;$phone;$mobile;$birthDate;$email"
        $customers += $customer
    }

    # Kopfzeile für CSV-Datei erstellen
    $header = "Nachname;Vorname;Strasse;Postleitzahl;Ort;Telefonnummer;Handynummer;Geburtsdatum;Email"
    $csvContent = $header + "`n" + ($customers -join "`n")

    # Daten in die Datei schreiben
    [System.IO.File]::WriteAllText($OutputPath, $csvContent, [System.Text.Encoding]::UTF8)

    Write-Host "Erfolgreich $NumberOfRows Kundendatensätze generiert und nach $OutputPath exportiert."
}


# Zweck:	- Erstellt aus einem zusammengewürfelten Pool an Daten Kunden
#		- Export als CSV mit beliebier grösse und Pfad möglich
# Autor:  Jonas Sieber, Fabian Manser, Bojan Maljuric
# Datum:  20.10.2024
# Ausführung: In Powershell - als Administrator
#
# Das Modul verwenden:
# New-CustomerData -OutputPath "C:\ProgramData\MySQL\MySQL Server 8.4\Uploads\kunde.csv" -NumberOfRows 10000



