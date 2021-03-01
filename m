Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F53276BA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 05:43:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dpnh563Y4z3cMT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 15:43:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 669 seconds by postgrey-1.36 at boromir;
 Mon, 01 Mar 2021 15:42:59 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dpngl2k1Kz30Mk
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 15:42:57 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 224D11063;
 Sun, 28 Feb 2021 20:31:45 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.66.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3AF3C3F73B;
 Sun, 28 Feb 2021 20:31:38 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V2] mm/memtest: Add ARCH_USE_MEMTEST
Date: Mon,  1 Mar 2021 10:02:06 +0530
Message-Id: <1614573126-7740-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
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
Cc: Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

early_memtest() does not get called from all architectures. Hence enabling
CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
option might not trigger the memory pattern tests as would be expected in
normal circumstances. This situation is misleading.

The change here prevents the above mentioned problem after introducing a
new config option ARCH_USE_MEMTEST that should be subscribed on platforms
that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
not be tested anyway.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v5.12-rc1 and has been tested on arm64 platform.
But it has been just build tested on all other platforms.

Changes in V2:

- Added ARCH_USE_MEMTEST in the sorted alphabetical order on platforms

Changes in V1:

https://patchwork.kernel.org/project/linux-mm/patch/1612498242-31579-1-git-send-email-anshuman.khandual@arm.com/

 arch/arm/Kconfig     | 1 +
 arch/arm64/Kconfig   | 1 +
 arch/mips/Kconfig    | 1 +
 arch/powerpc/Kconfig | 1 +
 arch/x86/Kconfig     | 1 +
 arch/xtensa/Kconfig  | 1 +
 lib/Kconfig.debug    | 9 ++++++++-
 7 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 853aab5ab327..9ab047d4cd0a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -33,6 +33,7 @@ config ARM
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1f212b47a48a..d4fe5118e9c8 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -67,6 +67,7 @@ config ARM64
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_GNU_PROPERTY
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..93a4f502f962 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -14,6 +14,7 @@ config MIPS
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..3778ad17f56a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -149,6 +149,7 @@ config PPC
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC32 || PPC_BOOK3S_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..2cb76fd5258e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -100,6 +100,7 @@ config X86
 	select ARCH_SUPPORTS_LTO_CLANG		if X86_64
 	select ARCH_SUPPORTS_LTO_CLANG_THIN	if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index a99dc39f6964..ca51896c53df 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -7,6 +7,7 @@ config XTENSA
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if MMU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if MMU
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a2d04c00cda2..2c296535a4b3 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2521,11 +2521,18 @@ config TEST_FPU
 
 endif # RUNTIME_TESTING_MENU
 
+config ARCH_USE_MEMTEST
+	bool
+	help
+	  An architecture should select this when it uses early_memtest()
+	  during boot process.
+
 config MEMTEST
 	bool "Memtest"
+	depends on ARCH_USE_MEMTEST
 	help
 	  This option adds a kernel parameter 'memtest', which allows memtest
-	  to be set.
+	  to be set and executed.
 	        memtest=0, mean disabled; -- default
 	        memtest=1, mean do 1 test pattern;
 	        ...
-- 
2.20.1

