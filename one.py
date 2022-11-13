from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("Filter").getOrCreate()

df_pyspark = spark.read.csv("test3.csv", header=True, inferSchema=True)

df_pyspark.show()

df_pyspark.filter("salary <= 30000").show()
df_pyspark.filter("salary <= 30000").select(["Name", "Age"]).show()

df_pyspark.filter("salary <= 30000").filter("age<22").show()
df_pyspark.filter((df_pyspark.salary <= 30000) & (df_pyspark.age < 22)).show()

df_pyspark.filter(~(df_pyspark.salary <= 30000)).show()
