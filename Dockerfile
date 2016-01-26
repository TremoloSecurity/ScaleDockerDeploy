# Use this file as a base line for deploying Scale
FROM tremolosecurity/scale:1.0.6

MAINTAINER Tremolo Security, Inc. - Docker <docker@tremolosecurity.com>

ENV JAVA_OPTS -Dscale.lastmile.password=start123 -Dscale.lastmile.keyname=enc-test

ENV SCALE_HOST_PORT 192.168.2.126:9093
ENV SCALE_KEYSTORE_PASSWORD start123

# Deploy the Last Mile keystore
ADD ./lastmile/lastmile.jks /etc/scale/lastmile.jks

# Deploy the TLS Keystore
ADD ./keystore/scaleKeystore.jks /etc/scale/scaleKeystore.jks

# Scale Main Application
ENV SCALE_MAIN_SOURCE_URL https://www.tremolosecurity.com/nexus/service/local/repositories/releases/content/tremolosecurity-scale-tomcat/scale-application/1.0.6
ENV SCALE_MAIN_WAR scale-application-1.0.6.war
ENV SCALE_APP_PATH scale
RUN /usr/local/tomcat/bin/scaleMainApp.sh;\
    mkdir /etc/scale/main;\
    rm /usr/local/tomcat/webapps/$SCALE_APP_PATH/WEB-INF/log4j.xml
ADD ./contexts/scale-application-context.xml /usr/local/tomcat/webapps/$SCALE_APP_PATH/META-INF/context.xml
ADD ./apps/main/log4j.xml /etc/scale/main/log4j.xml
ADD ./apps/main/scaleConfig.xml /etc/scale/main/scaleConfig.xml


# Scale Password Reset Application
ENV SCALE_PWD_RESET_SOURCE_URL https://www.tremolosecurity.com/nexus/service/local/repositories/releases/content/tremolosecurity-scale-tomcat/scale-passwordreset/1.0.6
ENV SCALE_PWD_RESET_WAR scale-passwordreset-1.0.6.war
ENV SCALE_PWD_RESET_PATH scalepasswordreset
RUN /usr/local/tomcat/bin/scalePasswordResetApp.sh;\
    mkdir /etc/scale/passwordreset;\
    rm /usr/local/tomcat/webapps/$SCALE_PWD_RESET_PATH/WEB-INF/log4j.xml
ADD ./contexts/scale-password_reset-context.xml /usr/local/tomcat/webapps/$SCALE_PWD_RESET_PATH/META-INF/context.xml
ADD ./apps/passwordreset/log4j.xml /etc/scale/passwordreset/log4j.xml
ADD ./apps/passwordreset/scaleConfig.xml /etc/scale/passwordreset/scaleConfig.xml

# Scale Register Application
ENV SCALE_REGISTER_SOURCE_URL https://www.tremolosecurity.com/nexus/service/local/repositories/releases/content/tremolosecurity-scale-tomcat/scale-register/1.0.6
ENV SCALE_REGISTER_WAR scale-register-1.0.6.war
ENV SCALE_REGISTER_PATH scaleregister
RUN /usr/local/tomcat/bin/scaleRegisterApp.sh;\
    mkdir /etc/scale/register;\
    rm /usr/local/tomcat/webapps/$SCALE_REGISTER_PATH/WEB-INF/log4j.xml
ADD ./contexts/scale-register-context.xml /usr/local/tomcat/webapps/$SCALE_REGISTER_PATH/META-INF/context.xml
ADD ./apps/register/log4j.xml /etc/scale/register/log4j.xml
ADD ./apps/register/scaleConfig.xml /etc/scale/register/scaleConfig.xml


# Scale Single Request Application
ENV SCALE_SINGLE_REQUEST_SOURCE_URL https://www.tremolosecurity.com/nexus/service/local/repositories/releases/content/tremolosecurity-scale-tomcat/scale-singlerequest/1.0.6
ENV SCALE_SINGLE_REQUEST_WAR scale-singlerequest-1.0.6.war
ENV SCALE_SINGLE_REQUEST_PATH scalesinglerequest
RUN /usr/local/tomcat/bin/scaleSingleRequestApp.sh;\
    mkdir /etc/scale/single_request;\
    rm /usr/local/tomcat/webapps/$SCALE_SINGLE_REQUEST_PATH/WEB-INF/log4j.xml
ADD ./contexts/scale-single_request-context.xml /usr/local/tomcat/webapps/$SCALE_SINGLE_REQUEST_PATH/META-INF/context.xml
ADD ./apps/single_request/log4j.xml /etc/scale/single_request/log4j.xml
ADD ./apps/single_request/scaleConfig.xml /etc/scale/single_request/scaleConfig.xml


# Scale TOTP Application
ENV SCALE_TOTP_SOURCE_URL https://www.tremolosecurity.com/nexus/service/local/repositories/releases/content/tremolosecurity-scale-tomcat/scale-totp/1.0.6
ENV SCALE_TOTP_WAR scale-totp-1.0.6.war
ENV SCALE_TOTP_PATH scaletotp
RUN /usr/local/tomcat/bin/scaleTOTPApp.sh;\
    mkdir /etc/scale/totp;\
    rm /usr/local/tomcat/webapps/$SCALE_TOTP_PATH/WEB-INF/log4j.xml
ADD ./contexts/scale-totp-context.xml /usr/local/tomcat/webapps/$SCALE_TOTP_PATH/META-INF/context.xml
ADD ./apps/totp/log4j.xml /etc/scale/totp/log4j.xml
ADD ./apps/totp/scaleConfig.xml /etc/scale/totp/scaleConfig.xml
