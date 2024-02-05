import csv
import gzip
import logging

class CsvParser:
    def __init__(self, file_path):
        self.file_path = file_path
        # Set up logging
        logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
        self.logger = logging.getLogger(__name__)
        
    def parse_csv(self):
        # Process each row as needed while iterating over the generator
        for row in self._parse_file():
            yield row

    def _parse_file(self):
        try:
            # Check if the file is compressed (.gz) and open accordingly
            open_func = gzip.open if self.file_path.endswith('.gz') else open
            with open_func(self.file_path, 'rt', encoding='utf-8') as f:
                reader = csv.DictReader(f)
                for row in reader:
                    # Process each row as needed. Here, we simply yield the row.
                    yield row
            self.logger.info(f'Successfully parsed file: {self.file_path}')
        except FileNotFoundError:
            self.logger.error(f'File not found: {self.file_path}')
            raise
        except Exception as e:
            self.logger.error(f'Error occurred while parsing file: {self.file_path}. Error: {str(e)}')
            raise