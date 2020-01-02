import os
import unittest

from app import app

class BasicTests(unittest.TestCase):

    def simple_test(self):
        response = self.assertCountEqual(0,1)
        self.assertEqual(response, 1)
 
 
if __name__ == "__main__":
    unittest.main()