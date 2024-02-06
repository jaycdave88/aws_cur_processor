import json
import logging
from datetime import datetime

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class JsonConverter:
    @staticmethod
    def convert_to_json(data):
        try:
            aggregated_data = {}
            for row in data:
                # Extract relevant information
                service = row.get('product/ProductName')
                instance_type = row.get('lineItem/UsageType')
                start_time_str = row.get('lineItem/UsageStartDate')
                cost = float(row.get('lineItem/UnblendedCost', '0.0'))

                # Parse the start time and extract the hour
                start_time = datetime.strptime(start_time_str, '%Y-%m-%dT%H:%M:%SZ')
                hour = start_time.strftime('%Y-%m-%d %H:00:00')

                # Initialize nested dictionaries if necessary
                if service not in aggregated_data:
                    aggregated_data[service] = {}
                if hour not in aggregated_data[service]:
                    aggregated_data[service][hour] = {'cost': 0.0, 'instance_types': {}}

                # Sum up the costs for each service per hour
                aggregated_data[service][hour]['cost'] += cost

                # Track instance types and their costs
                if instance_type not in aggregated_data[service][hour]['instance_types']:
                    aggregated_data[service][hour]['instance_types'][instance_type] = 0.0
                aggregated_data[service][hour]['instance_types'][instance_type] += cost

            # Check if data was aggregated
            if not aggregated_data:
                logger.warning('No data was aggregated; the resulting JSON will be empty.')

            return json.dumps(aggregated_data, indent=4)
        except Exception as e:
            logger.error(f'Error converting data to JSON: {str(e)}')
            raise
