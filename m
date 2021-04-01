Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D27350F3C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 08:44:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9tvY3kPVz3c4D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:44:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F9ttv3nGzz30Bp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 17:43:51 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE312D6E;
 Wed, 31 Mar 2021 23:43:49 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.70.228])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 183EF3F719;
 Wed, 31 Mar 2021 23:43:42 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org
Subject: [PATCH V2 3/6] mm: Generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]
Date: Thu,  1 Apr 2021 12:14:05 +0530
Message-Id: <1617259448-22529-4-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617259448-22529-1-git-send-email-anshuman.khandual@arm.com>
References: <1617259448-22529-1-git-send-email-anshuman.khandual@arm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Vasily Gorbik <gor@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-sh@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>,
 linux-ia64@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE] configs have duplicate definitions
on platforms that subscribe them. Instead, just make them generic options
which can be selected on applicable platforms.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-ia64@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Catalin Marinas <catalin.marinas@arm.com> (arm64)
Acked-by: Heiko Carstens <hca@linux.ibm.com> (s390)
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig   |  8 ++------
 arch/ia64/Kconfig    |  8 ++------
 arch/powerpc/Kconfig |  8 ++------
 arch/s390/Kconfig    |  8 ++------
 arch/sh/Kconfig      |  2 ++
 arch/sh/mm/Kconfig   |  8 --------
 arch/x86/Kconfig     | 10 ++--------
 mm/Kconfig           |  6 ++++++
 8 files changed, 18 insertions(+), 40 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c86b28ef6ac0..48355c5519c3 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -11,6 +11,8 @@ config ARM64
 	select ACPI_PPTT if ACPI
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_ENABLE_MEMORY_HOTPLUG
+	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -305,12 +307,6 @@ config ZONE_DMA32
 	bool "Support DMA32 zone" if EXPERT
 	default y
 
-config ARCH_ENABLE_MEMORY_HOTPLUG
-	def_bool y
-
-config ARCH_ENABLE_MEMORY_HOTREMOVE
-	def_bool y
-
 config SMP
 	def_bool y
 
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 2ad7a8d29fcc..96ce53ad5c9d 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -13,6 +13,8 @@ config IA64
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ACPI
 	select ACPI_NUMA if NUMA
+	select ARCH_ENABLE_MEMORY_HOTPLUG
+	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_SUPPORTS_ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT if ACPI
 	select ARCH_MIGHT_HAVE_ACPI_PDC if ACPI
@@ -250,12 +252,6 @@ config HOTPLUG_CPU
 	  can be controlled through /sys/devices/system/cpu/cpu#.
 	  Say N if you want to disable CPU hotplug.
 
-config ARCH_ENABLE_MEMORY_HOTPLUG
-	def_bool y
-
-config ARCH_ENABLE_MEMORY_HOTREMOVE
-	def_bool y
-
 config SCHED_SMT
 	bool "SMT scheduler support"
 	depends on SMP
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a74c211e55b1..02a05a24659d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -118,6 +118,8 @@ config PPC
 	# Please keep this list sorted alphabetically.
 	#
 	select ARCH_32BIT_OFF_T if PPC32
+	select ARCH_ENABLE_MEMORY_HOTPLUG
+	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
@@ -515,12 +517,6 @@ config ARCH_CPU_PROBE_RELEASE
 	def_bool y
 	depends on HOTPLUG_CPU
 
-config ARCH_ENABLE_MEMORY_HOTPLUG
-	def_bool y
-
-config ARCH_ENABLE_MEMORY_HOTREMOVE
-	def_bool y
-
 config PPC64_SUPPORTS_MEMORY_FAILURE
 	bool "Add support for memory hwpoison"
 	depends on PPC_BOOK3S_64
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index c1ff874e6c2e..f8b356550daa 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -60,6 +60,8 @@ config S390
 	imply IMA_SECURE_AND_OR_TRUSTED_BOOT
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM
+	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
@@ -626,12 +628,6 @@ config ARCH_SPARSEMEM_ENABLE
 config ARCH_SPARSEMEM_DEFAULT
 	def_bool y
 
-config ARCH_ENABLE_MEMORY_HOTPLUG
-	def_bool y if SPARSEMEM
-
-config ARCH_ENABLE_MEMORY_HOTREMOVE
-	def_bool y
-
 config ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	def_bool y
 
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index a54b0c5de37b..68129537e350 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -2,6 +2,8 @@
 config SUPERH
 	def_bool y
 	select ARCH_32BIT_OFF_T
+	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM && MMU
+	select ARCH_ENABLE_MEMORY_HOTREMOVE if SPARSEMEM && MMU
 	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if (GUSA_RB || CPU_SH4A)
 	select ARCH_HAS_BINFMT_FLAT if !MMU
diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
index 77aa2f802d8d..d551a9cac41e 100644
--- a/arch/sh/mm/Kconfig
+++ b/arch/sh/mm/Kconfig
@@ -136,14 +136,6 @@ config ARCH_SPARSEMEM_DEFAULT
 config ARCH_SELECT_MEMORY_MODEL
 	def_bool y
 
-config ARCH_ENABLE_MEMORY_HOTPLUG
-	def_bool y
-	depends on SPARSEMEM && MMU
-
-config ARCH_ENABLE_MEMORY_HOTREMOVE
-	def_bool y
-	depends on SPARSEMEM && MMU
-
 config ARCH_MEMORY_PROBE
 	def_bool y
 	depends on MEMORY_HOTPLUG
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 51d171abb57a..503d8b2e8676 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -60,6 +60,8 @@ config X86
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_32BIT_OFF_T			if X86_32
 	select ARCH_CLOCKSOURCE_INIT
+	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64 || (X86_32 && HIGHMEM)
+	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -2423,14 +2425,6 @@ config ARCH_HAS_ADD_PAGES
 	def_bool y
 	depends on X86_64 && ARCH_ENABLE_MEMORY_HOTPLUG
 
-config ARCH_ENABLE_MEMORY_HOTPLUG
-	def_bool y
-	depends on X86_64 || (X86_32 && HIGHMEM)
-
-config ARCH_ENABLE_MEMORY_HOTREMOVE
-	def_bool y
-	depends on MEMORY_HOTPLUG
-
 config USE_PERCPU_NUMA_NODE_ID
 	def_bool y
 	depends on NUMA
diff --git a/mm/Kconfig b/mm/Kconfig
index 1c9a37fc651a..9b58fa08847d 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -149,6 +149,9 @@ config MEMORY_ISOLATION
 config HAVE_BOOTMEM_INFO_NODE
 	def_bool n
 
+config ARCH_ENABLE_MEMORY_HOTPLUG
+	bool
+
 # eventually, we can have this option just 'select SPARSEMEM'
 config MEMORY_HOTPLUG
 	bool "Allow for memory hot-add"
@@ -177,6 +180,9 @@ config MEMORY_HOTPLUG_DEFAULT_ONLINE
 	  Say N here if you want the default policy to keep all hot-plugged
 	  memory blocks in 'offline' state.
 
+config ARCH_ENABLE_MEMORY_HOTREMOVE
+	bool
+
 config MEMORY_HOTREMOVE
 	bool "Allow for memory hot remove"
 	select HAVE_BOOTMEM_INFO_NODE if (X86_64 || PPC64)
-- 
2.20.1

