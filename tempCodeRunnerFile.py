from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Filter").getOrCreate()

df_pyspark = spark.read.csv("test3.csv", header=True, inferSchema=True)

df_pyspark.show()