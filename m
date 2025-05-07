Return-Path: <linuxppc-dev+bounces-8384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CF6AAE418
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 17:14:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszLS3WBlz305D;
	Thu,  8 May 2025 01:13:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746630832;
	cv=none; b=FLx2/gPcS8XArL6rCpR1Udt14xYZim4JqBeL5v0z9jb85cWwhXIx55XY/sU216StBrHcfAtvm9785zxordXhsFubkAU+dyyK3yQG8q6kZ9U+oM+WdYP5gW0cJWuLmUfDRAgEuKlh2RI2wwnuvcSbie8rkkJc89R3tJ73zgN4hthaDKDO8BYjs/tIAM2aFJ12j+d4oNODntamSv3M6IdhifPCIio0H2SPvRSum5IUjoxfouZ6iQwDvw9Uezqp1v9hxqE+me469FCdAzGMDBMfozvTPnSS/nr5ZXzi/xAeDbibAHRSW0OBU+4JmRY8yywdmnjb6AaqfRV7Qam0/aUPKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746630832; c=relaxed/relaxed;
	bh=CpXBPPsWoXef+kc4tW7BXx7XYIFU3CfgpmqwbiZYUFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mjuybra92PksKXRFvcH1WbQbSF43csPh2zo42/w/X7sPH5AbK6zqHJ+1vgOPtAnAf63a4yS+oHOGnYviOiu3ZkoEZ4jwfp+uUH5awaCX8+o16PPl1r4AzBuMjtJo5TrySo04Wp3hqkF70tnkUZrdskzMiGTi7xEsGi7GLmPfIBvUdrp6Lhvf0x15BRQfrHsFmS8ciguDawfz+/k3JV8YoCH7/8XJvoNI1+c+pNh3vuXgS+ubaJi2tWoW00hzj+WpfmZwwO3MKveFZcKSDz46npSd36415oT6s/tb5K76dX1COLWGoqMDW1RuIi7SLNYqh2or8Dp4P4kuNXJphIHotg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZszLR2P8Cz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 01:13:51 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52224202C;
	Wed,  7 May 2025 08:13:10 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 451C23F58B;
	Wed,  7 May 2025 08:13:17 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 02/16] scripts: Add 'test_args' test definition parameter
Date: Wed,  7 May 2025 16:12:42 +0100
Message-ID: <20250507151256.167769-3-alexandru.elisei@arm.com>
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

kvm-unit-tests, on arm and arm64, is getting ready to support running all
the test automatically under kvmtool. kvmtool has a different syntax for
configuring and running a virtual machine, but what is common between
kvmtool and qemu, and any other virtual machine manager that kvm-unit-tests
might support in the future, is the test arguments that are passed to the
main() function.

So add a new test definition parameter, 'test_args', that contains only the
VMM-independent arguments that are passed to the main() function.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/unittests.cfg     | 94 ++++++++++++++++++++++++++-----------------
 docs/unittests.txt    | 17 ++++++--
 powerpc/unittests.cfg | 19 +++++----
 riscv/unittests.cfg   |  2 +-
 s390x/unittests.cfg   | 13 +++---
 scripts/common.bash   |  8 +++-
 scripts/runtime.bash  | 18 ++++++---
 x86/unittests.cfg     | 92 ++++++++++++++++++++++++++----------------
 8 files changed, 164 insertions(+), 99 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 6c6f76b2fb52..a4192ed7e20b 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -15,26 +15,27 @@
 [selftest-setup]
 file = selftest.flat
 smp = 2
-qemu_params = -m 256 -append 'setup smp=2 mem=256'
+test_args = 'setup smp=2 mem=256'
+qemu_params = -m 256
 groups = selftest
 
 # Test vector setup and exception handling (kernel mode).
 [selftest-vectors-kernel]
 file = selftest.flat
-qemu_params = -append 'vectors-kernel'
+test_args = vectors-kernel
 groups = selftest
 
 # Test vector setup and exception handling (user mode).
 [selftest-vectors-user]
 file = selftest.flat
-qemu_params = -append 'vectors-user'
+test_args = vectors-user
 groups = selftest
 
 # Test SMP support
 [selftest-smp]
 file = selftest.flat
 smp = $MAX_SMP
