FROM inventree/inventree:latest
EXPOSE 8000
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "InvenTree.wsgi"]
