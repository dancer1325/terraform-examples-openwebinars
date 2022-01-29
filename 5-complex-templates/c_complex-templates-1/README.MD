# Notes
* EC2 instances aren't created because for some reason, it tries to create one's in eu-est-1
  * Fixed!! There 2 variables about the regions, whose values were different
    * aws_region
    * region