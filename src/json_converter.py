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
            # Initialize the structure for aggregated data
            aggregated_data = {
                'TotalCost': 0.0,
                'ServiceCosts': {},
                'ServiceCount': 0,
                'MonthlyCosts': {}
            }
            for row in data:
                # Extract relevant information
                service = row.get('product/ProductName')
                start_time_str = row.get('lineItem/UsageStartDate')
                cost = float(row.get('lineItem/UnblendedCost', '0.0'))

                # Parse the start time and extract the month
                start_time = datetime.strptime(start_time_str, '%Y-%m-%dT%H:%M:%SZ')
                month = start_time.strftime('%Y-%m')

                # Aggregate total cost
                aggregated_data['TotalCost'] += cost

                # Aggregate costs by service
                if service not in aggregated_data['ServiceCosts']:
                    aggregated_data['ServiceCosts'][service] = 0.0
                    aggregated_data['ServiceCount'] += 1
                aggregated_data['ServiceCosts'][service] += cost

                # Aggregate costs by month
                if month not in aggregated_data['MonthlyCosts']:
                    aggregated_data['MonthlyCosts'][month] = 0.0
                aggregated_data['MonthlyCosts'][month] += cost

            # Check if data was aggregated
            if not aggregated_data['ServiceCosts']:
                logger.warning('No data was aggregated; the resulting JSON will be empty.')

            return json.dumps(aggregated_data, indent=4)
        except Exception as e:
            logger.error(f'Error converting data to JSON: {str(e)}')
            raise