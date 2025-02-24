import json
import boto3
import logging
import email
from email import policy
from email.parser import BytesParser

# Set up logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Initialize the S3 client
s3_client = boto3.client('s3')

# Lambda handler function
def lambda_handler(event, context):
    # Extract the S3 bucket name and the uploaded file name from the event
    bucket_name = event['Records'][0]['s3']['bucket']['name']
    object_key = event['Records'][0]['s3']['object']['key']
    
    # Log the details of the incoming event
    logger.info(f"Received file {object_key} from bucket {bucket_name}.")
    
    try:
        # Get the latest file from the S3 bucket
        response = s3_client.get_object(Bucket=bucket_name, Key=object_key)
        
        # Read the file content (email content in text format)
        email_content = response['Body'].read().decode('utf-8')
        
        # Parse the email content
        msg = BytesParser(policy=policy.default).parsebytes(email_content.encode('utf-8'))
        
        # Extract sender, recipient, and body
        sender = msg.get('From')
        recipient = msg.get('To')
        subject = msg.get('Subject')
        body = None
        
        # Try to get the email body
        if msg.is_multipart():
            # Iterate through the parts of the email
            for part in msg.iter_parts():
                if part.get_content_type() == 'text/plain':
                    # Check if charset is available, otherwise use default
                    charset = part.get_content_charset() or 'utf-8'
                    body = part.get_payload(decode=True).decode(charset)
                    break
        else:
            # If not multipart, just get the payload as body
            charset = msg.get_content_charset() or 'utf-8'
            body = msg.get_payload(decode=True).decode(charset)
        
        # Log the extracted details
        logger.info(f"Email Sender: {sender}")
        logger.info(f"Email Recipient: {recipient}")
        logger.info(f"Email Subject: {subject}")
        logger.info(f"Email Body: {body[:200]}...")  # Print the first 200 characters of the body for log
        
        # Optionally, you could store or process this information (e.g., save to a database or another S3 bucket)
        # You can also send it to another service, trigger another Lambda, etc.
        
        return {
            'statusCode': 200,
            'body': json.dumps('Email processed successfully')
        }
        
    except Exception as e:
        logger.error(f"Error processing the email: {str(e)}")
        return {
            'statusCode': 500,
            'body': json.dumps(f'Error processing the email: {str(e)}')
        }
