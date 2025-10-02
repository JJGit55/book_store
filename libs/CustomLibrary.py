import random
import string
import pandas as pd
from pathlib import Path
from datetime import date
from robot.api.deco import keyword, library

@library
class CustomLibrary:
    def __init__(self):
        self.test_data_dir = Path(__file__).resolve().parents[1] / "resources" / "test_data"

    # ---------- CSV helpers ----------
    def _pick_random_row(self, csv_filename: str) -> dict:
        """
        Picks random row from csv-data file
        """
        csv_path = self.test_data_dir / csv_filename
        df = pd.read_csv(csv_path, dtype=str).fillna("")
        df.columns = [col.strip() for col in df.columns]
        return df.sample(n=1).iloc[0].to_dict()
    
    @keyword
    def get_billing_data(self, csv_path: str = "billing_data.csv"):
        """
        Returns random billing data 
        """
        return self._pick_random_row(csv_path)   