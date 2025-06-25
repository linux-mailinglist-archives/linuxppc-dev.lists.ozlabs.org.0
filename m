Return-Path: <linuxppc-dev+bounces-9771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE714AE88AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:49:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5pz2WWZz3bmQ;
	Thu, 26 Jun 2025 01:49:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866571;
	cv=none; b=c3+2YJgML6jdoJYunaF3bVCmP6N0EhrrzPYrbLTlVRwDKwRI5OY8onGNRjLbWu3OM5DBnFz3p52okGTD39i2xoim98Sjdd7O/zsePaQDK2ehp/E6KibmuIh0kt3ZDyqBDIWyynniVsfK3RrJgCv24GsLq30CmyDXUE0cTSpBadAafJsd0ape9uO71l4tgv4YSrwjOMshyKLwv0+lDC3107hLAZ9ir0H19siqETiwQeut4VJMxIxEkCXZNGSXowlaKqVjWNQtgoXV9LVsfMDcevLMMFCQ5NYom0OIT7nsT91SoTEt5qeJbjVOlRrl9097NMTLxsdliVKyXQ3XSEOFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866571; c=relaxed/relaxed;
	bh=zpFutilBZH0tdPS9jwVmtd+zW4RR8VqRiQV9vvPfoNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtF4wdQeLmCig5InRhiu8uKbf+CMdbu3Qd5MYGLoI5Vb4QI3LNFktgjJLavFaY+jKGlocWqcItiG8OlM15tMNep0rumCZNslTK5bfEJKMQ/wWPn/eXMUGjDY770gii0sWneihvyxGopaykyVa2rdtGflSD/GezkojX9RXD4nxgpnsw3dyn6p3yIOngYWcJL9JkKK/+1vRpFmMN9u25SGTDVLgNPCV6Kiab7Czor3pO5HlD9K7l/f/tQqct9A4hmzL5kN/Fnu3gnehdVJMOPIRHaCU1kPxZ5fCaojRV61AQ3j21d1dNslJIpTMlpmi7li7SDmX0fjB1dYVeDjiJ3HVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5px5sB1z30WX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:29 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B705B2247;
	Wed, 25 Jun 2025 08:48:31 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6EB1F3F58B;
	Wed, 25 Jun 2025 08:48:45 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 05/13] scripts: Add 'kvmtool_params' to test definition
Date: Wed, 25 Jun 2025 16:48:05 +0100
Message-ID: <20250625154813.27254-6-alexandru.elisei@arm.com>
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

arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
running and configuring a virtual machine is different to qemu. To run
tests using the automated test infrastructure, add a new test parameter,
'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
but using kvmtool's syntax.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Changes v3->v4:

* Added params_name in scripts/common.bash::for_each_unittest() to avoid
checking for $TARGET when deciding to parse kvmtool_params or
{qemu,extra}_params.
* Dropped factoring out parse_opts() in for_each_unittest().

 arm/unittests.cfg   | 24 ++++++++++++++++++++++++
 docs/unittests.txt  |  8 ++++++++
 scripts/common.bash | 11 +++++++----
 scripts/vmm.bash    | 16 ++++++++++++++++
 4 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 384af983cd88..343c14567f27 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -17,6 +17,7 @@ file = selftest.flat
 smp = 2
 test_args = 'setup smp=2 mem=256'
 qemu_params = -m 256
+kvmtool_params = --mem 256
 groups = selftest
 
 # Test vector setup and exception handling (kernel mode).
@@ -48,66 +49,77 @@ groups = pci
 file = pmu.flat
 groups = pmu
 test_args = "cycle-counter 0"
+kvmtool_params = --pmu
 
 [pmu-event-introspection]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-event-introspection
+kvmtool_params = --pmu
 
 [pmu-event-counter-config]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-event-counter-config
+kvmtool_params = --pmu
 
 [pmu-basic-event-count]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-basic-event-count
+kvmtool_params = --pmu
 
 [pmu-mem-access]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-mem-access
+kvmtool_params = --pmu
 
 [pmu-mem-access-reliability]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-mem-access-reliability
