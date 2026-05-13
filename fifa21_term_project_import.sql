USE term_project_giovanni_steva;

/* NOTE: The full dataset was imported using the 'import_fifa_data.py' script.
The script processed 17,981 rows from the FIFA-21 Complete.csv file.
Below is a sample of the top players imported into the schema.
*/


INSERT IGNORE INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits) VALUES 
(158023, 'Lionel Messi', 33, 'Argentina', 94, 94, 299),
(20801, 'Cristiano Ronaldo', 35, 'Portugal', 93, 93, 276),
(190871, 'Neymar Jr', 28, 'Brazil', 92, 92, 186),
(203376, 'Virgil van Dijk', 29, 'Netherlands', 91, 92, 127),
(200389, 'Jan Oblak', 27, 'Slovenia', 91, 93, 47),
(192985, 'Kevin De Bruyne', 29, 'Belgium', 91, 91, 119),
(188545, 'Robert Lewandowski', 31, 'Poland', 91, 91, 89);