-qemu_params = -append 'smp'
+test_args = smp
 groups = selftest
 
 # Test PCI emulation
@@ -46,79 +47,81 @@ groups = pci
 [pmu-cycle-counter]
 file = pmu.flat
 groups = pmu
-qemu_params = -append 'cycle-counter 0'
+test_args = "cycle-counter 0"
 
 [pmu-event-introspection]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-event-introspection'
+test_args = pmu-event-introspection
 
 [pmu-event-counter-config]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-event-counter-config'
+test_args = pmu-event-counter-config
 
 [pmu-basic-event-count]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-basic-event-count'
+test_args = pmu-basic-event-count
 
 [pmu-mem-access]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-mem-access'
+test_args = pmu-mem-access
 
 [pmu-mem-access-reliability]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-mem-access-reliability'
+test_args = pmu-mem-access-reliability
 
 [pmu-sw-incr]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-sw-incr'
+test_args = pmu-sw-incr
 
 [pmu-chained-counters]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-chained-counters'
+test_args = pmu-chained-counters
 
 [pmu-chained-sw-incr]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-chained-sw-incr'
+test_args = pmu-chained-sw-incr
 
 [pmu-chain-promotion]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-chain-promotion'
+test_args = pmu-chain-promotion
 
 [pmu-overflow-interrupt]
 file = pmu.flat
 groups = pmu
 arch = arm64
-qemu_params = -append 'pmu-overflow-interrupt'
+test_args = pmu-overflow-interrupt
 
 # Test PMU support (TCG) with -icount IPC=1
 #[pmu-tcg-icount-1]
 #file = pmu.flat
-#qemu_params = -icount 0 -append 'cycle-counter 1'
+#test_args = "cycle-counter 1"
+#qemu_params = -icount 0
 #groups = pmu
 #accel = tcg
 
 # Test PMU support (TCG) with -icount IPC=256
 #[pmu-tcg-icount-256]
 #file = pmu.flat
-#qemu_params = -icount 8 -append 'cycle-counter 256'
+#test_args = "cycle-counter 256"
+#qemu_params = -icount 8
 #groups = pmu
 #accel = tcg
 
@@ -126,77 +129,89 @@ qemu_params = -append 'pmu-overflow-interrupt'
 [gicv2-ipi]
 file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
-qemu_params = -machine gic-version=2 -append 'ipi'
+test_args = ipi
+qemu_params = -machine gic-version=2
 groups = gic
 
 [gicv2-mmio]
 file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
-qemu_params = -machine gic-version=2 -append 'mmio'
+test_args = mmio
+qemu_params = -machine gic-version=2
 groups = gic
 
 [gicv2-mmio-up]
 file = gic.flat
 smp = 1
-qemu_params = -machine gic-version=2 -append 'mmio'
+test_args = mmio
+qemu_params = -machine gic-version=2
 groups = gic
 
 [gicv2-mmio-3p]
 file = gic.flat
 smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
-qemu_params = -machine gic-version=2 -append 'mmio'
+test_args = mmio
+qemu_params = -machine gic-version=2
 groups = gic
 
 [gicv3-ipi]
 file = gic.flat
 smp = $MAX_SMP
-qemu_params = -machine gic-version=3 -append 'ipi'
+test_args = ipi
+qemu_params = -machine gic-version=3
 groups = gic
 
 [gicv2-active]
 file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
-qemu_params = -machine gic-version=2 -append 'active'
+test_args = active
+qemu_params = -machine gic-version=2
 groups = gic
 
 [gicv3-active]
 file = gic.flat
 smp = $MAX_SMP
-qemu_params = -machine gic-version=3 -append 'active'
+test_args = active
+qemu_params = -machine gic-version=3
 groups = gic
 
 [its-introspection]
 file = gic.flat
 smp = $MAX_SMP
-qemu_params = -machine gic-version=3 -append 'its-introspection'
+test_args = its-introspection
+qemu_params = -machine gic-version=3
 groups = its
 arch = arm64
 
 [its-trigger]
 file = gic.flat
 smp = $MAX_SMP
-qemu_params = -machine gic-version=3 -append 'its-trigger'
+test_args = its-trigger
+qemu_params = -machine gic-version=3
 groups = its
 arch = arm64
 
 [its-migration]
 file = gic.flat
 smp = $MAX_SMP
