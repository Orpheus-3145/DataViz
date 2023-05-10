import pandas as pd
import matplotlib.pyplot as plt
import sys


def load_data(file_name):
    return pd.read_csv(file_name)


def isolate_fields(table):
    # hotel_field = table[0]
    # country_field = table[13].distinct()
    shrink = table["hotel"]#, table["country"]]
    # print(hotel_field)
    # print(country_field)
    return shrink


if __name__ == "__main__":
    file_path = sys.argv[1]
    table = load_data(file_name=file_path)
    print(table.info())
    pd.set_option("display.max_columns", None)
    print(table)
    # small_table = isolate_fields(table)
    # print(small_table)
    # table.plot(kind='line')
    # plt.show()
