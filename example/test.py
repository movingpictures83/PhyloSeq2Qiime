def test(file1, file2):
   firstfile = open(file1, 'r')
   secondfile = open(file2, 'r')

   contents1 = firstfile.readline()
   contents2 = secondfile.readline()

   idx1 = contents1.find("date")
   idx2 = contents2.find("date")

   print(contents1[idx1:contents1.find(',', idx1)])
   contents1 = contents1.replace(contents1[idx1:contents1.find(',', idx1)], '')
   contents2 = contents2.replace(contents2[idx2:contents2.find(',', idx2)], '')

   if (contents1 != contents2):
       return False
   else:
       return True
