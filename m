Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 013F43320AB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 09:34:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvpQk3jppz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 19:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DvpPn0dD3z3cW2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 19:33:16 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BF82D6E;
 Tue,  9 Mar 2021 00:33:15 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.66.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 71A553F71B;
 Tue,  9 Mar 2021 00:33:10 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH 4/6] mm: Drop redundant ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION
Date: Tue,  9 Mar 2021 14:03:08 +0530
Message-Id: <1615278790-18053-5-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615278790-18053-1-git-send-email-anshuman.khandual@arm.com>
References: <1615278790-18053-1-git-send-email-anshuman.khandual@arm.com>
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
Cc: x86@kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION configs have duplicate definitions on
platforms that subscribe them. Drop these reduntant definitions and instead
just select them appropriately.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/Kconfig                     | 10 ++--------
 arch/powerpc/platforms/Kconfig.cputype |  5 +----
 arch/x86/Kconfig                       | 10 ++--------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 67e904b0f32a..c0e75f62f08c 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -11,8 +11,10 @@ config ARM64
 	select ACPI_PPTT if ACPI
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_BINFMT_ELF_STATE
+	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
+	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -1903,14 +1905,6 @@ config SYSVIPC_COMPAT
 	def_bool y
 	depends on COMPAT && SYSVIPC
 
-config ARCH_ENABLE_HUGEPAGE_MIGRATION
-	def_bool y
-	depends on HUGETLB_PAGE && MIGRATION
-
-config ARCH_ENABLE_THP_MIGRATION
-	def_bool y
-	depends on TRANSPARENT_HUGEPAGE
-
 menu "Power management options"
 
 source "kernel/power/Kconfig"
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index cec1017813f8..4465b71b2bff 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -96,6 +96,7 @@ config PPC_BOOK3S_64
 	select PPC_FPU
 	select PPC_HAVE_PMU_SUPPORT
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
+	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_HUGETLBFS
 	select ARCH_SUPPORTS_NUMA_BALANCING
@@ -420,10 +421,6 @@ config PPC_PKEY
 	depends on PPC_BOOK3S_64
 	depends on PPC_MEM_KEYS || PPC_KUAP || PPC_KUEP
 
-config ARCH_ENABLE_HUGEPAGE_MIGRATION
-	def_bool y
-	depends on PPC_BOOK3S_64 && HUGETLB_PAGE && MIGRATION
-
 
 config PPC_MMU_NOHASH
 	def_bool y
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 503d8b2e8676..10702ef1eb57 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -60,8 +60,10 @@ config X86
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ARCH_32BIT_OFF_T			if X86_32
 	select ARCH_CLOCKSOURCE_INIT
+	select ARCH_ENABLE_HUGEPAGE_MIGRATION if x86_64 && HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_MEMORY_HOTPLUG if X86_64 || (X86_32 && HIGHMEM)
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
+	select ARCH_ENABLE_THP_MIGRATION if x86_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -2433,14 +2435,6 @@ config ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	def_bool y
 	depends on X86_64 || X86_PAE
 
-config ARCH_ENABLE_HUGEPAGE_MIGRATION
-	def_bool y
-	depends on X86_64 && HUGETLB_PAGE && MIGRATION
-
-config ARCH_ENABLE_THP_MIGRATION
-	def_bool y
-	depends on X86_64 && TRANSPARENT_HUGEPAGE
-
 menu "Power management and ACPI options"
 
 config ARCH_HIBERNATION_HEADER
-- 
2.20.1

