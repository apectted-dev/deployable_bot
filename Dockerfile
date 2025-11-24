FROM python:3.11-slim

RUN useradd -m -u 1000 botuser

ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN chown -R botuser:botuser /app

USER botuser

CMD ["python3", "main.py"]
