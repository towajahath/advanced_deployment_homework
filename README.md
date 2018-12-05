The purpose of this repository is to properly configure and install Red Hat Openshift as a homework assignment

Getting files and installing OpenShift:
1.	Login into Bastion
2.	Login to installation user:
    sudo -i
3.	Download files from GitHub:
    git clone https://github.com/towajahath/advanced_deployment_homework
4.	Change to the repository directory:
    cd /root/advanced_deployment_homework
5.	Install OpenShift and output the install to a log file at /var/logs/install.log:
	ansible-playbook /root/advanced_deployment_homework/homework.yaml