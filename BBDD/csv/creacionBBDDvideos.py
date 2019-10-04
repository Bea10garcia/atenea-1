import csv
oCSV= open ("tvideos.csv","w", encoding ="utf-8")

escritura = csv.writer(oCSV, delimiter= ",")
escritura.writerow(("idvideo", "idcurso" ,"url", "leccion"))
url='https://www.youtube.com/watch?v=G2FCfQj-9ig&list=PLU8oAlHdN5BlvPxziopYZRd55pdqFwkeS&index='
idgen = 0

while idgen< 500:
	

	escritura.writerow((idgen, int(idgen/5) +1, url + str(idgen%10+1), idgen%4 +1))
	idgen +=1

oCSV.close()