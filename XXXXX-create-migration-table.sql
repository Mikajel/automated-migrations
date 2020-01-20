/* README: this is an update file for ACL database CI/CD versioningand non-destructive persistence*/
/*         it operates on a top of 01-acl-ddl-only.sql and 02-acl-data-only.sql */
/*         file contains both ddl and data updates that will be served to running database based on migrations table */

USE acl;

/* Create new resolver 'changeSellerId' with respective permission 'change_seller_id'; bind to queries and roles */
START TRANSACTION;

/*!40101 SET @saved_cs_client     = @@character_set_client */
;

/*!40101 SET character_set_client = utf8 */
;

CREATE TABLE `migration` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `executed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

/*!40101 SET character_set_client = @saved_cs_client */
;

COMMIT;