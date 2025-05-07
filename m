Return-Path: <linuxppc-dev+bounces-8396-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89334AAE43C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszMC1BRdz30Vq;
	Thu,  8 May 2025 01:14:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630871;
	cv=none; b=ggtAxAvUbi04+rikrQRl9jU8DgGuDknHJoRy2wT1O6gfnWy7MYQrKQBEj4yz4GMPAhKko3zu3ImUnMsm/UXF4611ha4677NH3APgo7YfmmjpwBBNMfwRSxNb5Z5+atMaFJ9JCQwMLxgEH7Y6QXh1mPeGh9xabDfGOYGuU3kr5Z3SFnVHC/Nhn4YNzX+k1Z2osqGtlbMViqJfeipgjftdOC+S/hG9vUczZmwdiA8og6z6M/d8xifr3I9qTYg59KBRaGp05mLWMvSuiX9rr4yvGKIHOTXQBDVA+VsfGWm0rCnH8lDj7V6chHZfDu05hMRqrn2mjIpzTTq/5SpRf16RIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630871; c=relaxed/relaxed;
	bh=/GrwUxIVMmtGgwjaEvf2FceqAH7Cp+F9GPK2ohffADw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CE+zAEO52BO1LBvm1VoN+rzqmPUaRBG7CP5ca9zczdG7KmQMJnrKlg8ZRYdS8Kp/9TzWczfjUQANer/5In4pgknvNPFcaz92HrneqC4BRpUw4gym/iiP9RRLvFJ9z8nZ18y5pz227vxYA3buA2rWV3vhn8VOjhRFwtLxwCo/nQ3RnVnxkmfagQKkUTbkKE1JPd8NlB6qjGy1lwyxdB9YhLHRGT+E5Oquij9qISV9u1Ycy0pXTmZvCJLBGvmr0FiKByhSYLApb5LcU9WLvW3q7/TAaO3e8t9o9imQJp2SvqpLBUrMGzFelFDQcQXohyfgkaKKwiqxl5ZZT+Ff55z2dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszMB3C9Fz30Vn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:14:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71CED22E6;
	Wed,  7 May 2025 08:13:49 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 544FE3F58B;
	Wed,  7 May 2025 08:13:56 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 13/16] scripts: Do not probe for maximum number of VCPUs when using kvmtool
Date: Wed,  7 May 2025 16:12:53 +0100
Message-ID: <20250507151256.167769-14-alexandru.elisei@arm.com>
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

The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
VCPUs that the host supports. Qemu will exit with an error when creating a
virtual machine if the number of VCPUs is exceeded.

kvmtool behaves differently: it will automatically limit the number of
VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
to achieve. When doing --probe-maxsmp with kvmtool, print a message
explaining why it's redundant and don't do anything else.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 run_tests.sh         |  3 ++-
 scripts/runtime.bash | 16 ----------------
 scripts/vmm.bash     | 24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index 150a06a91064..a69c3665b7a4 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -10,6 +10,7 @@ if [ ! -f config.mak ]; then
 fi
 source config.mak
 source scripts/common.bash
+source scripts/vmm.bash
 
 function usage()
 {
@@ -90,7 +91,7 @@ while [ $# -gt 0 ]; do
             list_tests="yes"
             ;;
         --probe-maxsmp)
-            probe_maxsmp
+            ${vmm_opts[$TARGET:probe_maxsmp]}
             ;;
         --)
             ;;
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 01ec8eae2bba..a802686c511d 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -209,19 +209,3 @@ function run()
 
     return $ret
 }
-
-#
-# Probe for MAX_SMP, in case it's less than the number of host cpus.
-#
-function probe_maxsmp()
-{
-	local smp
-
-	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
-		smp=${smp##* }
-		smp=${smp/\(}
-		smp=${smp/\)}
-		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
-		MAX_SMP=$smp
-	fi
-}
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index a1d50ed51981..ef9819f4132c 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -105,6 +105,22 @@ function qemu_parse_premature_failure()
 	return 0
 }
 
+#
+# Probe for MAX_SMP, in case it's less than the number of host cpus.
+#
+function qemu_probe_maxsmp()
+{
+	local smp
+
+	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
+		smp=${smp##* }
+		smp=${smp/\(}
+		smp=${smp/\)}
+		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
+		MAX_SMP=$smp
+	fi
+}
+
 function kvmtool_parse_premature_failure()
 {
 	local log="$@"
@@ -114,6 +130,12 @@ function kvmtool_parse_premature_failure()
 	return 0
 }
 
+function kvmtool_probe_maxsmp()
+{
+	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
+	echo "The 'smp' test parameter won't be modified"
+}
+
 declare -A vmm_opts=(
 	[qemu:nr_cpus]='-smp'
 	[qemu:kernel]='-kernel'
@@ -122,6 +144,7 @@ declare -A vmm_opts=(
 	[qemu:default_opts]=''
 	[qemu:fixup_return_code]=qemu_fixup_return_code
 	[qemu:parse_premature_failure]=qemu_parse_premature_failure
+	[qemu:probe_maxsmp]=qemu_probe_maxsmp
 
 	[kvmtool:nr_cpus]='--cpus'
 	[kvmtool:kernel]='--kernel'
@@ -130,6 +153,7 @@ declare -A vmm_opts=(
 	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
 	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
 	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
+	[kvmtool:probe_maxsmp]=kvmtool_probe_maxsmp
 )
 
 function check_vmm_supported()
-- 
2.49.0


