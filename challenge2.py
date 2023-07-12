import requests
import json

def get_aws_instance_metadata(key=None):
    base_url = 'http://169.254.169.254/latest/meta-data/'
    if key:
        url = base_url + key
    else:
        url = base_url

    try:
        response = requests.get(url)
        response.raise_for_status()
        if key:
            return {key: response.text}
        else:
            metadata = response.text.split('\n')
            metadata_dict = {}
            for item in metadata:
                if item:
                    metadata_dict[item] = requests.get(url + item).text
            return metadata_dict
    except requests.exceptions.RequestException as e:
        print("Error retrieving metadata:", e)
        exit(1)

# Check if the script is running on an AWS instance
try:
    response = requests.get('http://169.254.169.254/latest/meta-data/instance-id')
    response.raise_for_status()
except requests.exceptions.RequestException:
    print("This script must be run on an AWS EC2 instance.")
    exit(1)

# Get individual data key
key = input("Enter the data key to retrieve (leave blank to get all metadata): ")

if key:
    metadata = get_aws_instance_metadata(key)
else:
    metadata = get_aws_instance_metadata()

print(json.dumps(metadata, indent=4))