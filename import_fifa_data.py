import pandas as pd
import mysql.connector
import zipfile
import io

# --- 1. FILE CONFIGURATION ---
# The 'r' before the string handles the backslashes in Windows paths
zip_path = r'C:\Users\sneha\Downloads\archive (1).zip'
# Note: Ensure the filename matches exactly (including .csv)
csv_inside_zip = 'FIFA-21 Complete.csv' 

print("Opening ZIP archive...")
try:
    with zipfile.ZipFile(zip_path, 'r') as z:
        with z.open(csv_inside_zip) as f:
            # We use sep=';' because your specific file uses semicolons
            df = pd.read_csv(f, sep=';')
            print("CSV loaded successfully!")
except Exception as e:
    print(f"Error reading file: {e}")
    exit()

# --- 2. DATABASE CONFIGURATION (db_config) ---
# This is the "Passport" to enter your MariaDB database
db_config = {
    'host': 'localhost',        # Your computer
    'user': 'root',             # Default MariaDB user
    'password': 'Dude', # ENTER YOUR MARIADB PASSWORD HERE
    'database': 'term_project_giovanni_steva',
    'port': 3306                # Standard MariaDB port
}

# --- 3. DATA CLEANING & PREP ---
# Remove quotes and extra spaces from team names
df['team'] = df['team'].str.strip().str.replace('"', '')

# Extract unique positions (splitting strings like 'ST|CF|RW')
unique_positions = set()
for pos_str in df['position'].dropna().unique():
    unique_positions.update(pos_str.split('|'))

# --- 4. IMPORT PROCESS ---
try:
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()
    print("Connected to MariaDB.")

    # A. Insert unique Positions
    print("Inserting Positions...")
    for pos in sorted(list(unique_positions)):
        cursor.execute("INSERT IGNORE INTO Positions (PositionName) VALUES (%s)", (pos,))
    
    # B. Insert unique Teams
    print("Inserting Teams...")
    unique_teams = df['team'].unique()
    for team in unique_teams:
        cursor.execute("INSERT IGNORE INTO Team (TeamName) VALUES (%s)", (team,))
    
    conn.commit() # Save progress

    # Get IDs for mapping
    cursor.execute("SELECT PositionID, PositionName FROM Positions")
    pos_map = {name: id for (id, name) in cursor.fetchall()}
    cursor.execute("SELECT TeamID, TeamName FROM Team")
    team_map = {name: id for (id, name) in cursor.fetchall()}

    # C. Insert Players and Junction Tables
    print("Inserting Players and linking data... (This may take a minute)")
    for _, row in df.iterrows():
        # Insert Player
        cursor.execute("""
            INSERT IGNORE INTO Player (PlayerID, Name, Age, Nationality, Overall, Potential, Hits)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (row['player_id'], row['name'], row['age'], row['nationality'], 
              row['overall'], row['potential'], row['hits']))

        # Link to Team (PlayerTeam table)
        t_id = team_map.get(row['team'])
        if t_id:
            cursor.execute("""
                INSERT IGNORE INTO PlayerTeam (PlayerID, TeamID) VALUES (%s, %s)
            """, (row['player_id'], t_id))

        # Link to Positions (PlayerPositions table)
        for p_name in row['position'].split('|'):
            p_id = pos_map.get(p_name)
            if p_id:
                cursor.execute("""
                    INSERT IGNORE INTO PlayerPositions (PlayerID, PositionID) VALUES (%s, %s)
                """, (row['player_id'], p_id))

    conn.commit()
    print("DONE! Your database is now fully populated.")

except mysql.connector.Error as err:
    print(f"Database Error: {err}")
finally:
    if 'conn' in locals() and conn.is_connected():
        cursor.close()
        conn.close()