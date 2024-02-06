import os
import requests
# from src.aws_s3_client import AwsS3Client
from src.csv_parser import CsvParser
from src.json_converter import JsonConverter

# # Locally test
# file_path = '/Users/jay.dave/code/aws_cur_processor/aws-cur.csv'  # Update this path as needed
# parser = CsvParser(file_path)
# parsed_data = parser.parse_csv()
# json_data = JsonConverter.convert_to_json(parsed_data)
# print(json_data)

def send_data_in_batches(json_data, endpoint, headers, batch_size=4000000):  # batch_size in bytes
    start = 0
    end = batch_size
    while start < len(json_data):
        chunk = json_data[start:end]
        response = requests.post(endpoint, headers=headers, data=chunk)
        if response.status_code != 200:
            print(f"Failed to send data: {response.status_code} - {response.text}")
            # Handle failure: retry, log, raise exception, etc.
        start += batch_size
        end += batch_size

def main_function(bucket_name, s3_file_path, local_file_path, access_key, secret_key, region):
    # Parse the downloaded CSV file
    csv_parser = CsvParser(local_file_path) 
    csv_data_generator = csv_parser.parse_csv()

    # Convert the CSV data to JSON
    json_data = JsonConverter.convert_to_json(csv_data_generator)

    # Send the JSON data to the endpoint in batches
    endpoint = "https://134414420961.collect.observeinc.com/v1/http"
    headers = {
        "Authorization": "Bearer {OBSERVE_BEARER_TOKEN}",
        "Content-type": "application/json"
    }

    # Send data in batches
    send_data_in_batches(json_data, endpoint, headers)

if __name__ == "__main__":
    # Read environment variables
    bucket_name = os.getenv('AWS_S3_BUCKET_NAME')
    s3_file_path = os.getenv('AWS_S3_FILE_PATH')
    local_file_path = os.getenv('LOCAL_FILE_PATH')
    access_key = os.getenv('AWS_ACCESS_KEY_ID')
    secret_key = os.getenv('AWS_SECRET_ACCESS_KEY')
    region = os.getenv('AWS_DEFAULT_REGION')

    # Ensure all required environment variables are set
    if not all([bucket_name, s3_file_path, local_file_path, access_key, secret_key, region]):
        raise ValueError("One or more required environment variables are missing.")

    # Call the main function with the environment variables
    main_function(bucket_name, s3_file_path, local_file_path, access_key, secret_key, region)