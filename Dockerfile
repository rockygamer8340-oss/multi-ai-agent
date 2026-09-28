FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PORT=8000
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Default: FastAPI backend. UI ke liye SERVICE=ui set karo.
ENV SERVICE=api
EXPOSE 8000 8501
CMD ["sh", "-c", "if [ \"$SERVICE\" = ui ]; then exec streamlit run ui/streamlit_app.py --server.port $PORT --server.address 0.0.0.0 --server.headless true; else exec uvicorn app.api:app --host 0.0.0.0 --port $PORT; fi"]
