import pytest
import os
from src.csv_parser import CsvParser
from unittest import mock

def test_parse_csv():
    # Create a test CSV file
    test_file_path = '/tmp/test.csv'
    with open(test_file_path, 'w') as f:
        f.write('column1,column2,column3\n')
        f.write('value1,value2,value3\n')
        f.write('value4,value5,value6\n')

    # Initialize CsvParser and parse the CSV file
    csv_parser = CsvParser(test_file_path)
    data = csv_parser.parse_csv()

    # Check that the CSV file was parsed correctly
    expected_data = [
        {'column1': 'value1', 'column2': 'value2', 'column3': 'value3'},
        {'column1': 'value4', 'column2': 'value5', 'column3': 'value6'},
    ]
    assert data == expected_data

def test_parse_csv_file_not_found():
    # Initialize CsvParser with a non-existent file
    csv_parser = CsvParser('/tmp/non_existent.csv')

    # Mock the logger to capture log messages
    with mock.patch.object(csv_parser, 'logger', autospec=True) as mock_logger:
        data = csv_parser.parse_csv()

    # Check that an error was logged
    mock_logger.error.assert_called_once_with('File not found: /tmp/non_existent.csv')

    # Check that no data was returned
    assert data == []

def test_parse_csv_unexpected_error():
    # Initialize CsvParser with a directory instead of a file
    csv_parser = CsvParser('/tmp')

    # Mock the logger to capture log messages
    with mock.patch.object(csv_parser, 'logger', autospec=True) as mock_logger:
        data = csv_parser.parse_csv()

    # Check that an error was logged
    assert 'Error occurred while parsing file' in str(mock_logger.error.call_args[0])

    # Check that no data was returned
    assert data == []