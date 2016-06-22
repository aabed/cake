
case $1 in
    start_elk_machine)
    ansible-playbook -i localhost ../ansible/provision_ec2.yml --private-key=~/Downloads/cake.pem --skip-tags "blog_box"
    shift
    ;;
    start_blog_machine)
    ansible-playbook -i localhost ../ansible/provision_ec2.yml --private-key=~/Downloads/cake.pem --skip-tags "elk_box"
    shift
    ;;
    provision_elk)
    ansible-playbook -i ../ansible/ec2.py ../ansible/provision_elk.yml --private-key=~/Downloads/cake.pem
    shift
    ;;
    provision_blog)
    ansible-playbook -i ../ansible/ec2.py ../ansible/provision_blog.yml --private-key=~/Downloads/cake.pem
    shift
    ;;
    all)
    ./all.sh    
    shift
    ;;

    *)
    echo "please provide one of the following [start_elk_machine,start_blog_machine,provision_elk,provision_blog]"
    ;;
esac
shift # past argument or value