-qemu_params = -machine gic-version=3 -append 'its-migration'
+test_args = its-migration
+qemu_params = -machine gic-version=3
 groups = its migration
 arch = arm64
 
 [its-pending-migration]
 file = gic.flat
 smp = $MAX_SMP
-qemu_params = -machine gic-version=3 -append 'its-pending-migration'
+test_args = its-pending-migration
+qemu_params = -machine gic-version=3
 groups = its migration
 arch = arm64
 
 [its-migrate-unmapped-collection]
 file = gic.flat
 smp = $MAX_SMP
-qemu_params = -machine gic-version=3 -append 'its-migrate-unmapped-collection'
+test_args = its-migrate-unmapped-collection
+qemu_params = -machine gic-version=3
 groups = its migration
 arch = arm64
 
@@ -231,37 +246,37 @@ groups = cache
 [debug-bp]
 file = debug.flat
 arch = arm64
-qemu_params = -append 'bp'
+test_args = bp
 groups = debug
 
 [debug-bp-migration]
 file = debug.flat
 arch = arm64
-qemu_params = -append 'bp-migration'
+test_args = bp-migration
 groups = debug migration
 
 [debug-wp]
 file = debug.flat
 arch = arm64
-qemu_params = -append 'wp'
+test_args = wp
 groups = debug
 
 [debug-wp-migration]
 file = debug.flat
 arch = arm64
-qemu_params = -append 'wp-migration'
+test_args = wp-migration
 groups = debug migration
 
 [debug-sstep]
 file = debug.flat
 arch = arm64
-qemu_params = -append 'ss'
+test_args = ss
 groups = debug
 
 [debug-sstep-migration]
 file = debug.flat
 arch = arm64
-qemu_params = -append 'ss-migration'
+test_args = ss-migration
 groups = debug migration
 
 # FPU/SIMD test
@@ -276,17 +291,20 @@ arch = arm64
 [mte-sync]
 file = mte.flat
 groups = mte
-qemu_params = -machine mte=on -append 'sync'
+test_args=sync
+qemu_params = -machine mte=on
 arch = arm64
 
 [mte-async]
 file = mte.flat
 groups = mte
-qemu_params = -machine mte=on -append 'async'
+test_args=async
+qemu_params = -machine mte=on
 arch = arm64
 
 [mte-asymm]
 file = mte.flat
 groups = mte
-qemu_params = -machine mte=on -append 'asymm'
+test_args=asymm
+qemu_params = -machine mte=on
 arch = arm64
diff --git a/docs/unittests.txt b/docs/unittests.txt
index 3d19fd70953f..6eb315618dbd 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -56,13 +56,22 @@ smp = <number>
 Optional, the number of processors created in the machine to run the test.
 Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
 
+test_args
+---------
+test_args = "..."
+
+Optional, will be used to pass arguments into the test case argv. If multiple,
+space separated, arguments need to be passed to a test, wrap them in quotes.
+Backticks can be used to pass the result of shell commands, for example:
+
+test_args = "10000000 `date +%s`"
+
 qemu_params
 ------------
-These are extra parameters supplied to the QEMU process. -append '...' can
-be used to pass arguments into the test case argv. Multiple parameters can
-be added, for example:
+These are extra parameters supplied to the QEMU process. Multiple parameters
+can be added, for example:
 
-qemu_params = -m 256 -append 'smp=2'
+qemu_params = -m 256 -machine pit=off
 
 extra_params
 ------------
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 5097911e4bf3..2dd32edfa1ae 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -15,7 +15,8 @@
 [selftest-setup]
 file = selftest.elf
 smp = 2
-qemu_params = -m 1g -append 'setup smp=2 mem=1024'
+test_args = 'setup smp=2 mem=1024'
+qemu_params = -m 1g
 groups = selftest
 
 [selftest-migration]
@@ -27,7 +28,7 @@ groups = selftest migration
 file = selftest-migration.elf
 machine = pseries
 groups = selftest migration
-qemu_params = -append "skip"
+test_args = "skip"
 
 [migration-memory]
 file = memory-verify.elf
