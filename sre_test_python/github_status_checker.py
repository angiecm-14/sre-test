import requests

def check_github_status():
    url = "https://www.githubstatus.com/api/v2/summary.json"
    
    try:
        # Make a GET request to the GitHub Status API
        response = requests.get(url)
        response.raise_for_status()  # Raise an error for bad responses (4xx or 5xx)
        
        # Parse the JSON response
        data = response.json()
        overall_status = data.get("status", {}).get("description", "No status available.")
        incidents = data.get("incidents", [])
        
        # Output the overall status
        if "operational" in overall_status.lower():
            print("GitHub is fully operational.")
        else:
            print(f"GitHub is experiencing issues: {overall_status}")
        
        # Check if there are any ongoing incidents
        if incidents:
            print("Ongoing incidents:")
            for incident in incidents:
                print(f"- {incident['name']}: {incident['status']} (Details: {incident['shortlink']})")

    except requests.exceptions.HTTPError as http_err:
        print(f"HTTP error occurred: {http_err}")
    except requests.exceptions.ConnectionError:
        print("Connection error occurred. Please check your network connection.")
    except requests.exceptions.Timeout:
        print("The request timed out.")
    except requests.exceptions.RequestException as err:
        print(f"An error occurred: {err}")
    except ValueError as json_err:
        print(f"Error parsing JSON response: {json_err}")

if __name__ == "__main__":
    check_github_status()