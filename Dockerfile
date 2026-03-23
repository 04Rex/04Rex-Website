FROM nginx:mainline-alpine

# Remove default nginx config to avoid conflicts
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom configuration
COPY nginx/default.conf /etc/nginx/conf.d/default.conf

# Copy the static website files
COPY site/ /usr/share/nginx/html/

# Optional: Ensure permissions are correct for the nginx user
#RUN chown -R nginx:nginx /usr/share/nginx/html && \
#    chmod -R 755 /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]