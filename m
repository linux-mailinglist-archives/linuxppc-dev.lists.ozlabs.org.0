Return-Path: <linuxppc-dev+bounces-9776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278A1AE88BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:50:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qF5YmYz3bqP;
	Thu, 26 Jun 2025 01:49:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866585;
	cv=none; b=OQpyEo+vzUysxGyHn045Odw9/tCPr0sYU5c+sfZhXbhYA0eY+Z1k3AEgwxqKo6jeEySxy6aADi5j2d8iTG7GH4YIS+c8+D7nLKBelETHlMJj8iByX0HLlaptBaLuH+vfuhf/HwaTM+v0K6JOT2FfLMcpyYhqny5NOjL0PooX+GkyM6IsH1xFiCT7VKf6izZHIhjOe6zb7mT1NNLlMhTmitLtPa4gz8ErQOZPpgcNCdHnF4moLlG26LZtf10to49+UC1mYCyEFoT2Kun0n/GPY+WrQAa9Kmj80aQl/8VN3rmkstNAKWYSSBjyw34BEXFa9b/u8Uhsi1zFudiCKG9BQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866585; c=relaxed/relaxed;
	bh=1gD8+NOIPJJrA+P/rcvWCyHITA9HbnT8oy7rx3WB3+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgTTa+lC3maOOxJANCtI8fHgWFAEQvLVvAiWt5H3ZSZf+0By6VdPuA/jSvBUveuC4CAoxYDXkx7/bEOHYVDKx4djc6TyvXYwhCwNScbJzAJfIFfMFW9BTdlzLm2eNK2gm8E60+p3kGpbGJ11txHkWS2JyymofixMDM1NsZbdRHARVfBUssGKem34O9mRxHt7rPIYbOfvPnnvM30WCS2h88uYUeGVu290cKZ0lthtj4g+6j/hVS7510iiWK+aEpmW204GUwHNXIJGIA8FVY49dQcmxVnDw3vmAQyLSjw0Cenqi6efvDiJEVv0OJzCfAOLsu/PRFyPrASJGUUmu4fN1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qF0pPTz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FF2720E3;
	Wed, 25 Jun 2025 08:48:56 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D09AD3F58B;
	Wed, 25 Jun 2025 08:49:09 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 10/13] scripts: Do not probe for maximum number of VCPUs when using kvmtool
Date: Wed, 25 Jun 2025 16:48:10 +0100
Message-ID: <20250625154813.27254-11-alexandru.elisei@arm.com>
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

The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
VCPUs that the host supports. Qemu will exit with an error when creating a
virtual machine if the number of VCPUs is exceeded.

kvmtool behaves differently: it will automatically limit the number of
VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
to achieve. When doing --probe-maxsmp with kvmtool, print a message
explaining why it's redundant and don't do anything else.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Changes v3->v4:

* Use vmmm_probe_maxsmp() instead of indexing vmm_optname in run_tests.sh.

 run_tests.sh         |  3 ++-
 scripts/runtime.bash | 16 ----------------
 scripts/vmm.bash     | 30 ++++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index 150a06a91064..4cfc3cd9e4cf 100755
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
+            vmm_probe_maxsmp $RUNTIME_arch_run
             ;;
         --)
             ;;
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 5839ca5ca665..766d1d28fb75 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -207,19 +207,3 @@ function run()
 
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
index 44954a711cad..724c96f9e665 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -91,6 +91,23 @@ function qemu_parse_premature_failure()
 	return 0
 }
 
+#
+# Probe for MAX_SMP, in case it's less than the number of host cpus.
+#
+function qemu_probe_maxsmp()
+{
+	local runtime_arch_run="$1"
+	local smp
+
+	if smp=$($runtime_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
+		smp=${smp##* }
+		smp=${smp/\(}
+		smp=${smp/\)}
+		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
+		MAX_SMP=$smp
+	fi
+}
+
 function kvmtool_fixup_return_code()
 {
 	local ret=$1
@@ -112,6 +129,12 @@ function kvmtool_parse_premature_failure()
 	return 0
 }
 
+function kvmtool_probe_maxsmp()
+{
+	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
+	echo "The 'smp' test parameter won't be modified"
+}
+
 declare -A vmm_optname=(
 	[qemu,args]='-append'
 	[qemu,default_opts]=''
@@ -119,6 +142,7 @@ declare -A vmm_optname=(
 	[qemu,initrd]='-initrd'
 	[qemu,nr_cpus]='-smp'
 	[qemu,parse_premature_failure]=qemu_parse_premature_failure
+	[qemu,probe_maxsmp]=qemu_probe_maxsmp
 
 	[kvmtool,args]='--params'
 	[kvmtool,default_opts]="$KVMTOOL_DEFAULT_OPTS"
@@ -126,6 +150,7 @@ declare -A vmm_optname=(
 	[kvmtool,initrd]='--initrd'
 	[kvmtool,nr_cpus]='--cpus'
 	[kvmtool,parse_premature_failure]=kvmtool_parse_premature_failure
+	[kvmtool,probe_maxsmp]=kvmtool_probe_maxsmp
 )
 
 function vmm_optname_args()
@@ -158,6 +183,11 @@ function vmm_parse_premature_failure()
 	${vmm_optname[$(vmm_get_target),parse_premature_failure]} "$@"
 }
 
+function vmm_probe_maxsmp()
+{
+	${vmm_optname[$(vmm_get_target),probe_maxsmp]} "$1"
+}
+
 function vmm_get_target()
 {
 	if [[ -z "$TARGET" ]]; then
-- 
2.50.0


