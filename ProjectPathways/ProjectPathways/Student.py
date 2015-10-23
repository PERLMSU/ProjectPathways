"""
custom data container
"""

class Student:
    """
    Custom data container for student data
    """
    def __init__(self, student_id):
        """
        id : str : anonymous course id
        courses : dictionary : course ids
        demographics : dictionary : course ids
        """
        self.student_id = student_id
        self.courses = {}
        self.demographics = {}
        #return super().__init__(id)

    def append_courses(self, year, courses):
        """
        adds courses to courses by year
        """
        self.courses[year] = courses

    def append_demographics(self, demographic_id, data):
        """
        adds demographic data by type
        """
        self.demographics[demographic_id] = data

