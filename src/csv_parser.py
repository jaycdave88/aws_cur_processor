import csv
import gzip
import os
import logging

class CsvParser:
    def __init__(self, file_path):
        self.file_path = file_path
        # Set up logging
        logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
        self.logger = logging.getLogger(__name__)

    def parse_csv(self):
        data = []
        try:
            # Check if the file is compressed (.gz) and open accordingly
            if self.file_path.endswith('.gz'):
                with gzip.open(self.file_path, 'rt') as f:
                    reader = csv.DictReader(f)
                    for row in reader:
                        data.append(row)
            else:
                with open(self.file_path, 'r') as f:
                    reader = csv.DictReader(f)
                    for row in reader:
                        data.append(row)
            self.logger.info(f'Successfully parsed file: {self.file_path}')
        except FileNotFoundError:
            self.logger.error(f'File not found: {self.file_path}')
        except Exception as e:
            self.logger.error(f'Error occurred while parsing file: {self.file_path}. Error: {str(e)}')
        return data