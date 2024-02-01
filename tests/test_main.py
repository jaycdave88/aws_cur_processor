import os
import pytest
from moto import mock_aws
import boto3
from unittest import mock
from aws_cur_processor.main import main_function

# Mock AWS Credentials
AWS_ACCESS_KEY = "fake_access_key"
AWS_SECRET_KEY = "fake_secret_key"
REGION = "us-west-2"

# Define the variables
bucket_name = 'your_bucket_name'
s3_file_path = 'path_to_file_on_s3'
local_file_path = 'local_file.csv'

@pytest.fixture
def aws_credentials():
    """Mocked AWS Credentials for moto."""
    with mock.patch.dict(os.environ, {
        "AWS_ACCESS_KEY_ID": AWS_ACCESS_KEY,
        "AWS_SECRET_ACCESS_KEY": AWS_SECRET_KEY,
        "AWS_DEFAULT_REGION": REGION,
        "AWS_S3_BUCKET_NAME": bucket_name,
        "AWS_S3_FILE_PATH": s3_file_path,
        "LOCAL_FILE_PATH": local_file_path
    }):
        yield

@pytest.fixture
def s3_setup(aws_credentials):
    with mock_aws():
        s3 = boto3.resource('s3', region_name=REGION)
        s3.create_bucket(Bucket=bucket_name, CreateBucketConfiguration={'LocationConstraint': REGION})
        obj = s3.Object(bucket_name, s3_file_path)
        obj.put(Body='column1,column2,column3\nvalue1,value2,value3\nvalue4,value5,value6\n')
        yield

def test_main_flow(s3_setup):
    # Mock file writing to avoid actually creating a file
    with mock.patch("builtins.open", mock.mock_open()) as mocked_file:
        # Set environment variables before calling main_function
        os.environ['AWS_S3_BUCKET_NAME'] = bucket_name
        os.environ['AWS_S3_FILE_PATH'] = s3_file_path
        os.environ['LOCAL_FILE_PATH'] = local_file_path
        os.environ['AWS_ACCESS_KEY_ID'] = AWS_ACCESS_KEY
        os.environ['AWS_SECRET_ACCESS_KEY'] = AWS_SECRET_KEY
        os.environ['AWS_DEFAULT_REGION'] = REGION

        # Call main_function with environment variables set
        main_function(bucket_name, s3_file_path, local_file_path, AWS_ACCESS_KEY, AWS_SECRET_KEY, REGION)

        # Assert that 'open' was called to write 'output.json'
        calls = [mock.call('output.json', 'w'), mock.call().write(mock.ANY)]
        mocked_file.assert_has_calls(calls, any_order=True)