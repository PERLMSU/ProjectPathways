
class Student:
    
    def __init__(self, id):
        self.id = id
        self.courses = {}
        self.demographics = {}
        return super().__init__(id)

    def append_courses(self, year, courses):
        self.courses[year] = courses

    def append_demographics(self, demographic_id, data):
        self.demographics[demographic_id] = data

