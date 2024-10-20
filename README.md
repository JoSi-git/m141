# Modul 141: Datenbanksysteme in Betrieb nehmen

## Alle Scripts wurden unter folgendem Szenario erstellt und getestet:
- **MYSQL Community Server**: 8.4.3 LTS Edition
- **MYSQL Workbench**: 8.0.40

## Ausführung als Root:
1. `createDB.sql`
2. `importData.sql` **
3. `create_User.sql`
4. `createViewsAndSP.sql`
5. (Test via Zusatzdatei: `TestViewsAndSP.sql`)

** Hinweis: Die Datei `kunde.csv` muss unter dem Windows-Pfad: 
**`C:\ProgramData\MySQL\MySQL Server 8.4\Uploads`** abgelegt werden.

## PowerShell Script: `Kundengenerator V1.ps1`
- **Zweck**: Erstellt aus einem zusammengewürfelten Pool an Daten Kunden
- **Export**: Als CSV mit beliebiger Größe und Pfad möglich
- **Autor**: Jonas Sieber
- **Datum**: 20.10.2024
- **Ausführung**: In PowerShell - als Administrator

## Das Modul verwenden:
```powershell
New-CustomerData -OutputPath "C:\ProgramData\MySQL\MySQL Server 8.4\Uploads\kunde.csv" -NumberOfRows 10000