+kvmtool_params = --pmu
 
 [pmu-sw-incr]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-sw-incr
+kvmtool_params = --pmu
 
 [pmu-chained-counters]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-chained-counters
+kvmtool_params = --pmu
 
 [pmu-chained-sw-incr]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-chained-sw-incr
+kvmtool_params = --pmu
 
 [pmu-chain-promotion]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-chain-promotion
+kvmtool_params = --pmu
 
 [pmu-overflow-interrupt]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-overflow-interrupt
+kvmtool_params = --pmu
 
 # Test PMU support (TCG) with -icount IPC=1
 #[pmu-tcg-icount-1]
@@ -131,6 +143,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
 test_args = ipi
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv2-mmio]
@@ -138,6 +151,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
 test_args = mmio
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv2-mmio-up]
@@ -145,6 +159,7 @@ file = gic.flat
 smp = 1
 test_args = mmio
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv2-mmio-3p]
@@ -152,6 +167,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
 test_args = mmio
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv3-ipi]
@@ -159,6 +175,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = ipi
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = gic
 
 [gicv2-active]
@@ -166,6 +183,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
 test_args = active
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv3-active]
@@ -173,6 +191,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = active
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = gic
 
 [its-introspection]
@@ -180,6 +199,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-introspection
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3-its
 groups = its
 arch = arm64
 
@@ -188,6 +208,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-trigger
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3-its
 groups = its
 arch = arm64
 
@@ -196,6 +217,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-migration
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = its migration
 arch = arm64
 
@@ -204,6 +226,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-pending-migration
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = its migration
 arch = arm64
 
@@ -212,6 +235,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-migrate-unmapped-collection
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = its migration
 arch = arm64
 
diff --git a/docs/unittests.txt b/docs/unittests.txt
index ea0da959f008..a9164bccc24c 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -78,6 +78,14 @@ extra_params
 Alias for 'qemu_params', supported for compatibility purposes. Use
 'qemu_params' for new tests.
 
+kvmtool_params
+--------------
+Extra parameters supplied to the kvmtool process. Works similarly to
+'qemu_params', but uses kvmtool's syntax for command line arguments. The
+example for 'qemu_params', applied to kvmtool, would be:
+
+kvmtool_params = --mem 256
+
 groups
 ------
 groups = <group_name1> <group_name2> ...
diff --git a/scripts/common.bash b/scripts/common.bash
index ae127bd4e208..7c1b89f1b3c2 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -18,6 +18,9 @@ function for_each_unittest()
 	local timeout
 	local rematch
 
+	# shellcheck disable=SC2155
+	local params_name=$(vmm_unittest_params_name)
+
 	exec {fd}<"$unittests"
 
 	while read -r -u $fd line; do
@@ -47,8 +50,8 @@ function for_each_unittest()
 			smp="$(vmm_optname_nr_cpus) ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
 			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
-		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
-			opts=${BASH_REMATCH[2]}$'\n'
+		elif [[ $line =~ ^$params_name\ *=\ *'"""'(.*)$ ]]; then
+			opts=${BASH_REMATCH[1]}$'\n'
 			while read -r -u $fd; do
 				#escape backslash newline, but not double backslash
 				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
@@ -63,8 +66,8 @@ function for_each_unittest()
 					opts+=$REPLY$'\n'
 				fi
 			done
-		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
-			opts=${BASH_REMATCH[2]}
+		elif [[ $line =~ ^$params_name\ *=\ *(.*)$ ]]; then
+			opts=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
 			groups=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 7629b2b9146e..9a2608eb3fd4 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -38,3 +38,19 @@ function vmm_check_supported()
 		;;
 	esac
 }
+
+function vmm_unittest_params_name()
+{
+	# shellcheck disable=SC2155
+	local target=$(vmm_get_target)
+
+	case "$target" in
+	qemu)
+		echo "extra_params|qemu_params"
+		;;
+	*)
+		echo "$0 does not support '$target'"
+		exit 2
+		;;
+	esac
+}
-- 
2.50.0


