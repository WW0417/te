#��Ŀ����
#echo "����������:$JOB_NAME;$CHANGE_AUTHOR"

project_name=te
#�������war�ļ���
warfile_name=Homework
#���ص�Դ�����ļ����ƣ�Դ�����ַhttps://github.com/WW0417/Homework.git
sourcename=WebContent
#���ص�Դ�ļ�·��
file_path=/var/lib/jenkins/jobs/$project_name/workspace
#���Ѵ���Homework*�ļ�����ɾ��
rm -rf $file_path/$warfile_name*
#��Դ�ļ������Homework.war�ļ�
cd $file_path/$sourcename
jar -cvf $file_path/$warfile_name.war *.*
echo "Դ�ļ��ɹ������$warfile_name.war�ļ�"
#��webapps��������Homework.war�ļ�����ɾ��
rm -f /var/lib/tomcat/webapps/$warfile_name.war
cp $file_path/$warfile_name.war /var/lib/tomcat/webapps
service tomcat restart
