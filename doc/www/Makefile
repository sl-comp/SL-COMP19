
all:
	emacs -Q --batch -l publish.el --funcall org-publish-all 

web:
	rm -f www/*~
	rsync -auvz www/ sighirea@www.irif.fr:public_html/sl-comp/19/
