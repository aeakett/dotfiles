#!/bin/bash

# --- Configuration ---
TEST_DIR="extract_test_env"
ARCHIVE_TYPES=("tar.gz" "zip" "tar" "7z" "rar")
DUMMY_CONTENT="This is dummy content for a test file."

# --- Helper Functions ---
create_dummy_files() {
    local prefix=$1
    mkdir -p "${prefix}_single_dir" "${prefix}_multi_dir1" "${prefix}_multi_dir2"
    echo "${DUMMY_CONTENT} - ${prefix}" > "${prefix}_file1.txt"
    echo "${DUMMY_CONTENT} - ${prefix}" > "${prefix}_file2.txt"
    echo "${DUMMY_CONTENT} - ${prefix}" > "${prefix}_single_dir/${prefix}_file3.txt"
    echo "${DUMMY_CONTENT} - ${prefix}" > "${prefix}_single_dir/${prefix}_file4.txt"
    echo "${DUMMY_CONTENT} - ${prefix}" > "${prefix}_multi_dir1/${prefix}_file5.txt"
    echo "${DUMMY_CONTENT} - ${prefix}" > "${prefix}_multi_dir2/${prefix}_file6.txt"
}

cleanup_dummy_files() {
    local prefix=$1
    rm -rf ${prefix}_file*.txt "${prefix}_single_dir" "${prefix}_multi_dir1" "${prefix}_multi_dir2"
}

# --- Archive Creation Functions ---

create_single_file_archive() {
    local test_case=$1
    local type=$2
    local short_type=${type%%.*}
    local archive_name="${test_case}-${short_type}"
    echo "Creating ${archive_name}.${type} (single file)..."
    create_dummy_files "$archive_name"
    case "$type" in
        "tar.gz") tar czf "${archive_name}.tar.gz" "${archive_name}_file1.txt" ;;
        "zip") zip -r "${archive_name}.zip" "${archive_name}_file1.txt" ;;
        "tar") tar cf "${archive_name}.tar" "${archive_name}_file1.txt" ;;
        "7z") 7z a -t7z "${archive_name}.7z" "${archive_name}_file1.txt" ;;
        "rar") if command -v rar >/dev/null; then rar a "${archive_name}.rar" "${archive_name}_file1.txt"; else echo "rar command not found, skipping .rar archive."; fi ;;
    esac
    cleanup_dummy_files "$archive_name"
}

create_single_dir_archive() {
    local test_case=$1
    local type=$2
    local short_type=${type%%.*}
    local archive_name="${test_case}-${short_type}"
    echo "Creating ${archive_name}.${type} (single directory)..."
    create_dummy_files "$archive_name"
    case "$type" in
        "tar.gz") tar czf "${archive_name}.tar.gz" "${archive_name}_single_dir" ;;
        "zip") zip -r "${archive_name}.zip" "${archive_name}_single_dir" ;;
        "tar") tar cf "${archive_name}.tar" "${archive_name}_single_dir" ;;
        "7z") 7z a -t7z "${archive_name}.7z" "${archive_name}_single_dir" ;;
        "rar") if command -v rar >/dev/null; then rar a "${archive_name}.rar" "${archive_name}_single_dir"; else echo "rar command not found, skipping .rar archive."; fi ;;
    esac
    cleanup_dummy_files "$archive_name"
}

create_multi_file_archive() {
    local test_case=$1
    local type=$2
    local short_type=${type%%.*}
    local archive_name="${test_case}-${short_type}"
    echo "Creating ${archive_name}.${type} (multiple files)..."
    create_dummy_files "$archive_name"
    case "$type" in
        "tar.gz") tar czf "${archive_name}.tar.gz" "${archive_name}_file1.txt" "${archive_name}_file2.txt" ;;
        "zip") zip -r "${archive_name}.zip" "${archive_name}_file1.txt" "${archive_name}_file2.txt" ;;
        "tar") tar cf "${archive_name}.tar" "${archive_name}_file1.txt" "${archive_name}_file2.txt" ;;
        "7z") 7z a -t7z "${archive_name}.7z" "${archive_name}_file1.txt" "${archive_name}_file2.txt" ;;
        "rar") if command -v rar >/dev/null; then rar a "${archive_name}.rar" "${archive_name}_file1.txt" "${archive_name}_file2.txt"; else echo "rar command not found, skipping .rar archive."; fi ;;
    esac
    cleanup_dummy_files "$archive_name"
}

create_multi_dir_archive() {
    local test_case=$1
    local type=$2
    local short_type=${type%%.*}
    local archive_name="${test_case}-${short_type}"
    echo "Creating ${archive_name}.${type} (multiple directories)..."
    create_dummy_files "$archive_name"
    case "$type" in
        "tar.gz") tar czf "${archive_name}.tar.gz" "${archive_name}_multi_dir1" "${archive_name}_multi_dir2" ;;
        "zip") zip -r "${archive_name}.zip" "${archive_name}_multi_dir1" "${archive_name}_multi_dir2" ;;
        "tar") tar cf "${archive_name}.tar" "${archive_name}_multi_dir1" "${archive_name}_multi_dir2" ;;
        "7z") 7z a -t7z "${archive_name}.7z" "${archive_name}_multi_dir1" "${archive_name}_multi_dir2" ;;
        "rar") if command -v rar >/dev/null; then rar a "${archive_name}.rar" "${archive_name}_multi_dir1" "${archive_name}_multi_dir2"; else echo "rar command not found, skipping .rar archive."; fi ;;
    esac
    cleanup_dummy_files "$archive_name"
}

create_tar_bomb() {
    local test_case=$1
    local archive_name="${test_case}-tar"
    echo "Creating ${archive_name}.tar.gz (tar bomb simulation)..."
    local tmpdir="${archive_name}_bomb"
    mkdir -p "$tmpdir"
    for i in $(seq 1 100); do
        echo "$DUMMY_CONTENT" > "${tmpdir}/${archive_name}_file_${i}.txt"
    done
    (cd "$tmpdir" && tar czf "../${archive_name}.tar.gz" *)
    rm -rf "$tmpdir"
}


# --- Main Execution ---
echo "Setting up test environment in $TEST_DIR..."
mkdir -p "$TEST_DIR"
cd "$TEST_DIR" || { echo "Failed to enter $TEST_DIR"; exit 1; }

echo "Generating test archives..."

for type in "${ARCHIVE_TYPES[@]}"; do
    create_single_file_archive "single_file" "$type"
    create_single_dir_archive "single_dir" "$type"
    create_multi_file_archive "multi_file" "$type"
    create_multi_dir_archive "multi_dir" "$type"
done

create_tar_bomb "tar_bomb"

echo ""
echo "Test archives generated in $(pwd)"
echo "You can now run 'extract <archive_name>' for testing."
echo "To clean up, run 'rm -rf ../$TEST_DIR'"

cd ..