@@ -46,20 +47,21 @@ machine = pseries
 file = rtas.elf
 machine = pseries
 timeout = 5
-qemu_params = -append "get-time-of-day date=$(date +%s)"
+test_args = "get-time-of-day date=$(date +%s)"
 groups = rtas
 
 [rtas-get-time-of-day-base]
 file = rtas.elf
 machine = pseries
 timeout = 5
-qemu_params = -rtc base="2006-06-17" -append "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
+test_args = "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
+qemu_params = -rtc base="2006-06-17"
 groups = rtas
 
 [rtas-set-time-of-day]
 file = rtas.elf
 machine = pseries
-qemu_params = -append "set-time-of-day"
+test_args = "set-time-of-day"
 timeout = 5
 groups = rtas
 
@@ -94,7 +96,7 @@ smp = 2
 [atomics-migration]
 file = atomics.elf
 machine = pseries
-qemu_params = -append "migration -m"
+test_args = "migration -m"
 groups = migration
 
 [timebase]
@@ -110,7 +112,8 @@ file = tm.elf
 machine = pseries
 accel = kvm
 smp = 2,threads=2
-qemu_params = -machine cap-htm=on -append "h_cede_tm"
+test_args = "h_cede_tm"
+qemu_params = -machine cap-htm=on
 groups = h_cede_tm
 
 [sprs]
@@ -119,7 +122,7 @@ file = sprs.elf
 [sprs-migration]
 file = sprs.elf
 machine = pseries
-qemu_params = -append '-w'
+test_args = '-w'
 groups = migration
 
 [sieve]
diff --git a/riscv/unittests.cfg b/riscv/unittests.cfg
index 5b31047f75c7..8a98ac723c2c 100644
--- a/riscv/unittests.cfg
+++ b/riscv/unittests.cfg
@@ -10,7 +10,7 @@
 [selftest]
 file = selftest.flat
 smp = $MAX_SMP
-qemu_params = -append 'foo bar baz'
+test_args = 'foo bar baz'
 groups = selftest
 
 # Set $FIRMWARE_OVERRIDE to /path/to/firmware to select the SBI implementation.
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index 1e129fef3c38..ed4d069ece38 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -10,7 +10,7 @@
 file = selftest.elf
 groups = selftest
 # please keep the kernel cmdline in sync with $(TEST_DIR)/selftest.parmfile
-qemu_params = -append 'test 123'
+test_args = 'test 123'
 
 [selftest-migration]
 file = selftest-migration.elf
@@ -22,7 +22,7 @@ accel = kvm
 [selftest-migration-skip]
 file = selftest-migration.elf
 groups = selftest migration
-qemu_params = -append "skip"
+test_args = "skip"
 
 # This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
 [migration-memory]
@@ -214,13 +214,13 @@ smp = 2
 [migration-skey-sequential]
 file = migration-skey.elf
 groups = migration
-qemu_params = -append '--sequential'
+test_args = '--sequential'
 
 [migration-skey-parallel]
 file = migration-skey.elf
 smp = 2
 groups = migration
-qemu_params = -append '--parallel'
+test_args = '--parallel'
 
 [execute]
 file = ex.elf
@@ -252,12 +252,13 @@ file = topology.elf
 
 [topology-2]
 file = topology.elf
-qemu_params = -cpu max,ctop=on -smp sockets=31,cores=8,maxcpus=248  -append '-sockets 31 -cores 8'
+test_args = '-sockets 31 -cores 8'
+qemu_params = -cpu max,ctop=on -smp sockets=31,cores=8,maxcpus=248
 
 [topology-3]
 file = topology.elf
