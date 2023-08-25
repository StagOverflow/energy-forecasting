#!/bin/bash

# Build and publish the feature-pipeline, training-pipeline, and batch-prediction-pipeline packages.
# This is done so that the pipelines can be run from the CLI.
# The pipelines are executed in the feature-pipeline, training-pipeline, and batch-prediction-pipeline
# directories, so we must change directories before building and publishing the packages.
# The my-pypi repository must be defined in the project's poetry.toml file.

cd feature-pipeline
/home/heinrl/.local/bin/poetry build
/home/heinrl/.local/bin/poetry publish -r my-pypi

cd ../training-pipeline
/home/heinrl/.local/bin/poetry build
/home/heinrl/.local/bin/poetry publish -r my-pypi

cd ../batch-prediction-pipeline
/home/heinrl/.local/bin/poetry build
/home/heinrl/.local/bin/poetry publish -r my-pypi
