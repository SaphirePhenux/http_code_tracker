######################################################
# PROGRAM : HTTP CODE TRACKER
# AUTHOR : SAPHIREPEHUX | GITHUB.COM/SAPHIREPHENUX
# DESCRIPTION : A QUICK AND DIRTY HTTP CODE TRACKER
#####################################################
# TO DO SECTION :
# - CREATE AN OS DETECTION SECTION TO AUTO FIND THE LOG LOCATION(S)
# - CREATE A WEB SERVER / SERVICES SECTION TO DETECT WHICH WEB 
#     SERVICES ARE CURRENTLY IN USE AND THEREFORE WHICH LOGS TO 
#     LOOK FOR.
# - ADD XXX CODE PURPOSE TO OUTPUT
# - FEATURE / FUNCTION TO AUTO ROLL MY COLLECTION FILE AFTER IT IS
#     20 MB OR AFTER X AMOUNT OF HOURS / MINUTES
#####################################################

# FUTURE OS SECTION

# FUTURE WEB SERVICES SECTION

# PRIMARY FUNCTION ; POSSIBLY MAKE ROLLOVER FUNCTION A NESTED ITEM
# Tailing both the access_log and the ssl_access_log
tail -f /var/log/httpd/ssl_access_log /var/log/httpd/access_log | awk '/\ 2[0-9][0-9]\ / { print substr($4, 2, 11),substr($4,14,5)" : 2XX" }; /\ 3[0-9][0-9]\ / { print substr($4, 2, 11),substr($4,14,5)" : 3XX" }; /\ 4[0-9][0-9]\ / { print substr($4, 2, 11),substr($4,14,5)" : 4XX" }; /\ 5[0-9][0-9]\ / { print substr($4, 2, 11),substr($4,14,5)" : 5XX" }' | sort | uniq -c >> /var/log/HTTPD_ERROR_CODES.out
# Took me longer than I would have liked. The original version I 
# cranked out in about an hour, and I was happy with it until I 
# realized that it would only work with ssl_access and most of the
# access logs, but not all of them. The ::1 IP addresses threw me. 
