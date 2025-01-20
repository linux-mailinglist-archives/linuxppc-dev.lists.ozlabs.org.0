Return-Path: <linuxppc-dev+bounces-5412-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1AAA17085
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 17:45:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQd6JrRz30P3;
	Tue, 21 Jan 2025 03:44:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737391481;
	cv=none; b=fbcoBnBWlczaSUEzBdUPxozW5bvGZx/z/DNxD0sET5uOEraNkjl740hci5eNLkrs0SwrVP0PQ7KKLCX10isq5FhLm08x84Nl9YzDYckO1ceEA2xuiwZMl4u9wZqkcrybOnEMzOPMPAP5UItqitpdtGpxqx2OSGhQ4cjCpC8zap62UhbxtVmNpppMiIl2YCS/mY0Da6sba4lXG7KhlPNC+IQleW0u9q8/OwQU3979OgGy3f85C96BNi4KNxDgjaktojHRiaWTtC9a0kLh+xCurhe+5vN6td2Rg8o3AzyfJZOfvPAHC2lPBdGbBgqjmltHQbmfd/6EKbbwvv+Zw2i5KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737391481; c=relaxed/relaxed;
	bh=MOxfkKxCpYoHqFhms3UK3LWvmqgrEkXRGLzTc6dCfBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fheQAG8/bQiKjileaSrergIQqPaqI/ybSsKs2SbyzoLXMrqDSZfsxTAehEHBSIINauPHYhqoCaRxpmPf2VfVfZNHyPiS1yN8LGtM7taPNj7LteGHv8sAVm2q+PJAG6qW6aAOAqNY/EbMdi1wmwrqggr/grXiB8E7xafxPWKXvyXDe2lPX+cuf1UPx6JuTlN6amn57GyJj8m/gTiqvF2KBFBCWLFseehD4lTz657fGym64qV2PslwQ78bBZ3xpMMo65OL2umuLI6yMi/9VHwjVMwXEUo630yHPF29iB4vCUlmZKywvRYqRbW9WZvfYcxof9bbriv2nIdfUjdjSwDGMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcGQd010Hz30RS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 03:44:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9854F1D14;
	Mon, 20 Jan 2025 08:44:35 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0131C3F5A1;
	Mon, 20 Jan 2025 08:44:03 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 10/18] scripts/arch-run: Add support for kvmtool
Date: Mon, 20 Jan 2025 16:43:08 +0000
Message-ID: <20250120164316.31473-11-alexandru.elisei@arm.com>
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

Add two new functions, search_kvmtool_binary(), which, like the name
suggests, searches for the location of the kvmtool binary, and
run_kvmtool(), which runs a test with kvmtool as the VMM.

initrd_create() has also been modified to use the kvmtool syntax for
supplying an initrd, which is --initrd (two dashes instead of the single
dash that qemu uses).

arm/run does not know how to use these functions yet, but this will be
added in a subsequent patch.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/arch-run.bash | 94 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 13 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index d6eaf0ee5f09..34f633cade01 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -75,16 +75,47 @@ run_qemu ()
 	return $ret
 }
 
+run_kvmtool ()
+{
+	local stdout errors ret sig
+
+	initrd_create || return $?
+
+	echo -n "$@"
+	[ "$ENVIRON_DEFAULT" = "yes" ] && echo -n " #"
+	echo " $INITRD"
+
+	# stdout to {stdout}, stderr to $errors and stderr
+	exec {stdout}>&1
+	"${@}" $INITRD </dev/null 2> >(tee /dev/stderr) > /dev/fd/$stdout
+	ret=$?
+	exec {stdout}>&-
+
+	return $ret
+}
+
 run_test_status ()
 {
-	local stdout ret
+	local stdout ret ret_success
 
 	exec {stdout}>&1
-	lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
+
+	# For qemu, an exit status of 1 means that the test completed. For kvmtool,
+	# 0 means the same thing.
+	case "$TARGET" in
+	qemu)
+		ret_success=1
+		lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
+		;;
+	kvmtool)
+		ret_success=0
+		lines=$(run_kvmtool "$@" > >(tee /dev/fd/$stdout))
+		;;
+	esac
 	ret=$?
 	exec {stdout}>&-
 
-	if [ $ret -eq 1 ]; then
+	if [ $ret -eq $ret_success ]; then
 		testret=$(grep '^EXIT: ' <<<"$lines" | head -n1 | sed 's/.*STATUS=\([0-9][0-9]*\).*/\1/')
 		if [ "$testret" ]; then
 			if [ $testret -eq 1 ]; then
@@ -422,6 +453,25 @@ search_qemu_binary ()
 	export PATH=$save_path
 }
 
+search_kvmtool_binary ()
+{
+	local kvmtoolcmd kvmtool
+
+	for kvmtoolcmd in lkvm vm lkvm-static; do
+		if $kvmtoolcmd --help 2>/dev/null| grep -q 'The most commonly used'; then
+			kvmtool="$kvmtoolcmd"
+			break
+		fi
+	done
+
+	if [ -z "$kvmtool" ]; then
+		echo "A kvmtool binary was not found." >&2
+		return 2
+	fi
+
+	command -v $kvmtool
+}
+
 initrd_cleanup ()
 {
 	rm -f $KVM_UNIT_TESTS_ENV
@@ -447,7 +497,18 @@ initrd_create ()
 	fi
 
 	unset INITRD
-	[ -f "$KVM_UNIT_TESTS_ENV" ] && INITRD="-initrd $KVM_UNIT_TESTS_ENV"
+	if [ ! -f "$KVM_UNIT_TESTS_ENV" ]; then
+		return 0
+	fi
+
+	case "$TARGET" in
+		qemu)
+			INITRD="-initrd $KVM_UNIT_TESTS_ENV"
+			;;
+		kvmtool)
+			INITRD="--initrd $KVM_UNIT_TESTS_ENV"
+			;;
+	esac
 
 	return 0
 }
@@ -471,18 +532,25 @@ env_params ()
 	local qemu have_qemu
 	local _ rest
 
-	qemu=$(search_qemu_binary) && have_qemu=1
+	env_add_params TARGET
+
+	# kvmtool's versioning has been broken since it was split from the kernel
+	# source.
+	if [ "$TARGET" = "qemu" ]; then
+		qemu=$(search_qemu_binary) && have_qemu=1
 
-	if [ "$have_qemu" ]; then
-		if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
-			[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
+		if [ "$have_qemu" ]; then
+			if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
+				[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
+			fi
+			QEMU_VERSION_STRING="$($qemu -h | head -1)"
+			# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
+			# shellcheck disable=SC2034
+			IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
 		fi
-		QEMU_VERSION_STRING="$($qemu -h | head -1)"
-		# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
-		# shellcheck disable=SC2034
-		IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
+
+		env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
 	fi
-	env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
 
 	KERNEL_VERSION_STRING=$(uname -r)
 	IFS=. read -r KERNEL_VERSION KERNEL_PATCHLEVEL rest <<<"$KERNEL_VERSION_STRING"
-- 
2.47.1


