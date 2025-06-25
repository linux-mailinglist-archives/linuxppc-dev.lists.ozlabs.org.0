Return-Path: <linuxppc-dev+bounces-9770-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 528FDAE88AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:49:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5ph4sWJz3bh0;
	Thu, 26 Jun 2025 01:49:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866556;
	cv=none; b=E8DsK4w1f8b+Ja80kuJAw4D1qCbHuLGC5jC52y6tv4ked4u9ttzCwKSJyYzKyuC7OKGz1GWI8p5EKZuYacAgjJdBMCf6gxrBQHmdJRHxZsVKBdDOxPjTL8G2GbYgONW5aGFYRSikjQ7DUj/PaX2r00oU0s45PYxHttck6YgTuoXGQrhmKa7eeIQB47oBA84cbBA6n8bMaNF6l4+owB/NwJ1mZcpJm4v07zRn2u3SCFKFjvhOCxE04crQBnAqzzxPu2XOzgKEH3uWLLwIRLQQtvdIms5gv6cOU1dkPgRG22rtKmdjqjDLy4BbKC1VqmMKGksUSxW/52SmyQNQcIYToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866556; c=relaxed/relaxed;
	bh=nHliA5YJz3srt0ZPpGd9tF1587aEmma2TB0zRTiy8bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kww0/0a/dr/VYHrsZqK3FT1kyOMt+zSgwFfRKCiBv+mHu8A/nVs1r23LFBJGrb8jQW0ebMIG4Wjt4Yggdkks56y5i817ut+eXbr/weFESOr+GwrID7EnaSdngA4nxrzjVxv6j93spjap4Ydn+e/zAjQ5AiAaUQoe8ClSPCEByyhi7IqExanEGS9B6CxFCjnNAV45CmFDymgxp0q6ujc5KPX1OCUuE6oIhMdX/zdACoTeTe4bazhZw+VbZies60D06/tjra41nysQmUEk3Z42BJ5Q7ikQzGSZc8K3Rq4ZYISfkG/4b6mTvwaXRhyCvo3muSyC5Touc15Fr2y38qX43A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5pg6VJkz30WX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:15 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D194B2103;
	Wed, 25 Jun 2025 08:48:26 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A7733F58B;
	Wed, 25 Jun 2025 08:48:40 -0700 (PDT)
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
	andre.przywara@arm.com,
	shahuang@redhat.com
Subject: [kvm-unit-tests PATCH v4 04/13] scripts: Use an associative array for qemu argument names
Date: Wed, 25 Jun 2025 16:48:04 +0100
Message-ID: <20250625154813.27254-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
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

Changes v3->v4:

* Renamed vmm_opts to vmm_optname.
* Dropped entries for 'kernel' and 'initrd' in vmm_optname because they weren't
used in this patch.
* Use vmm_optname_nr_cpus() and vmm_optname_args() instead of directly indexing
into vmm_optname.
* Dropped the check for empty $test_args in scripts/runtime.bash::run() by
having $test_args already contain --append if not empty in
scripts/common.bash::for_each_unittest().

 scripts/common.bash  | 11 ++++++++---
 scripts/runtime.bash |  7 +------
 scripts/vmm.bash     | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/scripts/common.bash b/scripts/common.bash
index 9deb87d4050d..ae127bd4e208 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -1,4 +1,5 @@
 source config.mak
+source scripts/vmm.bash
 
 function for_each_unittest()
 {
@@ -26,8 +27,12 @@ function for_each_unittest()
 				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 			fi
 			testname=$rematch
-			smp=1
+			smp="$(vmm_optname_nr_cpus) 1"
 			kernel=""
+			# Intentionally don't use -append if test_args is empty
+			# because qemu interprets the first word after
+			# -append as a kernel parameter instead of a command
+			# line option.
 			test_args=""
 			opts=""
 			groups=""
@@ -39,9 +44,9 @@ function for_each_unittest()
 		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
-			smp=${BASH_REMATCH[1]}
+			smp="$(vmm_optname_nr_cpus) ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
-			test_args=${BASH_REMATCH[1]}
+			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
 			opts=${BASH_REMATCH[2]}$'\n'
 			while read -r -u $fd; do
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index bc17b89f4ff5..86d8a2cd8528 100644
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
-    # as a test argument instead of a qemu option, so make sure that doesn't
-    # happen.
-    [ -n "$test_args" ] && opts="-append $test_args $opts"
-
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
     fi
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 8365c1424a3f..7629b2b9146e 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -1,3 +1,18 @@
+declare -A vmm_optname=(
+	[qemu,args]='-append'
+	[qemu,nr_cpus]='-smp'
+)
+
+function vmm_optname_args()
+{
+	echo ${vmm_optname[$(vmm_get_target),args]}
+}
+
+function vmm_optname_nr_cpus()
+{
+	echo ${vmm_optname[$(vmm_get_target),nr_cpus]}
+}
+
 function vmm_get_target()
 {
 	if [[ -z "$TARGET" ]]; then
-- 
2.50.0


