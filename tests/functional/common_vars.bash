# coverage related vars
OUT_DIR=$BATS_TEST_DIRNAME/../../exported-artifacts/coverage/functional
echo "#!/bin/bash" > $BATS_TEST_DIRNAME/repoman_coverage
echo "coverage run -a $(which repoman) \"\$@\"" >> $BATS_TEST_DIRNAME/repoman_coverage
chmod +x $BATS_TEST_DIRNAME/repoman_coverage
export PATH=$BATS_TEST_DIRNAME:$PATH

PGP_KEY=fixtures/my_key.asc
PGP_PASS=123456
PGP_ID=bedc9c4be614e4ba

## Used for rpm
UNSIGNED_RPMS=(
    fixtures/unsigned_rpm-1.0-1.fc21.x86_64.rpm
    fixtures/unsigned_rpm-1.0-2.fc21.x86_64.rpm
    fixtures/unsigned_rpm-1.0-1.fc22.x86_64.rpm
)
UNSIGNED_RPM_EXPECTED_PATHS=(
    rpm/fc21/x86_64/unsigned_rpm-1.0-1.fc21.x86_64.rpm
    rpm/fc21/x86_64/unsigned_rpm-1.0-2.fc21.x86_64.rpm
    rpm/fc22/x86_64/unsigned_rpm-1.0-1.fc22.x86_64.rpm
)
SIGNED_RPMS=(
    fixtures/signed_rpm-1.0-1.fc21.x86_64.rpm
    fixtures/signed_rpm-2.0-1.fc23.x86_64.rpm
    fixtures/signed_rpm-2.1-1.fc23.x86_64.rpm
    fixtures/signed_rpm-2.1-2.fc23.x86_64.rpm
)
SIGNED_RPM_EXPECTED_PATHS=(
    rpm/fc21/x86_64/signed_rpm-1.0-1.fc21.x86_64.rpm
    rpm/fc23/x86_64/signed_rpm-2.0-1.fc23.x86_64.rpm
    rpm/fc23/x86_64/signed_rpm-2.1-1.fc23.x86_64.rpm
    rpm/fc23/x86_64/signed_rpm-2.1-2.fc23.x86_64.rpm
)
ALL_RPMS=(
    "${UNSIGNED_RPMS[@]}"
    "${SIGNED_RPMS[@]}"
)
ALL_EXPECTED_RPM_PATHS=(
    "${UNSIGNED_RPM_EXPECTED_PATHS[@]}"
    "${SIGNED_RPM_EXPECTED_PATHS[@]}"
)
ALL_EXPECTED_RPM_LATEST=(
    rpm/fc21/x86_64/unsigned_rpm-1.0-2.fc21.x86_64.rpm
    rpm/fc22/x86_64/unsigned_rpm-1.0-1.fc22.x86_64.rpm
    rpm/fc21/x86_64/signed_rpm-1.0-1.fc21.x86_64.rpm
    rpm/fc23/x86_64/signed_rpm-2.1-2.fc23.x86_64.rpm
)
ALL_UNEXPECTED_RPM_LATEST=(
    rpm/fc21/x86_64/unsigned_rpm-1.0-1.fc21.x86_64.rpm
    rpm/fc23/x86_64/signed_rpm-2.1-1.fc23.x86_64.rpm
)
ALL_EXPECTED_RPM_LATEST_TWO=(
    rpm/fc21/x86_64/unsigned_rpm-1.0-1.fc21.x86_64.rpm
    rpm/fc21/x86_64/unsigned_rpm-1.0-2.fc21.x86_64.rpm
    rpm/fc22/x86_64/unsigned_rpm-1.0-1.fc22.x86_64.rpm
    rpm/fc21/x86_64/signed_rpm-1.0-1.fc21.x86_64.rpm
    rpm/fc23/x86_64/signed_rpm-2.1-1.fc23.x86_64.rpm
    rpm/fc23/x86_64/signed_rpm-2.1-2.fc23.x86_64.rpm
)
ALL_UNEXPECTED_RPM_LATEST_TWO=(
    rpm/fc23/x86_64/signed_rpm-2.0-1.fc23.x86_64.rpm
)
NO_DISTRO_RPM=fixtures/unsigned_rpm-1.0-1.x86_64.rpm
ALL_DISTRO_RPM_EXPECTED_PATHS=(
    rpm/fc21/x86_64/unsigned_rpm-1.0-1.x86_64.rpm
    rpm/fc22/x86_64/unsigned_rpm-1.0-1.x86_64.rpm
)

