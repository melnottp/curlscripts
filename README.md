# curlscripts
Bash script to automate curl
=======


# Curl Scripts

Description

## What is Curl script 

Two scripts to automate multiple curl request, provide average response time and HTTP code answer.

- Curl.sh : test one URL/Path 
- Curlcompare.sh : compare two URL/Path 



## How to use

### Test one url/path example

```bash
cloud@bastion:~/curlscript$ ./curl.sh 10 0.001 mydomain.fr dogs
9: 0.009308 200 67 http://mydomain.fr/dogs
8: 0.013404 200 67 http://mydomain.fr/dogs
7: 0.005543 200 66 http://mydomain.fr/dogs
6: 0.006148 200 67 http://mydomain.fr/dogs
5: 0.005053 200 67 http://mydomain.fr/dogs
4: 0.008852 200 67 http://mydomain.fr/dogs
3: 0.005030 200 67 http://mydomain.fr/dogs
2: 0.005468 200 65 http://mydomain.fr/dogs
1: 0.005719 200 67 http://mydomain.fr/dogs
0: 0.005502 200 67 http://mydomain.fr/dogs
   .........................
   AVG: .070027/10 = .007
```



### Compare multiple path/url example

```shell
cloud@bastion:~/curlscript$ ./curlcompare.sh 10 0.01 mydomain.fr dogs mydomain.fr cats
======================================================================================================================================
10: curl -s http://mydomain.fr/dogs		10: curl -s http://mydomain.fr/cats
======================================================================================================================================
9: 0.005609 13400.000 200 67 http://mydomain.fr/dogs	9: 0.006447 143333.000 200 860 http://mydomain.fr/cats
8: 0.012211 5583.000 200 67 http://mydomain.fr/dogs	    8: 0.005932 172000.000 200 860 http://mydomain.fr/cats
7: 0.006025 11000.000 200 66 http://mydomain.fr/dogs	7: 0.005578 172000.000 200 860 http://mydomain.fr/cats
6: 0.004801 16750.000 200 67 http://mydomain.fr/dogs	6: 0.005586 172000.000 200 860 http://mydomain.fr/cats
5: 0.007837 9571.000 200 67 http://mydomain.fr/dogs	    5: 0.005714 172000.000 200 860 http://mydomain.fr/cats
4: 0.005344 13400.000 200 67 http://mydomain.fr/dogs	4: 0.006449 143333.000 200 860 http://mydomain.fr/cats
3: 0.004886 16750.000 200 67 http://mydomain.fr/dogs	3: 0.005628 172000.000 200 860 http://mydomain.fr/cats
2: 0.007754 9571.000 200 67 http://mydomain.fr/dogs	    2: 0.005891 172000.000 200 860 http://mydomain.fr/cats
1: 0.004947 16750.000 200 67 http://mydomain.fr/dogs	1: 0.006103 143333.000 200 860 http://mydomain.fr/cats
0: 0.004893 16750.000 200 67 http://mydomain.fr/dogs	0: 0.005422 172000.000 200 860 http://mydomain.fr/cats
======================================================================================================================================
AVG: .064307/10 = .006							AVG: .058750/10 = .005

```


