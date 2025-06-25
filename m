Return-Path: <linuxppc-dev+bounces-9778-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CEAE88C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 17:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qR4qjHz3brM;
	Thu, 26 Jun 2025 01:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750866595;
	cv=none; b=n+5Di1fgHfvGETcHTq3UQohimVzEFJ7aL4R/J6s2lKceVIT7UfIZ1lDHS4HCquylAJdeOn+iAHPjXJ+dkZUa86r1/MENqQEYnu5ZE1ibzEjK9gr13q44yG38lkGpF6VMz9Jv/Trz2BMOvJ7+j4CyiP7M9y0Xx0yWw/Q0v8WuXKfDu3hnrt9CoV8oBBNNSEgPL4VphMYywpyoB+mHvd80bHx/pjehTiDyT+CvxbCSpP//65U98w1r/ojo6b0uGxjiivu3Hok3RDhY4NEnQjHydXgaV0shKkUM6anRELYLkxaYuo1+Vsn0atuRVt1dKUag1xPvl7WG53gl+aLXPY/zJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750866595; c=relaxed/relaxed;
	bh=wEXlwRRo6hBBJALleoj7K9xPccRVPyi+OR5SYT6vXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PTnyR7bCflc6Q6iIRE0KB+vwNJyg1z19+La4SZbh+L+oTfqGa6xZ8pEjFRzC0Yz7B1zlb5SYjVOuJCi2l2+CBfTlZCJZPOjVI+27s5eFOkkQzF9AqZtyvgXmactpSdB4CTz5ZE1gy+4LbRwPRJUe5a6gEnYeXZpveMmHQmArDkNPTfzPGMpIpuPyR53XdRPO3d0U1KIMx6MfwYYtlBxsosVaB6Yi4O66/2w5mqDAmKOFehGntghPEIbe+FKvWov5XVpwi/X/+8+9SPYT7NwYZPbL62iDYJW7wgFHHEXS08b90Qbt+mzvfOqTgoJ7ILLFsJBgHsmSEnx8kQHAmoezAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=alexandru.elisei@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS5qQ5yrwz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 01:49:54 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BB352681;
	Wed, 25 Jun 2025 08:49:05 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 67E833F58B;
	Wed, 25 Jun 2025 08:49:19 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 12/13] scripts: Add 'disabled_if' test definition parameter for kvmtool to use
Date: Wed, 25 Jun 2025 16:48:12 +0100
Message-ID: <20250625154813.27254-13-alexandru.elisei@arm.com>
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

The pci-test is qemu specific. Other tests perform migration, which
isn't supported by kvmtool. In general, kvmtool is not as feature-rich
as qemu, so add a new unittest parameter, 'disabled_if', that causes a
test to be skipped if the condition evaluates to true.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/unittests.cfg    |  7 +++++++
 docs/unittests.txt   | 13 +++++++++++++
 scripts/common.bash  |  6 +++++-
 scripts/runtime.bash |  6 ++++++
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index 343c14567f27..12fc4468d0fd 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -43,6 +43,7 @@ groups = selftest
 [pci-test]
 file = pci-test.flat
 groups = pci
+disabled_if = [[ "$TARGET" != qemu ]]
 
 # Test PMU support
 [pmu-cycle-counter]
@@ -219,6 +220,7 @@ test_args = its-migration
 qemu_params = -machine gic-version=3
 kvmtool_params = --irqchip=gicv3
 groups = its migration
+disabled_if = [[ "$TARGET" != qemu ]]
 arch = arm64
 
 [its-pending-migration]
@@ -228,6 +230,7 @@ test_args = its-pending-migration
 qemu_params = -machine gic-version=3
 kvmtool_params = --irqchip=gicv3
 groups = its migration
+disabled_if = [[ "$TARGET" != qemu ]]
 arch = arm64
 
 [its-migrate-unmapped-collection]
@@ -237,6 +240,7 @@ test_args = its-migrate-unmapped-collection
 qemu_params = -machine gic-version=3
 kvmtool_params = --irqchip=gicv3
 groups = its migration
+disabled_if = [[ "$TARGET" != qemu ]]
 arch = arm64
 
 # Test PSCI emulation
@@ -278,6 +282,7 @@ file = debug.flat
 arch = arm64
 test_args = bp-migration
 groups = debug migration
+disabled_if = [[ "$TARGET" != qemu ]]
 
 [debug-wp]
 file = debug.flat
@@ -290,6 +295,7 @@ file = debug.flat
 arch = arm64
 test_args = wp-migration
 groups = debug migration
+disabled_if = [[ "$TARGET" != qemu ]]
 
 [debug-sstep]
 file = debug.flat
@@ -302,6 +308,7 @@ file = debug.flat
 arch = arm64
 test_args = ss-migration
 groups = debug migration
+disabled_if = [[ "$TARGET" != qemu ]]
 
 # FPU/SIMD test
 [fpu-context]
diff --git a/docs/unittests.txt b/docs/unittests.txt
index a9164bccc24c..921318a6d85a 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -124,3 +124,16 @@ parameter needs to be of the form <path>=<value>
 The path and value cannot contain space, =, or shell wildcard characters.
 
 Can be overwritten with the CHECK environment variable with the same syntax.
+
+disabled_if
+-----------
+disabled_if = <condition>
+
+Do not run the test if <condition> is met. <condition> will be fed unmodified
+to a bash 'if' statement and follows the same syntax.
+
+This can be used to prevent running a test when kvm-unit-tests is configured a
+certain way. For example, it can be used to skip a qemu specific test when
+using another VMM and using UEFI:
+
+disabled_if = [[ "$TARGET" != qemu ]] && [[ "$CONFIG_EFI" = y ]]
diff --git a/scripts/common.bash b/scripts/common.bash
index d5d3101c8089..283fb30f5533 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -16,6 +16,7 @@ function for_each_unittest()
 	local check
 	local accel
 	local timeout
+	local disabled_if
 	local rematch
 
 	# shellcheck disable=SC2155
@@ -27,7 +28,7 @@ function for_each_unittest()
 		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
 			rematch=${BASH_REMATCH[1]}
 			if [ -n "${testname}" ]; then
-				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$disabled_if"
 			fi
 			testname=$rematch
 			smp="$(vmm_optname_nr_cpus) 1"
@@ -44,6 +45,7 @@ function for_each_unittest()
 			check=""
 			accel=""
 			timeout=""
+			disabled_if=""
 		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
@@ -76,6 +78,8 @@ function for_each_unittest()
 			machine=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^check\ *=\ *(.*)$ ]]; then
 			check=${BASH_REMATCH[1]}
+		elif [[ $line =~ ^disabled_if\ *=\ *(.*)$ ]]; then
+			disabled_if=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^accel\ *=\ *(.*)$ ]]; then
 			accel=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^timeout\ *=\ *(.*)$ ]]; then
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 766d1d28fb75..0ff8ad08bf1d 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -83,6 +83,7 @@ function run()
     local check="${CHECK:-$9}"
     local accel="${10}"
     local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
+    local disabled_if="${12}"
 
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
@@ -130,6 +131,11 @@ function run()
         accel="$ACCEL"
     fi
 
+    if [[ "$disabled_if" ]] && (eval $disabled_if); then
+        print_result "SKIP" $testname "" "disabled because: $disabled_if"
+	return 2
+    fi
+
     # check a file for a particular value before running a test
     # the check line can contain multiple files to check separated by a space
     # but each check parameter needs to be of the form <path>=<value>
-- 
2.50.0


