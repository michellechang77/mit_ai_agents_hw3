FROM python:3.12-slim

WORKDIR /app

# Install uv
RUN pip install uv

# Copy project files
COPY . .

# Install dependencies
RUN uv sync --no-dev

# Set the path
ENV PATH="/app/.venv/bin:$PATH"

# Run the server
CMD ["uv", "run", "python", "-m", "mcp_server_fetch"]
