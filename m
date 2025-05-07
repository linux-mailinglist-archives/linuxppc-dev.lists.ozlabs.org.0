Return-Path: <linuxppc-dev+bounces-8390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E99AAE42B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:14:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM34k46z30Pn;
	Thu,  8 May 2025 01:14:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630863;
	cv=none; b=jP2vb2cPngeJghpYuPae7EjzR9ufMCdDB/g66d9RbxBo2iLa3G8dgLGlVZ2ZrM78Oi1nUU9m/W1pWURUqlNX9wcU48GzRTpHkvMnMsUn4zctuX54rL0+p6qvEFaBb/uaQLCArjslbWAGtoxs817WW1jMfrMVNXCeKVDtOSjQX56x4Td6HSefMFzvNkZRo02z83WqsO850Bh6Wr5cSAIlkZ4OYIBM2PH/f5zRVBItTRjppV0OPF9Uzhvp6aX/52nqFSf4kTTBHE4uRCSo+B0p0Wd3shri6BIZvZha12olTGH3CuWEf4CIeKMoAbMmwXIgQL3as+FSQkiJrY6TdZPXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630863; c=relaxed/relaxed;
	bh=tCOH9JwAUB4HtvmygHFxbq9nhfzNC89q/QLlYMiSYsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRy1deCThkWQy9nJbgrQZTfiX3uufGYnRxM659U40/zTIuU+E3FtLlbNWn7fZJpckyA6lPUpcRarc8nt9zfA/Bw7trF1RR56avX7AnEFvM7U6/Whle7FQgWUq0aaxQOazwZIdSNzOvNjY9u7532TZ1oUasQv15YUP8uUt6+TdT9eTFCiK5xH86JnZkBn4/QKZIKqbxsLgfdtzJxR7qWxhV8J6lZLoVq5vyG0/FkAXA9rIcKvUdzGg6f4z7Gf+tXbG66/65N1nvzcg1xyBBkIp+Yu54NWQdZ5vs8ArDIX0yIfLmqW3e0Tl2JK0EYh5qrehvNu0Snjn/9P8FwkQx0qvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszM11xVZz30Ff
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:14:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 625B42247;
	Wed,  7 May 2025 08:13:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E4293F58B;
	Wed,  7 May 2025 08:13:35 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 07/16] scripts: Use an associative array for qemu argument names
Date: Wed,  7 May 2025 16:12:47 +0100
Message-ID: <20250507151256.167769-8-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Move away from hardcoded qemu arguments and use instead an associative
array to get the needed arguments. This paves the way for adding kvmtool
support to the scripts, which has a different syntax for the same VM
configuration parameters.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/common.bash  | 10 +++++++---
 scripts/runtime.bash |  7 +------
 scripts/vmm.bash     |  7 +++++++
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/scripts/common.bash b/scripts/common.bash
index 9deb87d4050d..649f1c737617 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -1,4 +1,5 @@
 source config.mak
+source scripts/vmm.bash
 
 function for_each_unittest()
 {
@@ -26,8 +27,11 @@ function for_each_unittest()
 				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 			fi
 			testname=$rematch
-			smp=1
+			smp="${vmm_opts[$TARGET:nr_cpus]} 1"
 			kernel=""
+			# Intentionally don't use -append if test_args is empty
+			# because qemu interprets the first argument after
+			# -append as a kernel parameter.
 			test_args=""
 			opts=""
 			groups=""
@@ -39,9 +43,9 @@ function for_each_unittest()
 		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
-			smp=${BASH_REMATCH[1]}
+			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
-			test_args=${BASH_REMATCH[1]}
+			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
 			opts=${BASH_REMATCH[2]}$'\n'
 			while read -r -u $fd; do
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 06cc58e79b69..86d8a2cd8528 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -34,7 +34,7 @@ premature_failure()
 get_cmdline()
 {
     local kernel=$1
-    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $smp $test_args $opts"
 }
 
 skip_nodefault()
@@ -88,11 +88,6 @@ function run()
     local accel="${10}"
     local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
 
-    # If $test_args is empty, qemu will interpret the first option after -append
-    # as a kernel parameter instead of a qemu option, so make sure the -append
-    # option is used only if $test_args is not empy.
-    [ -n "$test_args" ] && opts="-append $test_args $opts"
-
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
     fi
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 39325858c6b3..b02055a5c0b6 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -1,5 +1,12 @@
 source config.mak
 
+declare -A vmm_opts=(
+	[qemu:nr_cpus]='-smp'
+	[qemu:kernel]='-kernel'
+	[qemu:args]='-append'
+	[qemu:initrd]='-initrd'
+)
+
 function check_vmm_supported()
 {
 	case "$TARGET" in
-- 
2.49.0


