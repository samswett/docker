FROM phusion/baseimage:0.9.18

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV TZ=US/Pacific
ENV SCREEN_RESOLUTION 1280x900
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Installing apps
RUN apt-get update && apt-get -y install \
	xvfb \
	x11vnc \
	supervisor \
	fluxbox \
	git-core \
	git

# Obtain Skype
RUN curl -s 'https://repo.skype.com/latest/skypeforlinux-64.deb' -o /root/skype.deb && \
	dpkg -i /root/skype.deb || true && \
	apt-get install -fy && \
	rm /root/skype.deb

# House cleaning
RUN apt-get autoclean

# Obtain noVNC
WORKDIR /root
RUN git clone https://github.com/novnc/noVNC.git && ln -s /root/noVNC/vnc_auto.html /root/noVNC/index.html

# Docker's supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set display
ENV DISPLAY :0

# Expose Port (Note: if you change it do it as well in surpervisord.conf)
EXPOSE 5900
EXPOSE 8083

CMD ["/usr/bin/supervisord"]
