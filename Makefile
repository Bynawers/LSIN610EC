LDFLAGS="-L/usr/local/opt/flex/lib"

run: exam
#	cat prog.qst | ./exam
	echo "Pierre 12, 13, 8\nPaul 4, 6\nJack 14" | ./exam

exam: exam.tab.c exam.yy.c
	gcc -o $@ $^ ${LDFLAGS} -ly -lfl
# gcc -mmacosx-version-min=12.3 -o $@ $^ ${LDFLAGS} -ly -lfl

exam.tab.c: exam.y
	bison -d -v $^

exam.yy.c: exam.l
	flex -o $@ $^

clean:
	rm -f exam exam.output exam.vcg
	rm -f exam.tab.c exam.tab.h
	rm -f exam.yy.c

LADIR="BISON"

zip:
	rm -rf ${LADIR}
	mkdir ${LADIR}
	cp exam.l exam.y Makefile ${LADIR}
	rm -f ${LADIR}.zip
	zip -r ${LADIR}.zip ${LADIR}
	rm -rf ${LADIR}
