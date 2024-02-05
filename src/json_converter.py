import json
import logging

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class JsonConverter:
    @staticmethod
    def convert_to_json(data):
        """
        Convert the provided data into JSON format, focusing on KPI metrics around AWS service by instance type over a month.
        The data is aggregated based on specified cost dimensions. Includes error handling and logging.
        
        :param data: A generator of dictionaries representing the parsed CSV data from an AWS CUR file.
        :return: A JSON string representing the aggregated data or an error message if an exception occurs.
        """
        try:
            # Initialize a dictionary to hold the aggregated data
            aggregated_data = {}
            
            for row in data:
                # Extract relevant information
                service = row.get('product/ProductName')
                instance_type = row.get('lineItem/UsageType')
                cost_dimensions = {
                    'blended': row.get('lineItem/BlendedCost'),
                    'unblended': row.get('lineItem/UnblendedCost'),
                    'net_unblended': row.get('lineItem/NetUnblendedCost'),
                    'amortized': row.get('lineItem/AmortizedCost'),
                    'net_amortized': row.get('lineItem/NetAmortizedCost'),
                    'on_demand': row.get('lineItem/OnDemandCostOfRIHoursUsed')
                }
                
                # Skip rows where 'lineItem/UnblendedCost' is '0' or not relevant
                if not row.get('lineItem/UnblendedCost') or row.get('lineItem/UnblendedCost') == '0':
                    continue
                
                # Aggregate data
                if service not in aggregated_data:
                    aggregated_data[service] = {}
                if instance_type not in aggregated_data[service]:
                    aggregated_data[service][instance_type] = {dimension: 0 for dimension in cost_dimensions}
                
                # Sum up the costs for each dimension
                for dimension, cost in cost_dimensions.items():
                    if cost:  # Ensure there's a cost to add
                        aggregated_data[service][instance_type][dimension] += float(cost)
            
            # Convert the aggregated data to JSON
            return json.dumps(aggregated_data, indent=4)
        except Exception as e:
            # Log the error
            logger.error(f'Error converting data to JSON: {str(e)}')
            # Optionally, return an error message or handle the error as appropriate
            return json.dumps({'error': 'An error occurred during data conversion.'})