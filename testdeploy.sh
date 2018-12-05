#项目名称
#echo "任务名称是:$JOB_NAME;$CHANGE_AUTHOR"

project_name=te
#待部署的war文件名
warfile_name=Homework
#下载的源代码文件名称，源代码地址https://github.com/WW0417/Homework.git
sourcename=WebContent
#下载的源文件路径
file_path=/var/lib/jenkins/jobs/$project_name/workspace
#若已存在Homework*文件，则删除
rm -rf $file_path/$warfile_name*
#将源文件打包成Homework.war文件
cd $file_path/$sourcename
jar -cvf $file_path/$warfile_name.war *.*
echo "源文件成功打包成$warfile_name.war文件"
#若webapps下面已有Homework.war文件，则删除
rm -f /var/lib/tomcat/webapps/$warfile_name.war
cp $file_path/$warfile_name.war /var/lib/tomcat/webapps
service tomcat restart
