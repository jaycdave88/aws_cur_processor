from src.aws_s3_client import AwsS3Client
from src.csv_parser import CsvParser
from src.json_converter import JsonConverter

def main_function(bucket_name, s3_file_path, local_file_path, access_key, secret_key, region):
    # Instantiate the S3 client and download the file
    s3_client = AwsS3Client(bucket_name, access_key, secret_key, region)
    s3_client.download_file(s3_file_path, local_file_path)

    # Parse the downloaded CSV file
    csv_parser = CsvParser(local_file_path)
    csv_data = csv_parser.parse_csv()

    # Convert the CSV data to JSON
    json_data = JsonConverter.convert_to_json(csv_data)

    # Output the JSON data to a file or print it
    with open('output.json', 'w') as json_file:
        json_file.write(json_data)