Return-Path: <linuxppc-dev+bounces-5416-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B7BA17090
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:45:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQk2C23z30Tq;
	Tue, 21 Jan 2025 03:44:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391486;
	cv=none; b=eVtl995fM2eP3t9TjKGAkXVVUBwSJiE6nUlAVVvn8cv4w8n/ThnQnnmMRbe/BdfeCEh8fRyMGvZRz2ogiLc1dkG/9y1u05nQr8JMWZyVTEK/0Ymh2jaQ5N3avB2aTQzEdQ7aYDCv1+WIwBsEyUeKUEvpVB97Tj6hZDNH76KDl4uDKtKjIRgAsmnQFTF+kH7HaYF+C2Q3cxDoYr/qvZ0jK1uJmPydpk3PIaK8BfFJ3uNp9aChjkHtWxpp1PpGvuq36tnEgFCgyYHsPIEGYSADC8jeJJyUgYUvEBA6yKn6qaK0HbIcZt+u4Tgsa9rPpEWJk1hK6uNlS97rLhBhS2w6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391486; c=relaxed/relaxed;
	bh=medarECptayMqBvBjjeGdt4kCiNE77yUfU01pP8XFaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aAmBCutSw9rIUKWu9Rgr2sFXZ24lbWg7/yahYopvlLQ20cb14S1fU8cG+JWPLTtvFpVoLjiNYv/ti4RPyJl/E8hr/MxYwpDnR/uNGYbHjeqdjeGI/XWJ2tvIXZHxnBPhJBwWhGeHcbgCoN1Dk1F0+XIrbAW5+lhYA9LDEX+fEcJplxgWsU6G5wdidBXulyU4jkA65NsqGUlPxVjKgMNJOdzZ60dRt9bOYcJh9pP12Fu5PzExm+kNmqBKnfpZIU3NkHqXBBYNlwfJpyIpsNhtJU0uz2s2sB0owVPW+Yt/GktXsSpbzqWZRH9NWy89/Xpoxf3uHWXQh9CTgrWv/rrJQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQj3kRlz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:45 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18899FEC;
	Mon, 20 Jan 2025 08:44:39 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7170E3F5A1;
	Mon, 20 Jan 2025 08:44:07 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: andrew.jones@linux.dev,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	david@redhat.com,
	pbonzini@redhat.com
Cc: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	joey.gouly@arm.com,
	andre.przywara@arm.com
Subject: [kvm-unit-tests PATCH v2 11/18] arm/run: Add support for kvmtool
Date: Mon, 20 Jan 2025 16:43:09 +0000
Message-ID: <20250120164316.31473-12-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
appropriately.

The test is ran using run_test_status() because kvmtool does not have a
testdev device to return the test exit code, so kvm-unit-tests must always
parse the "EXIT: STATUS" line for the exit code.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/run | 183 ++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 110 insertions(+), 73 deletions(-)

diff --git a/arm/run b/arm/run
index 9b11feafffdd..880d5afae86d 100755
--- a/arm/run
+++ b/arm/run
@@ -17,77 +17,114 @@ qemu)
    exit 3
 esac
 
-processor="$PROCESSOR"
+arch_run_qemu()
+{
+    processor="$PROCESSOR"
+
+    if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
+       [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
+       [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
+        ACCEL="tcg"
+    fi
+
+    set_qemu_accelerator || exit $?
+    if [ "$ACCEL" = "kvm" ]; then
+        QEMU_ARCH=$HOST
+    fi
+
+    qemu=$(search_qemu_binary) ||
+        exit $?
+
+    if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
+        echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
+        exit 2
+    fi
+
+    M='-machine virt'
+
+    if [ "$ACCEL" = "kvm" ]; then
+        if $qemu $M,\? | grep -q gic-version; then
+            M+=',gic-version=host'
+        fi
+    fi
+
+    if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
+        if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
+            processor="host"
+            if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
+                processor+=",aarch64=off"
+            fi
+        fi
+    fi
+
+    if [ "$ARCH" = "arm" ]; then
+        M+=",highmem=off"
+    fi
+
+    if ! $qemu $M -device '?' | grep -q virtconsole; then
+        echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
+        exit 2
+    fi
+
+    if ! $qemu $M -chardev '?' | grep -q testdev; then
+        echo "$qemu doesn't support chr-testdev. Exiting."
+        exit 2
+    fi
+
+    if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
+        chr_testdev='-device virtio-serial-device'
+        chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
+    fi
+
+    pci_testdev=
+    if $qemu $M -device '?' | grep -q pci-testdev; then
+        pci_testdev="-device pci-testdev"
+    fi
+
+    A="-accel $ACCEL$ACCEL_PROPS"
+    command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
+    command+=" -display none -serial stdio"
+    command="$(migration_cmd) $(timeout_cmd) $command"
+
+    if [ "$UEFI_SHELL_RUN" = "y" ]; then
+        ENVIRON_DEFAULT=n run_test_status $command "$@"
+    elif [ "$EFI_USE_ACPI" = "y" ]; then
+        run_test_status $command -kernel "$@"
+    else
+        run_qemu $command -kernel "$@"
+    fi
+}
+
+arch_run_kvmtool()
+{
+    local command
+
+    kvmtool=$(search_kvmtool_binary) ||
+        exit $?
+
+    if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
+        echo "kvmtool does not support $ACCEL" >&2
+        exit 2
+    fi
+
+    if ! kvm_available; then
+        echo "KVM required by kvmtool but not available on the host" >&2
+        exit 2
+    fi
+
+    command="$(timeout_cmd) $kvmtool run"
+    if [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ]; then
+	    run_test_status $command --kernel "$@" --aarch32
+    else
+	    run_test_status $command --kernel "$@"
+    fi
+}
 
-if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
-   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
-   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
-	ACCEL="tcg"
-fi
-
-set_qemu_accelerator || exit $?
-if [ "$ACCEL" = "kvm" ]; then
-	QEMU_ARCH=$HOST
-fi
-
-qemu=$(search_qemu_binary) ||
-	exit $?
-
-if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
-	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
-	exit 2
-fi
-
-M='-machine virt'
-
-if [ "$ACCEL" = "kvm" ]; then
-	if $qemu $M,\? | grep -q gic-version; then
-		M+=',gic-version=host'
-	fi
-fi
-
-if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
-	if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
-		processor="host"
-		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
-			processor+=",aarch64=off"
-		fi
-	fi
-fi
-
-if [ "$ARCH" = "arm" ]; then
-	M+=",highmem=off"
-fi
-
-if ! $qemu $M -device '?' | grep -q virtconsole; then
-	echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
-	exit 2
-fi
-
-if ! $qemu $M -chardev '?' | grep -q testdev; then
-	echo "$qemu doesn't support chr-testdev. Exiting."
-	exit 2
-fi
-
-if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
-	chr_testdev='-device virtio-serial-device'
-	chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
-fi
-
-pci_testdev=
-if $qemu $M -device '?' | grep -q pci-testdev; then
-	pci_testdev="-device pci-testdev"
-fi
-
-A="-accel $ACCEL$ACCEL_PROPS"
-command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
-command+=" -display none -serial stdio"
-command="$(migration_cmd) $(timeout_cmd) $command"
-
-if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_test_status $command "$@"
-elif [ "$EFI_USE_ACPI" = "y" ]; then
-	run_test_status $command -kernel "$@"
-else
-	run_qemu $command -kernel "$@"
-fi
+case "$TARGET" in
+qemu)
+    arch_run_qemu "$@"
+    ;;
+kvmtool)
+    arch_run_kvmtool "$@"
+    ;;
+esac
-- 
2.47.1


