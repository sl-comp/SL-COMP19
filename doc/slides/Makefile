
all:
	emacs -Q --batch -l publish.el toolympics19.org

web:
	rm www/*~
	rsync -auvz www/ sighirea@www.irif.fr:public_html/sl-comp/18/

clean:
	rm *.log *.out *.aux *.snm *.toc *.vrb *.nav

