# GitHub Status Checker

This Python script checks the current operational status of GitHub by querying the GitHub Status API. It reports whether GitHub is fully operational or if there are any ongoing incidents.

## Features

- Fetches the current status from the GitHub Status API.
- Outputs whether GitHub is fully operational or experiencing issues.
- Lists ongoing incidents with details and status.
- Handles common errors (e.g., network errors, HTTP errors, and JSON parsing errors).

## Requirements

- Python 3.x
- `requests` library

## Installation

1. Clone this repository or download the script.

2. Install the required `requests` library if you haven't done so already:

   ```bash
   pip install requests
   ```

## Usage

Run the script using Python:

```bash
python github_status_checker.py
```

## Output

The script will output one of the following messages:

- **GitHub is fully operational.**
- **GitHub is experiencing issues: [status description].**
- A list of ongoing incidents, if any.

## Error Handling

The script gracefully handles various errors, including:

- HTTP errors (e.g., 404, 500)
- Connection errors
- Request timeouts
- JSON parsing errors