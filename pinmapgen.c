/*
::::    :::: ::::::::::::    .::::::    Company    : NTS-intl
 :::     ::   ::  ::  ::   ::      ::   Author     : Athurg.Feng
 ::::    ::       ::        ::          Maintainer : Athurg.Feng
 :: ::   ::       ::         ::         Project    : 
 ::  ::  ::       ::           :::      FileName   : pinmapgen.c
 ::   :: ::       ::             ::     Generate   : 
 ::    ::::       ::       ::      ::   Update     : 2011-05-20 09:08:09
::::    :::     ::::::      ::::::::    Version    : 0.0.1
Description:
	    自动从Cadence项目目录中提取指定芯片的信号名，将信号名
	和对应的引脚位号输出；
	    对于CPLD/FPGA，可按照列表的对应关系，输出对应厂商或者
	开发工具格式的引脚锁定文件，也可以输出Verilog HDL格式的模
	块端口列表。
	    对于普通芯片可以直接输出信号名列表等。
使用方法：
	编译：i468-mingw32-gcc pinmapgen.c -o pinmapgen
	使用：复制到项目根目录，双击运行即可！
TODO:
	增加多模式、参数化的支持。
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dirent.h>

#define VERSION		"0.0.1"
enum Chip_type{
	Nets,		//普通的网络名
	Verilog,	//Verilog格式的端口列表
	Lattice,	//Lattice格式的引脚映射
	Xilinx,		//Xilinx格式的引脚映射
	Altera,		//Altera格式的引脚映射
};

struct{
	char *name;
	enum Chip_type type;
}chips[]={
	{.name = "LCMXO256C",	.type = Lattice},
	{.name = "LCMXO640C",	.type = Lattice},
	{.name = "LC4032",	.type = Lattice},
	{.name = "LC4064",	.type = Lattice},
	{.name = "LC4256",	.type = Lattice},
	{.name = "LC4128",	.type = Lattice},
	{.name = "XC6SLX150T",	.type = Xilinx},
	{.name = "XC9570",	.type = Xilinx},
	{.name = "XC9572",	.type = Xilinx},
	{.name = "XC9536",	.type = Xilinx},
	{.name = "XC95288",	.type = Xilinx},
	{.name = "EPM240",	.type = Altera},
	{.name = "EPM570",	.type = Altera},
	{.name = "EPM1270",	.type = Altera},
	{.name = "EPM3064",	.type = Altera},
	{.name = "EP2C5T144",	.type = Altera},
};

#define ARRAY_SIZE(array)	(sizeof(array)/sizeof(array[0]))

char * strlower(char *str)
{
	int i;
	for (i=0; i<strlen(str); i++) {
		str[i]=tolower(str[i]);
	}
	return str;
}

/**
 * 从项目根目录切换到 work/设计名/packaged
 */
int switch_path(void)
{
	DIR *dp;
	FILE *fp=NULL;
	struct dirent *ptr;
	char line[1024]={0}, buff[1024]={0};
	int ret=0;

	dp = opendir("./");

	//先找到项目文件*.cpm
	while (ptr=readdir(dp)) {
		if (strlen(ptr->d_name)>4 
				&& (!strcmp((ptr->d_name+strlen(ptr->d_name)-4),".cpm"))) {
			fp = fopen(ptr->d_name, "r");
			break;
		}
	}
	closedir(dp);

	if (!fp) {
		printf("无法打开项目配置文件\n");
		return -1;
	}

	//从项目文件中找到项目设计名
	while(fgets(line, sizeof(line), fp)){
		//格式为：design_name '设计名'
		if (!strncmp(line, "design_name ", 12)) {
			*(strrchr(line, '\''))='\0';
			sprintf(buff, "worklib/%s/packaged/", strchr(line, '\'')+1);
			break;
		}
	}
	fclose(fp);

	if (buff[0]) {
		chdir(buff);
		return 0;
	} else {
		printf("项目配置文件格式错误\n");
		return -2;
	}
}

int main(int argc, char **argv)
{
	int i;
	FILE *fp, *ofp;
	char buff[1024]={0};
	char filename[100]={0};

	if (argc>1) {
		if(!strcmp(argv[1], "-v")) {
			printf("作者: Athurg.Feng <feng@jianbo.de>\n");
			printf("公司: NTS-intl <http://www.nts-intl.com>\n");
			printf("版本: %s\n", VERSION);
			printf("	Cadence原理图元件引脚编号及信号名提取工具\n", VERSION);
		} else if(!strcmp(argv[1], "-l")) {
			printf("支持的芯片列表:\n");
			for (i=0; i<ARRAY_SIZE(chips); i++)
				printf("%s\n", chips[i].name);
		}
		return 0;
	}

	//进入到···/work/设计名/packaged目录
	if(switch_path()<0) {
		return -1;
	}

	//打开pstxref.dat文件，找到芯片位号
	fp = fopen("pstxref.dat", "r");
	if(!fp)	{
		printf("找不到数据文件，设计尚未打包展开？\n");
		return -1;
	}
	while(fgets(buff, sizeof(buff), fp)) {
		for (i=0; i<ARRAY_SIZE(chips); i++){
			if (strncmp(buff, chips[i].name, strlen(chips[i].name))){
				continue;
			}
			*(strchr(buff, '\n')) = '\0';
			sprintf(filename, "../../../%s.pin", chips[i].name);
			ofp = fopen(filename, "w");
			pinmap_gen(ofp, strrchr(buff,' ')+1, chips[i].type);
			fclose(ofp);
		}
		memset(buff, 0, sizeof(buff));
	}

	fclose(fp);

	return 0;
}

int pinmap_gen(FILE *ofp, char *comp, int type)
{
	FILE *fp;
	char buff[1024]={0};
	char netname[100]={0};
	char keywords[100]={0};

	fp = fopen("pstxnet.dat", "r");
	if(!fp)	{
		printf("无法打开数据文件，项目尚未打包？\n");
		return -1;
	}
	sprintf(keywords, "NODE_NAME     %s", comp);

	while(fgets(buff, sizeof(buff), fp)) {
		if (buff[0]=='\''){
			memset(netname, 0, sizeof(netname));
			strncpy(netname, buff+1, strlen(buff)-3);
		}
		if (!strncmp(buff, keywords, strlen(keywords))) {
			buff[strlen(buff)-1]='\0';//替换掉换行符
			if (strcmp(netname, "NC")
				&& strncmp(netname,"GND", 3) 
				&& strncmp(netname, "VCC", 3)
				&& strncmp(netname, "UNNAMED", 7)
			) {
				switch (type) {
					case Lattice:
						fprintf(ofp, "LOCATE COMP \"%s\" SITE %s;\n",
							strlower(netname), buff+strlen(keywords));
						break;
					case Xilinx:
						fprintf(ofp, "NET \"%s\" LOC = %s;\n",
							strlower(netname), buff+strlen(keywords));
						break;
					case Altera:
						fprintf(ofp, "set_location_assignment PIN_%s -to %s\n",
								buff+strlen(keywords), strlower(netname));
						break;
					case Verilog:
						//Verilog端口名只是在普通端口列表的行首加上两个TAB
						fprintf(ofp, "		");
					case Nets:
						fprintf(ofp, "%s,\n",	strlower(netname));
						break;
					default:
						break;
				}
			}
		}
		memset(buff, 0, sizeof(buff));
	}

	return 0;
}
