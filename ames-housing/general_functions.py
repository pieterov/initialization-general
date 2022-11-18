# Nov 2022: These functions are supporting the Jupyter Notebook 'Ames Housing - by Pieter.ipynb'

# Import packages.

# Load selected functions from packages
from collections import Counter
from pandas.api.types import is_numeric_dtype
from scipy.stats import pearsonr
from sklearn.model_selection import train_test_split

# Load function families from packages
from sklearn import metrics

# Load complete packages
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import sys


# To concatenate values.
def f_concat(v_input, b_quotation = False):

    # Initialize.
    dummy = ""
    n_len = len(v_input)

    # Assign quotation
    if(b_quotation):
        c_quotation = "'"
    else:
        c_quotation = ""

    if n_len == 0:
        return None
    
    if n_len == 1:
        return c_quotation + v_input[0] + c_quotation

    # Loop through text elements.
    for i in range(n_len-1):
        dummy = dummy + c_quotation + v_input[i] + c_quotation + ", "

    # Append last element.
    dummy = dummy + "and " + c_quotation + v_input[n_len-1] + c_quotation

    # Return result.
    return dummy
    

# To describe the dataframe
def f_describe(df_input, n_top = 10):
    
    # Determine columns of the same data type.
    # https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.select_dtypes.html
    # https://numpy.org/doc/stable/reference/arrays.scalars.html
    df_integer  = df_input.select_dtypes(include = np.integer)
    df_floating = df_input.select_dtypes(include = np.floating)
    df_object   = df_input.select_dtypes(include = object)
    df_other    = df_input.select_dtypes(exclude = [np.integer, np.floating, object])

    # Overall stats
    print("The data:\n")
    print(f"-> Dimension:        {df_input.shape[0]} observations and {df_input.shape[1]} columns.\n")
    print(f"-> Size:             {round(sys.getsizeof(df_input)/1024/1024, 1)} MB.\n")
    print(f"-> Integer data in:  {f_concat(np.sort(df_integer.columns))}.\n")
    print(f"-> Floating data in: {f_concat(np.sort(df_floating.columns))}.\n")
    print(f"-> Object data in:   {f_concat(np.sort(df_object.columns))}.\n\n")
    print(f"-> Other data in:   {f_concat(np.sort(df_other.columns))}.\n\n")

    # Show first 'n_top' rows of the data.
    print("Show data (first " + str(n_top) + " rows, this number can be altered through 'n_top' in the function call):\n")
    display(df_input.head(n_top))
  
    # Describe integer columns
    if len(df_integer.columns):
        print("\n\nDescribe integer data:")
        display(df_integer.describe())

    # Describe floating columns
    if len(df_floating.columns):
        print("\n\nDescribe floating data:")
        display(df_floating.describe())

    # Describe object columns
    if len(df_object.columns):
        print("\n\nDescribe object data:")
        display(df_object.describe())

    # Describe other columns
    if len(df_other.columns):
        print("\n\nDescribe other data:")
        display(df_other.describe())

    # Show columns with missing data.
    v_total_missing   = df_input.isnull().sum()
    v_percent_missing = round(v_total_missing / df_input.shape[0] * 100, 1)
    v_missing_type    = df_input.dtypes

    df_missing_data = pd.DataFrame({'type': v_missing_type, 'total': v_total_missing, 'percent': v_percent_missing})
    df_missing_data = df_missing_data.sort_values(by='total', ascending = False)
    df_missing_data = df_missing_data[df_missing_data.total > 0]

    if(df_missing_data.shape[0] == 0):
      print("")
      print("None of the columns have missing data!")
    else:
      print("\n\nShow missing data:")
      display(df_missing_data)




