
# ref: https://developers.google.com/protocol-buffers/docs/cpptutorial

PATH_PROTOBUF := /home/hbzhou/TF/tensorflow/tensorflow/contrib/makefile/gen/protobuf

.PHONY: all
all: write read

addressbook:
	g++ -c $@.pb.cc -I${PATH_PROTOBUF}/include -L${PATH_PROTOBUF}/lib -lprotobuf -o $@

write: addressbook
	g++ $< write_addressbook.cc -I${PATH_PROTOBUF}/include -L${PATH_PROTOBUF}/lib -lprotobuf -o $@

read: addressbook
	g++ $< read_addressbook.cc -I${PATH_PROTOBUF}/include -L${PATH_PROTOBUF}/lib -lprotobuf -o $@

clean:
	rm addressbook write read
