/*
::::    :::: ::::::::::::    .::::::    Company    : NTS-intl
 :::     ::   ::  ::  ::   ::      ::   Author     : Athurg.Feng
 ::::    ::       ::        ::          Maintainer : Athurg.Feng
 :: ::   ::       ::         ::         Project    : 
 ::  ::  ::       ::           :::      FileName   : parttable_to_sql.c
 ::   :: ::       ::             ::     Generate   : 
 ::    ::::       ::       ::      ::   Update     : 2011-06-03 10:48:03
::::    :::     ::::::      ::::::::    Version    : 0.0.1
Description
	用于自动将Cadence库中的电阻阻值和物料号解析并以SQL文件的格式输出。
*/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

//输入文件格式参考
// M:\cadence_schlib\passive\resister\part_table\part.ptf

int main(int argc, char **argv)
{
	FILE *ifp, *ofp;
	char buff[1024] = {0};
	char coe=0;
	double val;
	char part[15];
	int i=0;

	if (argc < 2) {
		printf("	Auto convert resister's part table into sql\n");
		printf("Usage:\n");
		printf("    %s <input file>:\n", argv[0]);
		printf("    %s <input file> <output file>:\n", argv[0]);
		printf("input file: the part.ptf, eg:\n    M:\\cadence_schlib\\passive\\resister\\part_table\\part.ptf\n");
		printf("output file: the output sql file path, leave blank means resister.sql\n");
	}

	ifp = fopen(argv[1], "r");
	ofp = fopen(argc>2 ? argv[2] : "resister.sql", "w");

	fprintf(ofp,"insert into `resister` (`part`, `value`) values \n");
	while (fgets(buff, 1024, ifp)) {
		coe = 0;
		memset(part, sizeof(part), 0);
		if (buff[0]==' ') {
			sscanf(index(buff, '|')+2, "%lf%c", &val, &coe);	//电阻值和倍数（K/M）
			sscanf(index(buff, '=')+2, "%11s", part);		//物料号
			if (toupper(coe)=='K') {
				val*=1000;
			} else if (toupper(coe)=='M') {
				val*=1000000;
			}
			if (i++) fprintf(ofp, ",");
			fprintf(ofp, "('%s','%.2lf')\n", part, val);
		}
		memset(buff, 0, sizeof(buff));
	};

	fclose(ifp);
	fclose(ofp);
}