# To give information on a column in a dataframe.
def f_freq(df_input, c_col, n_top = 10, n_font_size = 20):

    # Do not calculate the frequency table in case the feature has unique values.
    #if (len(set(df_input[c_col])) == len(df_input[c_col])):
    if (df_input[c_col]).is_unique:

      print("Column '" + c_col + "' consists of unique values.\n")

    if (len(set(df_input[c_col])) == 1):
      print("Column '" + c_col + "' consists of the same value.\n")

    # Bereken frequenties.
    c = Counter(df_input[c_col])

    # Converteer naar data frame.
    df_output         = pd.DataFrame(list(c.items()))

    # Hernoem kolomnamen.
    df_output.columns = ["level", "n"]

    # Bereken percentage.
    df_output["perc"] = round(100 * df_output["n"] / df_input.shape[0], 1).astype(str) + "%"

    # Sorteer data frame op frequentie.
    df_output         = df_output.sort_values(by = "n", ascending = False)

    if(df_output.shape[0] <= n_top):
            c_message = "we show all " + str(df_output.shape[0]) + " levels:"
            n_top     = df_output.shape[0]
            
    else:
            c_message = "we show the Top-" + str(n_top) + " of the " + str(df_output.shape[0]) + " levels:"
        
    # Print header
    print("Frequency of values in colum '" + c_col + "', " + c_message + "\n")

    #print(f"Number of NA: {df_input[c_col].isna().sum()} ({round(100 * df_input[c_col].isna().sum() / df_input.shape[0], 1)}%)\n")
            
    display(df_output.head(n_top))

    print("\n")

    # Plot frequency n_top elements.
    ax = df_input[c_col].value_counts(sort = True, ascending = False)[0:n_top].plot(kind='barh')
    ax.invert_yaxis()
    ax.set_ylabel(c_col)

# https://stackoverflow.com/questions/3899980/how-to-change-the-font-size-on-a-matplotlib-plot
    for item in (ax.get_xticklabels() + ax.get_yticklabels()):
        item.set_fontsize(n_font_size)

    for item in [ax.xaxis.label, ax.yaxis.label]:
        item.set_fontsize(n_font_size + 4)




# To define the order of the neighborhoods by median of the numerical column. This is used when plotting boxplots.
def f_neighborhood_order(df_input, c_col):

  if(not is_numeric_dtype(df_input[c_col])):
    print(f"Column {c_col} is not numeric!")
    return
 
  v_neighborhood_order = df_input.groupby(
      
      ['Neighborhood']

      ).median()[[c_col]].sort_values(
          
          by = c_col, ascending = True
          
          ).index.values

  return v_neighborhood_order


# To calculate correlation coefficients in PairGrid plot.
def reg_coef(v_x, v_y, label = None, color = None, **kwargs):

    ax = plt.gca()
    r,p = pearsonr(v_x, v_y)
    ax.annotate('r = {:.2f}'.format(r), xy=(0.5, 0.5), xycoords = 'axes fraction', ha = 'center')
    ax.set_axis_off()


# Plot heatmap of correlation coefficients.
def f_heatmap(df_input, v_features_to_show):

    plt.rcParams['figure.figsize'] = (15, 15)
    
    df_cor = df_input[v_features_to_show].corr()
    
    m_matrix = np.triu(df_cor)

    sns.heatmap(df_cor, square=True, cmap= 'coolwarm', mask = m_matrix);


# Perform train/test split and share dimensions with user.
def f_train_test_split(df_X, v_y):

    df_X_train, df_X_test, v_y_train, v_y_test = train_test_split(df_X, v_y, test_size=0.33, random_state=42)

    print(f"Dimension of df_X_train:                       {df_X_train.shape[0]} by {df_X_train.shape[1]}")
    print(f"Dimension of df_X_test:                        {df_X_test.shape[0]}  by {df_X_test.shape[1]}")

    print(f"Length of v_y_train:                           {v_y_train.shape[0]}")
    print(f"Length of v_y_test:                            {v_y_test.shape[0]}\n")

    print(f"Combined number of rows in train and test set: {v_y_train.shape[0] + v_y_test.shape[0]}")
    print(f"Original number of rows:                       {df_X.shape[0]}")
    print(f"Actual split:                                  {round(v_y_test.shape[0]/v_y.shape[0], 2)}")

    return df_X_train, df_X_test, v_y_train, v_y_test


# Share model evaluation results with the user.
def f_evaluation_results(v_y_true, v_y_pred):

    print("Performance Metrics:")
    print(f"MAE:  {metrics.mean_absolute_error(v_y_true, v_y_pred):,.1f}")
    print(f"MSE:  {metrics.mean_squared_error(v_y_true, v_y_pred):,.1f}")
    print(f"RMSE: {metrics.mean_squared_error(v_y_true, v_y_pred, squared=False):,.1f}")