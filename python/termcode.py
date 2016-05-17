class term_codes:
    def __init__(self):
        term_codes = []
        for x in range(100):
            if x < 10:
                term_codes.append('SS0'+str(x))
                term_codes.append('US0'+str(x))
                term_codes.append('FS0'+str(x))
            else:
                term_codes.append('SS'+str(x))
                term_codes.append('US'+str(x))
                term_codes.append('FS'+str(x))
        self.termcode_lookup = {}
        for code, index in zip(term_codes, range(len(term_codes))):
            self.termcode_lookup[code] = index
            
    def semesters_since_enrollement(self, start, current):
        return abs(self.termcode_lookup[start] - self.termcode_lookup[current])
