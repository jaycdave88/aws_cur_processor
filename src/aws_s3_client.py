import boto3
import logging

class AwsS3Client:
    def __init__(self, bucket_name, access_key, secret_key, region):
        # Initialize the S3 client with IAM credentials
        self.s3 = boto3.client('s3', aws_access_key_id=access_key, aws_secret_access_key=secret_key, region_name=region)
        self.bucket_name = bucket_name

        # Set up logging
        logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
        self.logger = logging.getLogger(__name__)

    def download_file(self, file_path, destination):
        try:
            # Attempt to download the file
            self.s3.download_file(self.bucket_name, file_path, destination)
            self.logger.info(f'Successfully downloaded file: {file_path} from bucket: {self.bucket_name}')
        except self.s3.exceptions.NoSuchKey as e:
            # Log an error if the file does not exist and re-raise the exception
            self.logger.error(f'File not found in bucket: {self.bucket_name}, file: {file_path}')
            raise e
        except Exception as e:
            # Log any other exceptions and re-raise
            self.logger.error(f'Error occurred while downloading file: {file_path} from bucket: {self.bucket_name}. Error: {str(e)}')
            raise e