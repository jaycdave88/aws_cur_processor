import boto3
import pytest
from moto import mock_aws
from src.aws_s3_client import AwsS3Client
from unittest import mock
from botocore.exceptions import ClientError

@mock_aws
def test_download_file():
    # Set up mock S3 bucket and file
    bucket_name = 'test-bucket'
    file_name = 'test-file'
    file_content = 'Hello, World!'
    s3 = boto3.resource('s3')
    s3.create_bucket(Bucket=bucket_name)
    s3.Object(bucket_name, file_name).put(Body=file_content)

    # Initialize AwsS3Client and download file
    client = AwsS3Client(bucket_name, 'access_key', 'secret_key', 'region')
    destination = '/tmp/test-file'
    client.download_file(file_name, destination)

    # Check that the file was downloaded correctly
    with open(destination, 'r') as f:
        assert f.read() == file_content

@mock_aws
def test_download_file_not_found():
    # Set up mock S3 bucket
    bucket_name = 'test-bucket'
    s3 = boto3.resource('s3')
    s3.create_bucket(Bucket=bucket_name)

    # Initialize AwsS3Client
    client = AwsS3Client(bucket_name, 'access_key', 'secret_key', 'region')

    # Mock the logger to capture log messages
    with mock.patch.object(client, 'logger', autospec=True) as mock_logger:
        # Attempt to download a non-existent file
        with pytest.raises(ClientError):
            client.download_file('non_existent_file', '/tmp/non_existent_file')

    # Check that an error was logged
    mock_logger.error.assert_called()

@mock_aws
def test_download_file_unexpected_error():
    # Define bucket_name
    bucket_name = 'test-bucket'
    
    # Initialize AwsS3Client with a non-existent bucket
    client = AwsS3Client(bucket_name, 'access_key', 'secret_key', 'region')

    # Mock the logger to capture log messages
    with mock.patch.object(client, 'logger', autospec=True) as mock_logger:
        # Attempt to download a file from a non-existent bucket
        with pytest.raises(ClientError):
            client.download_file('test-file', '/tmp/test-file')

    # Check that an error was logged
    mock_logger.error.assert_called()