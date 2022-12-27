# Build xcframwork to deploy Swift Package

# Set bash script to exit immediately if any commands fail.
set -e

# Setup constants
PROJECT_NAME="KuringCommons"
TARGET_NAME="KuringCommons"
HOSTING_BASE_PATH="kuring-ios-commons"
DOCS_DIR="docs"

echo "🧹 빌드를 준비합니다..."
rm -rf "./${DOCS_DIR}"

mkdir -p "./${DOCS_DIR}"

echo "🔨 DOCC 문서 빌드를 시작합니다..."
xcodebuild docbuild -scheme "${PROJECT_NAME}" \
    -destination generic/platform=iOS \
    OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path ${HOSTING_BASE_PATH}" \
    DOCC_OUTPUT_DIR="./${DOCS_DIR}"
#swift package \
#    --allow-writing-to-directory "${DOCS_DIR}" \
#    generate-documentation \
#    --target "${TARGET_NAME}" \
#    --disable-indexing \
#    --output-path "${DOCS_DIR}" \
#    --transform-for-static-hosting \
#    --hosting-base-path "${HOSTING_BASE_PATH}"

echo "🎉 성공적으로 완료하였습니다!"
