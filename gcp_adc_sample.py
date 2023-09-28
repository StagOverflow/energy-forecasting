from google.cloud import storage


def authenticate_implicit_with_adc(project_id='energy-consumption-396719'):
    # Unlike the rest of our code, we are creating a client without giving it credentials
    storage_client = storage.Client(project=project_id)
    buckets = storage_client.list_buckets()
    print('Buckets: ')
    for bucket in buckets:
        print(bucket.name)

    print('Listed all storage buckets')

