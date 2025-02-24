import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

def send_email(sender_email, receiver_email, subject, body, sender_password):
    try:
        # Set up the SMTP server and login
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login(sender_email, sender_password)
        
        # Create the email message
        msg = MIMEMultipart()
        msg['From'] = sender_email
        msg['To'] = receiver_email
        msg['Subject'] = subject
        
        # Attach the email body to the message
        msg.attach(MIMEText(body, 'plain'))
        
        # Send the email
        server.sendmail(sender_email, receiver_email, msg.as_string())
        
        print("Email sent successfully!")
        
        # Close the connection to the server
        server.quit()
        
    except Exception as e:
        print(f"An error occurred: {e}")

# Usage
sender_email = "your_email@gmail.com"
receiver_email = "receiver_email@example.com"
subject = "Test Email"
body = "This is a test email sent from Python."
sender_password = "your_email_password_or_app_password"

send_email(sender_email, receiver_email, subject, body, sender_password)



################################################################################################
import psycopg2

# Define the connection parameters
host = "shikharaidb.cluster-cvgy44gkw4fv.us-east-1.rds.amazonaws.com"
dbname = "shikharaidb"
user = "postgres"
password = "MYshikhardb#7890"
port = "5432"  # default is 5432

# Create a connection to the database
try:
    conn = psycopg2.connect(
        host=host,
        dbname=dbname,
        user=user,
        password=password,
        port=port
    )
    print("Connection successful")

    # Create a cursor object using a context manager
    with conn.cursor() as cursor:
        # Write your SQL query to fetch the details
        query = "SELECT * FROM your_table_name LIMIT 10;"
        
        # Execute the query
        cursor.execute(query)
        
        # Fetch the results
        records = cursor.fetchall()
        
        # Print the fetched records
        print("Fetched records:")
        for record in records:
            print(record)

except Exception as e:
    print(f"Error: {e}")

finally:
    # Close the connection to the database
    if conn:
        conn.close()
        print("Connection closed")

