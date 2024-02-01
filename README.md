# AWS Cost and Usage Report Processor

This project provides a set of tools to download, parse, and convert AWS Cost and Usage Reports (CUR) to JSON format. It is designed to help users analyze their AWS usage and costs more effectively.

## Project Structure

- `aws_cur_processor/`: Main package containing the source code.
  - `src/`: Source code directory for the project modules.
    - `aws_s3_client.py`: Module to handle AWS S3 interactions.
    - `csv_parser.py`: Module to parse CSV files.
    - `json_converter.py`: Module to convert CSV data to JSON format.
  - `tests/`: Directory containing test cases for the project modules.
- `.gitignore`: Git ignore file specifying untracked files and directories.
- `README.md`: Markdown file providing information about the project (this file).

## Setup

To set up the project, follow these steps:

1. Clone the repository:

    ```bash
    git clone git@github.com:jaycdave88/aws_cur_processor.git
    ```

2. Navigate to the project directory:

    ```bash
    cd aws_cur_processor
    ```

3. Create a virtual environment (optional but recommended):

    ```bash
    python -m venv myenv
    source myenv/bin/activate  # On Windows use `myenv\Scripts\activate`
    ```

4. Install the required dependencies:

    ```bash
    pip install -r requirements.txt
    ```

## Usage

To use the AWS CUR processor, you need to have AWS credentials set up with access to the S3 bucket where your CUR files are stored.

1. Set your AWS credentials as environment variables:

    ```bash
    export AWS_ACCESS_KEY_ID=your_access_key
    export AWS_SECRET_ACCESS_KEY=your_secret_key
    export AWS_DEFAULT_REGION=your_region
    ```

2. Run the main script to process the CUR files:

    ```bash
    python main.py
    ```

The script will download the CUR file from the specified S3 bucket, parse the CSV data, convert it to JSON, and save the output to a file named `output.json`.

## Parameters

When calling `main_function`, you need to provide the following parameters:

- `bucket_name`: The name of the AWS S3 bucket where the CUR file is stored.
- `s3_file_path`: The path to the CUR file within the S3 bucket.
- `local_file_path`: The local path where the CUR file will be downloaded.
- `access_key`: Your AWS access key ID.
- `secret_key`: Your AWS secret access key.
- `region`: The AWS region where the S3 bucket is located.

## Contributing

Contributions to the `aws_cur_processor` project are welcome. Please feel free to submit pull requests or create issues for bugs and feature requests.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.