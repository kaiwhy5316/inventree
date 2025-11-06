# Use the official InvenTree image
FROM inventree/inventree:latest

# Create directories for data and media
RUN mkdir -p /home/inventree/data /home/inventree/media

# Environment variables (SQLite setup)
ENV INVENTREE_DB_ENGINE=sqlite3
ENV INVENTREE_DB_NAME=/home/inventree/data/inventree.sqlite3
ENV INVENTREE_DEBUG=False
ENV INVENTREE_LOG_LEVEL=INFO
ENV INVENTREE_SITE_URL=https://example.onrender.com

# Expose the port
EXPOSE 8000

# Set the working directory
WORKDIR /home/inventree

# Run initial setup (migrations + static files), then start the built-in entrypoint
CMD ["bash", "-c", "python manage.py migrate && python manage.py collectstatic --noinput && /entrypoint.sh"]
