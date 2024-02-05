import pytest
import json
from src.json_converter import JsonConverter

@pytest.mark.parametrize("test_data,expected_result", [
    # Test basic aggregation with non-zero unblended cost
    ([
        {'product/ProductName': 'Amazon EC2', 'lineItem/UsageType': 'm5.large', 'lineItem/UnblendedCost': '100'},
        {'product/ProductName': 'Amazon S3', 'lineItem/UsageType': 'Standard', 'lineItem/UnblendedCost': '50'},
     ],
     json.dumps({
         "Amazon EC2": {
             "m5.large": {
                 "blended": 0,
                 "unblended": 100.0,
                 "net_unblended": 0,
                 "amortized": 0,
                 "net_amortized": 0,
                 "on_demand": 0
             }
         },
         "Amazon S3": {
             "Standard": {
                 "blended": 0,
                 "unblended": 50.0,
                 "net_unblended": 0,
                 "amortized": 0,
                 "net_amortized": 0,
                 "on_demand": 0
             }
         }
     }, indent=4)),
])
def test_convert_to_json(test_data, expected_result):
    # Convert the data to JSON
    json_data = JsonConverter.convert_to_json(iter(test_data))

    # Check that the data was converted to JSON correctly
    assert json_data == expected_result