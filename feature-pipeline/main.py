import click
from datetime import datetime
from feature_pipeline import utils
from feature_pipeline import pipeline


@click.command()
@click.option('--export_end_reference_datetime', type=click.DateTime(formats=["%Y-%m-%d %H:%M:%S.%f%z", "%Y-%m-%d %H:%M:%S%z"]), required=True)
@click.option('--days_delay', type=click.INT, required=True)
@click.option('--days_export', type=click.INT, required=True)
@click.option('--url', type=click.STRING, required=True)
@click.option('--feature_group_version', type=click.INT, required=True)
def run_feature_pipeline(
        export_end_reference_datetime: str,
        days_delay: int,
        days_export: int,
        url: str,
        feature_group_version: int,
) -> dict:
    """
    Run the feature pipeline.

    Args:
        export_end_reference_datetime: The end reference datetime of the export window. If None, the current time is used.
            Because the data is always delayed with "days_delay" days, this date is used only as a reference point.
            The real extracted window will be computed as [export_end_reference_datetime - days_delay - days_export, export_end_reference_datetime - days_delay].

        days_delay : int
            Data has a delay of N days. Thus, we have to shift our window with N days.

        days_export : int
            The number of days to export.

        url : str
            URL to the raw data.

        feature_group_version : int
            Version of the feature store feature group to use.

    Returns:
        Metadata of the feature pipeline run.
    """

    logger = utils.get_logger(__name__)

    export_end_reference_datetime = export_end_reference_datetime.replace(
        microsecond=0, tzinfo=None
    )

    logger.info(f"export_end_datetime = {export_end_reference_datetime}")
    logger.info(f"days_delay = {days_delay}")
    logger.info(f"days_export = {days_export}")
    logger.info(f"url = {url}")
    logger.info(f"feature_group_version = {feature_group_version}")

    return pipeline.run(
        export_end_reference_datetime=export_end_reference_datetime,
        days_delay=days_delay,
        days_export=days_export,
        url=url,
        feature_group_version=feature_group_version,
    )


if __name__ == '__main__':
    run_feature_pipeline()
