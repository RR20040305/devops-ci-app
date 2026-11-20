FROM python:3.12-slim

# ВАЖНО: Здесь заменен логин на rr20040305
LABEL org.opencontainers.image.source="https://github.com/rr20040305/devops-ci-app"

WORKDIR /app

RUN useradd -m app

COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app/ app/

USER app

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app.app:app"]