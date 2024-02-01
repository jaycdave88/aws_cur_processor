import pytest
from moto import mock_aws
from aws_cur_processor.main import main_function
import boto3
from unittest import mock
from src.aws_s3_client import AwsS3Client
from src.csv_parser import CsvParser
from src.json_converter import JsonConverter

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
    with mock.patch("boto3.Session", autospec=True) as mock_session:
        mock_session.return_value.get_credentials.return_value = boto3.Session(
            aws_access_key_id=AWS_ACCESS_KEY,
            aws_secret_access_key=AWS_SECRET_KEY,
            region_name=REGION
        ).get_credentials()
        yield

@pytest.fixture
def s3_setup(aws_credentials):
    with mock_aws():
        s3 = boto3.resource('s3', region_name=REGION)
        s3.create_bucket(Bucket=bucket_name)
        obj = s3.Object(bucket_name, s3_file_path)
        obj.put(Body='column1,column2,column3\nvalue1,value2,value3\nvalue4,value5,value6\n')
        yield

def test_main_flow(s3_setup):
    # Mock file writing to avoid actually creating a file
    with mock.patch("builtins.open", mock.mock_open()) as mocked_file:
        main_function(bucket_name, s3_file_path, local_file_path, AWS_ACCESS_KEY, AWS_SECRET_KEY, REGION)

        # Assert that 'open' was called to write 'output.json'
        calls = [mock.call('output.json', 'w'), mock.call().write(mock.ANY)]
        mocked_file.assert_has_calls(calls, any_order=True)