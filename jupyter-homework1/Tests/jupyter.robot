*** Settings ***
Library           JupyterLibrary
Suite Setup       Wait For New Jupyter Server To Be Ready
Test Teardown     Reset JupyterLab And Close
Suite Teardown    Terminate All Jupyter Servers

*** Variables ***
${code1}  SEPARATOR=\n
...  import pandas as pd
...  import matplotlib.pyplot as plt
...  import numpy as np
...  import csv
...  import time

${code2}  SEPARATOR=\n
...  column_names = ["Date", "Price"]
...  df = pd.read_csv('/Users/naliyev/PycharmProjects/RobotFramework/jupyter/daily_csv.csv', names = column_names)
...  Date = df.Date.to_list()
...  Price = df.Price.to_list()

${code3}  plt.plot(Date, Price)

*** Test Cases ***
A Notebook in JupyterLab
    Open JupyterLab  browser=chrome
    Launch A New JupyterLab Document
    Add And Run JupyterLab Code Cell  ${code1}
    Add And Run JupyterLab Code Cell  ${code2}
    Wait Until JupyterLab Kernel Is Idle
    Add And Run JupyterLab Code Cell  ${code3}
    Sleep    120s
    Capture Page Screenshot