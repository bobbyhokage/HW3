set -e
DATA_DIR="$(pwd)/data"
LOCAL_DATA_DIR="$(pwd)/local_data"
case "$1" in
    build_generator)
        echo "Building generator image..."
        docker build -t generator ./generator
        ;;
    run_generator)
        echo "Running generator container..."
        mkdir -p "$DATA_DIR"
        docker run --rm \
            -v "$DATA_DIR":/data \
            generator
        echo "Done: data/data.csv created"
        ;;
    create_local_data)
        echo "Creating data.csv locally..."
        mkdir -p "$LOCAL_DATA_DIR"
        python3 generator/generate.py "$LOCAL_DATA_DIR"
        echo "Done: local_data/data.csv created"
        ;;
    build_reporter)
        echo "Building reporter image..."
        docker build -t reporter ./reporter
    ;;
    run_reporter)
        echo "Running reporter container..."
        mkdir -p "$DATA_DIR"
        docker run --rm \
            -v "$DATA_DIR":/data \
            reporter
        echo "Done: data/report.html created"
        ;;
    structure)
        echo "Project structure:"
        find . -not -path './git/*' -not -name '.gitkeep' | sort | sed 's|[^/]*/|   |g'
        ;;
    clear_data)
        echo "Clearing data..."
        rm -f data/*.csv data/*.html
        echo "Done: data/ is clean now"
        ;;
    inside_generator)
        echo "Listing /data inside generator container..."
        mkdir -p "$DATA_DIR"
        docker run --rm \
            -v "$DATA_DIR":/data \
            generator \
            sh -c "ls -la /data"
        ;;
    inside_reporter)
        echo "Listing /data inside reporter container..."
        mkdir -p "$DATA_DIR"
        docker run --rm \
            -v "$DATA_DIR":/data \
            reporter \
            sh -c "ls -la /data"
        ;;
esac