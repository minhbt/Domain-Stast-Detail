System requirements:
 - Drupal core 6.24.
 - PHP 5.x
 - MySQL  5.5.10
 - CentOS release 5.3 (Final)

Installation instructions:

1.  Setting cron job running every minute.

 * * * * * /usr/bin/wget -O - -q http://210.245.88.23/cron.php

2. installing database: Please execute the  "mwixi.sql" file into the current database of drupal site.

3. extract the "wixi_scripts.zip" file to the same folder in root of Drupal site. 

4. Install all module as below:
  - Custom Date Filter : be used for filter with date type filter on views.
  - wixiadddomain: be used for add one by one domain.
  - wixicron: be used for running script.
  - wixiimportdomain: be used for importing list of domains.

5. Additional, please add more the common module in the drupal.org:
  - Table wizard:  http://drupal.org/project/tw
  - Views: http://drupal.org/project/views

have a fun!
------------------------------------------------------------------------------------------------


 
