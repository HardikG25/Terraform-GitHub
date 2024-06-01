import os

def lambda_handler(event, context):
    return "Hello {}!".format(os.environ('name'))