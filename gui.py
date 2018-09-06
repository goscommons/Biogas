# file-input.py
# f = open('helloworld.txt','r')
# message = f.read()
# print(message)
# f.close()

## open file
filename = "digester.txt"
file = open(filename,"r")


def get_size():
	for line in file:
		v1=file.readline()
		if (v1.find("el=") != -1) :
			print(v1.find("el="))
			print(v1.find(";"))
			# print(file[start_0:end_0])
			print(v1)
get_size()
# print(file.read())
file.close()

# v1= file.find("el")
# print(v1)
# find brick variables
# for line in file:
	# if

# file.close()
## find dimension variables

# v1=(file.readline())
# print (v1)
##print file.readline()