UNSIGNED_SRPMS=(
    fixtures/unsigned_rpm-1.0-1.fc21.src.rpm
    fixtures/unsigned_rpm-1.1-1.fc21.src.rpm
)
UNSIGNED_SRPM_EXPECTED_PATHS=(
    rpm/fc21/SRPMS/unsigned_rpm-1.0-1.fc21.src.rpm
    rpm/fc21/SRPMS/unsigned_rpm-1.1-1.fc21.src.rpm
)
SIGNED_SRPMS=(
    fixtures/signed_rpm-1.0-1.fc21.src.rpm
)
SIGNED_SRPM_EXPECTED_PATHS=(
    rpm/fc21/SRPMS/signed_rpm-1.0-1.fc21.src.rpm
)
SOURCE_REPO1=fixtures/testdir1
FULL_SRPM=fixtures/kexec-tools-2.0.4-32.1.el7.src.rpm
FULL_SRPM_NAME=kexec-tools
FULL_SRPM_FILES=(
    eppic_030413.tar.gz
    kexec-tools-2.0.3-build-makedumpfile-eppic-shared-object.patch
    kexec-tools-2.0.3-disable-kexec-test.patch
    kexec-tools-2.0.4-kdump-x86-Process-multiple-Crash-kernel-in-proc-iome.patch
    kexec-tools-2.0.4-kexec-i386-Add-cmdline_add_memmap_internal-to-reduce.patch
    kexec-tools-2.0.4-makedumpfile-Add-help-and-man-message-for-help.patch
    kexec-tools-2.0.4-makedumpfile-Add-non-mmap-option-to-disable-mmap-manually.patch
    kexec-tools-2.0.4-makedumpfile-Add-vmap_area_list-definition-for-ppc-ppc64.patch
    kexec-tools-2.0.4-makedumpfile-Assign-non-printable-value-as-short-option.patch
    kexec-tools-2.0.4-makedumpfile-cache-Allocate-buffers-at-initialization-t.patch
    kexec-tools-2.0.4-makedumpfile-cache-Reuse-entry-in-pending-list.patch
    kexec-tools-2.0.4-makedumpfile-Fall-back-to-read-when-mmap-fails.patch
    kexec-tools-2.0.4-makedumpfile-Fix-max_mapnr-issue-on-system-has-over-44-b.patch
    kexec-tools-2.0.4-makedumpfile-Improve-progress-information-for-huge-memor.patch
    kexec-tools-2.0.4-makedumpfile-PATCH-Support-newer-kernels.patch
    kexec-tools-2.0.4-makedumpfile-Support-to-filter-dump-for-kernels-that-use.patch
    kexec-tools-2.0.4-makedumpfile-Understand-v3.11-rc4-dmesg.patch
    kexec-tools-2.0.4-makedumpfile-Update-pfn_cyclic-when-the-cyclic-buffer-size-.patch
    kexec-tools-2.0.4-makedumpfile-Use-divideup-to-calculate-maximum-required-bit.patch
    kexec-tools-2.0.4-Revert-kexec-include-reserved-e820-sections-in-crash.patch
    kexec-tools-2.0.4-Revert-kexec-lengthen-the-kernel-command-line-image.patch
    kexec-tools-2.0.4-vmcore-dmesg-stack-smashing-happend-in-extreme-case.patch
    kexec-tools-2.0.4-vmcore-dmesg-struct_val_u64-not-casting-u64-to-u32.patch
)


# Isos
ISOS=(
    "fixtures/dummy-project-1.2.3.iso"
    "fixtures/dummy-project-1.2.4.iso"
    "fixtures/dummy-project-1.3.4.iso"
)
EXPECTED_ISO_PATHS=(
    "iso/dummy-project/1.2.3/dummy-project-1.2.3.iso"
    "iso/dummy-project/1.2.4/dummy-project-1.2.4.iso"
    "iso/dummy-project/1.3.4/dummy-project-1.3.4.iso"
)
EXPECTED_ISO_MD5_PATH="${EXPECTED_ISO_PATH}.md5sum"
EXPECTED_ISO_SIG_PATH="${EXPECTED_ISO_MD5_PATH}.sig"
ISO_BADPATH="fixtures/dummy-project-without-version.iso"
ISO_BADPATH_WITH_NUMBERS="fixtures/123/dummy-project-without-version.iso"
