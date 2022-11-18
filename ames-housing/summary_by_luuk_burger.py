# May 2022: These functions were developed by Luuk Burger and kindly shared for wider use.

import pandas as pd
import numpy as np


def f_df_summary(df: pd.DataFrame, highlight: bool):
    '''
    Function for generating summary statistics for a DataFrame. Statistics are split into two sets:
    - statistics on NUMERICAL columns
    - statistics on CATEGORICAL columns
    BEWARE: returns two DataFrame's if "highlight=False"; returns two Styler's if "highlight=True".
    '''

    # Summary statistics for NUMERICAL columns.
    df_num = df.select_dtypes(include=[np.number])

    df_num_top_freq_value = pd.Series({col: df_num[col].value_counts().idxmax() for col in df_num})
    df_num_top_freq_count = pd.Series({col: df_num[col].value_counts().max() for col in df_num})
    df_num_top_freq_pct = pd.Series({col: (df_num[col].value_counts().max() / df_num[col].count() * 100) for col in df_num})
    df_num_top_freq_vs_2nd = pd.Series({col: (df_num[col].value_counts().max() / df_num[col].value_counts().nlargest(2).iloc[1]) for col in df_num})

    df_num_summary = pd.DataFrame({'data_type': df_num.dtypes,
                                   'count_non_null': df_num.count(axis='index'),
                                   'count_null': df_num.isnull().sum(),
                                   'pct_null': (df_num.isnull().sum() / df_num.shape[0] * 100),
                                   'count_unique': df_num.nunique(axis='index', dropna=True),
                                   'top_freq_value': df_num_top_freq_value,
                                   'top_freq_count': df_num_top_freq_count,
                                   'top_freq_pct': df_num_top_freq_pct,
                                   'top_freq_vs_2nd': df_num_top_freq_vs_2nd,
                                   '25-quantile': df_num.quantile(q=0.25, axis='index'),
                                   '50-quantile': df_num.quantile(q=0.50, axis='index'),
                                   '75-quantile': df_num.quantile(q=0.75, axis='index'),
                                   'min': df_num.min(axis='index', skipna=True),
                                   'max': df_num.max(axis='index', skipna=True),
                                   'mean': df_num.mean(axis='index', skipna=True),
                                   'median': df_num.median(axis='index', skipna=True),
                                   'std': df_num.std(axis='index', skipna=True),
                                   'variance': df_num.var(axis='index', skipna=True),
                                   'skewness': df_num.skew(axis='index', skipna=True),
                                   'excess_kurtosis': df_num.kurt(axis='index', skipna=True)
                                   })

    # Summary statistics for CATEGORICAL columns.
    df_cat = df.select_dtypes(include=[object, bool])

    df_cat_top_freq_value = pd.Series({col: df_cat[col].value_counts().idxmax() for col in df_cat})
    df_cat_top_freq_count = pd.Series({col: df_cat[col].value_counts().max() for col in df_cat})
    df_cat_top_freq_pct = pd.Series({col: (df_cat[col].value_counts().max() / df_cat[col].count() * 100) for col in df_cat})
    df_cat_top_freq_vs_2nd = pd.Series({col: (df_cat[col].value_counts().max() / df_cat[col].value_counts().nlargest(2).iloc[1]) for col in df_cat})

    df_cat_summary = pd.DataFrame({'data_type': df_cat.dtypes,
                                   'count_non_null': df_cat.count(axis='index'),
                                   'count_null': df_cat.isnull().sum(),
                                   'pct_null': (df_cat.isnull().sum() / df_num.shape[0]) * 100,
                                   'count_unique': df_cat.nunique(axis='index', dropna=True),
                                   'top_freq_value': df_cat_top_freq_value,
                                   'top_freq_count': df_cat_top_freq_count,
                                   'top_freq_pct': df_cat_top_freq_pct,
                                   'top_freq_vs_2nd': df_cat_top_freq_vs_2nd
                                   })

    # Return with or without highlighting.
    if highlight == False:
        return df_num_summary.T, df_cat_summary.T
    elif highlight == True:
        return df_num_summary.T.style.apply(_highlight_summary, axis='index'), df_cat_summary.T.style.apply(_highlight_summary, axis='index')


def _highlight_summary(row: pd.Series) -> list:
    '''
    Function for highlighting interesting values in the summary statistics DataFrame.
    '''

    # Boundaries
    pct_null_high = 10.00
    pct_null_low = 0.00
    top_freq_vs_2nd_high = 20.00
    top_freq_vs_2nd_low = 5.00
    skewness_high = 1.00
    skewness_low = 0.50
    excess_kurtosis_high = 1.00

    # Return value
    highlights = []

    for i, v in row.iteritems():
        if i == 'pct_null':
            if pct_null_high <= v:
                highlights.append("background-color:#FFEA00")
            elif pct_null_low < v < pct_null_high:
                highlights.append("background-color:#FFFF99")
            else:
                highlights.append("")
        elif i == 'top_freq_vs_2nd':
            if top_freq_vs_2nd_high <= v:
                highlights.append("background-color:#FFEA00")
            elif top_freq_vs_2nd_low <= v < top_freq_vs_2nd_high:
                highlights.append("background-color:#FFFF99")
            else:
                highlights.append("")
        elif i == 'skewness':
            if skewness_high <= v:
                highlights.append("background-color:#00B400")
            elif skewness_low <= v < skewness_high:
                highlights.append("background-color:#CCFFCC")
            elif v <= -skewness_high:
                highlights.append("background-color:#D40000")
            elif -skewness_high < v <= -skewness_low:
                highlights.append("background-color:#FFCCCC")
            else:
                highlights.append("")
        elif i == 'excess_kurtosis':
            if excess_kurtosis_high <= v:
                highlights.append("background-color:#00B400")
            elif v <= -excess_kurtosis_high:
                highlights.append("background-color:#D40000")
            else:
                highlights.append("")
        else:
            highlights.append("")

    return highlights
