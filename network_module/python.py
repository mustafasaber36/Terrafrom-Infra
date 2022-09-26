import json
import boto3

def lambda_handler(event, context):
    ses = boto3.client('ses')
    body = """
	    Hello and welcome to the SES Lambda Python.
	    There are some changes happend in state file please check it.
    """
    ses.send_email(
	    Source = 'moustafa.saber.sharabash@gmail.com',  # source mail
	    Destination = {
		    'ToAddresses': [
			    'moustafa.saber.sharabash@gmail.com'       # destination mail
		    ]
	    },
	    Message = {
		    'Subject': {
			    'Data': 'SES Demo',
			    'Charset': 'UTF-8'
		    },
		    'Body': {
			    'Text':{
				    'Data': body,
				    'Charset': 'UTF-8'
			    }
		    }
	    }
    )
    
    return {
        'statusCode': 200,
        'body': json.dumps('Successfully sent email from Lambda using Amazon SES')
    }