+test_args = '-drawers 2 -books 2 -sockets 2 -cores 16'
 qemu_params = """-cpu max,ctop=on -smp cpus=1,drawers=2,books=2,sockets=2,cores=16,maxcpus=128 \
--append '-drawers 2 -books 2 -sockets 2 -cores 16' \
 -device max-s390x-cpu,core-id=31,drawer-id=0,book-id=0,socket-id=0,entitlement=medium,dedicated=false \
 -device max-s390x-cpu,core-id=11,drawer-id=0,book-id=0,socket-id=0,entitlement=high,dedicated=true \
 -device max-s390x-cpu,core-id=95,drawer-id=0,book-id=0,socket-id=0,entitlement=medium,dedicated=false \
diff --git a/scripts/common.bash b/scripts/common.bash
index bd7c82f1adda..9deb87d4050d 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -7,6 +7,7 @@ function for_each_unittest()
 	local testname
 	local smp
 	local kernel
+	local test_args
 	local opts
 	local groups
 	local arch
@@ -22,11 +23,12 @@ function for_each_unittest()
 		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
 			rematch=${BASH_REMATCH[1]}
 			if [ -n "${testname}" ]; then
-				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 			fi
 			testname=$rematch
 			smp=1
 			kernel=""
+			test_args=""
 			opts=""
 			groups=""
 			arch=""
@@ -38,6 +40,8 @@ function for_each_unittest()
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
 			smp=${BASH_REMATCH[1]}
+		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
+			test_args=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
 			opts=${BASH_REMATCH[2]}$'\n'
 			while read -r -u $fd; do
@@ -71,7 +75,7 @@ function for_each_unittest()
 		fi
 	done
 	if [ -n "${testname}" ]; then
-		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 	fi
 	exec {fd}<&-
 }
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 400e8a082528..06cc58e79b69 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -80,12 +80,18 @@ function run()
     local groups="$2"
     local smp="$3"
     local kernel="$4"
-    local opts="$5"
-    local arch="$6"
-    local machine="$7"
-    local check="${CHECK:-$8}"
-    local accel="$9"
-    local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
+    local test_args="$5"
+    local opts="$6"
+    local arch="$7"
+    local machine="$8"
+    local check="${CHECK:-$9}"
+    local accel="${10}"
+    local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
+
+    # If $test_args is empty, qemu will interpret the first option after -append
+    # as a kernel parameter instead of a qemu option, so make sure the -append
+    # option is used only if $test_args is not empy.
+    [ -n "$test_args" ] && opts="-append $test_args $opts"
 
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
diff --git a/x86/unittests.cfg b/x86/unittests.cfg
index a356f486eaec..3effddfe4207 100644
--- a/x86/unittests.cfg
+++ b/x86/unittests.cfg
@@ -58,27 +58,27 @@ smp = 3
 
 [vmexit_cpuid]
 file = vmexit.flat
-qemu_params = -append 'cpuid'
+test_args = 'cpuid'
 groups = vmexit
 
 [vmexit_vmcall]
 file = vmexit.flat
-qemu_params = -append 'vmcall'
+test_args = 'vmcall'
 groups = vmexit
 
 [vmexit_mov_from_cr8]
 file = vmexit.flat
-qemu_params = -append 'mov_from_cr8'
+test_args = 'mov_from_cr8'
 groups = vmexit
 
 [vmexit_mov_to_cr8]
 file = vmexit.flat
-qemu_params = -append 'mov_to_cr8'
+test_args = 'mov_to_cr8'
 groups = vmexit
 
 [vmexit_inl_pmtimer]
 file = vmexit.flat
-qemu_params = -append 'inl_from_pmtimer'
+test_args = 'inl_from_pmtimer'
 groups = vmexit
 
 # To allow IPIs to be accelerated by SVM AVIC when the feature is available and
@@ -87,40 +87,43 @@ groups = vmexit
 [vmexit_ipi]
 file = vmexit.flat
 smp = 2
-qemu_params = -machine pit=off -append 'ipi'
+test_args = 'ipi'
+qemu_params = -machine pit=off
 groups = vmexit
 
 [vmexit_ipi_halt]
 file = vmexit.flat
 smp = 2
-qemu_params = -append 'ipi_halt'
+test_args = 'ipi_halt'
 groups = vmexit
 
 [vmexit_ple_round_robin]
 file = vmexit.flat
-qemu_params = -append 'ple_round_robin'
+test_args = 'ple_round_robin'
 groups = vmexit
 
 [vmexit_tscdeadline]
 file = vmexit.flat
 groups = vmexit
-qemu_params = -cpu qemu64,+x2apic,+tsc-deadline -append tscdeadline
+test_args = tscdeadline
+qemu_params = -cpu qemu64,+x2apic,+tsc-deadline
 
 [vmexit_tscdeadline_immed]
 file = vmexit.flat
 groups = vmexit
-qemu_params = -cpu qemu64,+x2apic,+tsc-deadline -append tscdeadline_immed
+test_args = tscdeadline_immed
+qemu_params = -cpu qemu64,+x2apic,+tsc-deadline
 
 [vmexit_cr0_wp]
 file = vmexit.flat
 smp = 2
-qemu_params = -append 'toggle_cr0_wp'
+test_args = 'toggle_cr0_wp'
 groups = vmexit
 
 [vmexit_cr4_pge]
 file = vmexit.flat
 smp = 2
-qemu_params = -append 'toggle_cr4_pge'
+test_args = 'toggle_cr4_pge'
 groups = vmexit
 
 [access]
@@ -131,7 +134,8 @@ qemu_params = -cpu max,host-phys-bits
 [access_fep]
 file = access_test.flat
 arch = x86_64
-qemu_params = -cpu max,host-phys-bits -append force_emulation
+test_args = force_emulation
+qemu_params = -cpu max,host-phys-bits
 groups = nodefault
 timeout = 240
 
@@ -256,13 +260,15 @@ arch = x86_64
 [svm]
 file = svm.flat
 smp = 2
-qemu_params = -cpu max,+svm -m 4g -append "-pause_filter_test"
+test_args = "-pause_filter_test"
+qemu_params = -cpu max,+svm -m 4g
 arch = x86_64
 groups = svm
 
 [svm_pause_filter]
 file = svm.flat
-qemu_params = -cpu max,+svm -overcommit cpu-pm=on -m 4g -append pause_filter_test
+test_args = pause_filter_test
+qemu_params = -cpu max,+svm -overcommit cpu-pm=on -m 4g
 arch = x86_64
 groups = svm
 
@@ -285,7 +291,7 @@ groups = tasks
 [kvmclock_test]
 file = kvmclock_test.flat
 smp = 2
-qemu_params = --append "10000000 `date +%s`"
+test_args = "10000000 `date +%s`"
 
 [pcid-enabled]
 file = pcid.flat
@@ -320,33 +326,38 @@ qemu_params = -cpu max,host-phys-bits
 
 [vmx]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append "-exit_monitor_from_l2_test -ept_access* -vmx_smp* -vmx_vmcs_shadow_test -atomic_switch_overflow_msrs_test -vmx_init_signal_test -vmx_apic_passthrough_tpr_threshold_test -apic_reg_virt_test -virt_x2apic_mode_test -vmx_pf_exception_test -vmx_pf_exception_forced_emulation_test -vmx_pf_no_vpid_test -vmx_pf_invvpid_test -vmx_pf_vpid_test -vmx_basic_vid_test -vmx_eoi_virt_test -vmx_posted_interrupts_test"
+test_args = "-exit_monitor_from_l2_test -ept_access* -vmx_smp* -vmx_vmcs_shadow_test -atomic_switch_overflow_msrs_test -vmx_init_signal_test -vmx_apic_passthrough_tpr_threshold_test -apic_reg_virt_test -virt_x2apic_mode_test -vmx_pf_exception_test -vmx_pf_exception_forced_emulation_test -vmx_pf_no_vpid_test -vmx_pf_invvpid_test -vmx_pf_vpid_test -vmx_basic_vid_test -vmx_eoi_virt_test -vmx_posted_interrupts_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx
 
 [ept]
 file = vmx.flat
-qemu_params = -cpu max,host-phys-bits,+vmx -m 2560 -append "ept_access*"
+test_args = "ept_access*"
+qemu_params = -cpu max,host-phys-bits,+vmx -m 2560
 arch = x86_64
 groups = vmx
 
 [vmx_eoi_bitmap_ioapic_scan]
 file = vmx.flat
 smp = 2
-qemu_params = -cpu max,+vmx -m 2048 -append vmx_eoi_bitmap_ioapic_scan_test
+test_args = vmx_eoi_bitmap_ioapic_scan_test
+qemu_params = -cpu max,+vmx -m 2048
 arch = x86_64
 groups = vmx
 
 [vmx_hlt_with_rvi_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append vmx_hlt_with_rvi_test
+test_args = vmx_hlt_with_rvi_test
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx
 timeout = 10
 
 [vmx_apicv_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append "apic_reg_virt_test virt_x2apic_mode_test vmx_basic_vid_test vmx_eoi_virt_test"
+test_args = "apic_reg_virt_test virt_x2apic_mode_test vmx_basic_vid_test vmx_eoi_virt_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx
 timeout = 30
@@ -354,7 +365,8 @@ timeout = 30
 [vmx_posted_intr_test]
 file = vmx.flat
 smp = 2
-qemu_params = -cpu max,+vmx -append "vmx_posted_interrupts_test"
+test_args = "vmx_posted_interrupts_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx
 timeout = 10
@@ -362,14 +374,16 @@ timeout = 10
 [vmx_apic_passthrough_thread]
 file = vmx.flat
 smp = 2
-qemu_params = -cpu max,+vmx -m 2048 -append vmx_apic_passthrough_thread_test
+test_args = vmx_apic_passthrough_thread_test
+qemu_params = -cpu max,+vmx -m 2048
 arch = x86_64
 groups = vmx
 
 [vmx_init_signal_test]
 file = vmx.flat
 smp = 2
-qemu_params = -cpu max,+vmx -m 2048 -append vmx_init_signal_test
+test_args = vmx_init_signal_test
+qemu_params = -cpu max,+vmx -m 2048
 arch = x86_64
 groups = vmx
 timeout = 10
@@ -377,62 +391,71 @@ timeout = 10
 [vmx_sipi_signal_test]
 file = vmx.flat
 smp = 2
-qemu_params = -cpu max,+vmx -m 2048 -append vmx_sipi_signal_test
+test_args = vmx_sipi_signal_test
+qemu_params = -cpu max,+vmx -m 2048
 arch = x86_64
 groups = vmx
 timeout = 10
 
 [vmx_apic_passthrough_tpr_threshold_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -m 2048 -append vmx_apic_passthrough_tpr_threshold_test
+test_args = vmx_apic_passthrough_tpr_threshold_test
+qemu_params = -cpu max,+vmx -m 2048
 arch = x86_64
 groups = vmx
 timeout = 10
 
 [vmx_vmcs_shadow_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append vmx_vmcs_shadow_test
+test_args = vmx_vmcs_shadow_test
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx
 timeout = 180
 
 [vmx_pf_exception_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append "vmx_pf_exception_test"
+test_args = "vmx_pf_exception_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx nested_exception
 
 [vmx_pf_exception_test_fep]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append "vmx_pf_exception_forced_emulation_test"
+test_args = "vmx_pf_exception_forced_emulation_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx nested_exception nodefault
 timeout = 240
 
 [vmx_pf_vpid_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append "vmx_pf_vpid_test"
+test_args = "vmx_pf_vpid_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx nested_exception nodefault
 timeout = 240
 
 [vmx_pf_invvpid_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append "vmx_pf_invvpid_test"
+test_args = "vmx_pf_invvpid_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx nested_exception nodefault
 timeout = 240
 
 [vmx_pf_no_vpid_test]
 file = vmx.flat
-qemu_params = -cpu max,+vmx -append "vmx_pf_no_vpid_test"
+test_args = "vmx_pf_no_vpid_test"
+qemu_params = -cpu max,+vmx
 arch = x86_64
 groups = vmx nested_exception nodefault
 timeout = 240
 
 [vmx_pf_exception_test_reduced_maxphyaddr]
 file = vmx.flat
-qemu_params = -cpu IvyBridge,phys-bits=36,host-phys-bits=off,+vmx -append "vmx_pf_exception_test"
+test_args = "vmx_pf_exception_test"
+qemu_params = -cpu IvyBridge,phys-bits=36,host-phys-bits=off,+vmx
 arch = x86_64
 groups = vmx nested_exception
 check = /sys/module/kvm_intel/parameters/allow_smaller_maxphyaddr=Y
@@ -462,7 +485,8 @@ groups = hyperv
 [hyperv_stimer_direct]
 file = hyperv_stimer.flat
 smp = 2
-qemu_params = -cpu host,hv_passthrough -append direct
+test_args = direct
+qemu_params = -cpu host,hv_passthrough
 groups = hyperv
 
 [hyperv_clock]
-- 
2.49.0


