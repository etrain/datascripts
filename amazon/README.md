# Amazon Reviews Data Processor

These scripts process Amazon Reviews Dataset available from here:
http://jmcauley.ucsd.edu/data/amazon/ 

The main role of these scripts is twofold:

1. Split the data into multiple, large chunks of 250000 reviews. This makes the compressed data amenable to reading from e.g. HDFS with Spark.
2. Convert the data to valid json. The raw data is not valid json, and so must be preprocessed before being used in non-python tools.

This is a one-time job that's CPU-intensive but can be done in an hour or two.


Example usage:

	bash split_archive.sh aggressive_dedup.json.gz processed_json
