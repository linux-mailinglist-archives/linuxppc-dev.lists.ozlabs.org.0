Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8A91BE4A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 14:16:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LoBhqVT8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W9ZCl0rmqz3cby
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2024 22:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LoBhqVT8;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W9Z7F3vDFz3cbX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2024 22:12:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719576725;
	bh=RrS40OIYMVwMmZ4uED0LJB4GpzAzYiyL4Abmsao5qik=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LoBhqVT8UORVE0FLAYbtsXzxmtE1r6/hRThYoxY9ZSAD8ANAbvfnTFl/X2y3+Zke5
	 6urSgCpNucMbJFs4LRkOiFWd9dNfxj+jvWBXSUU/+cgUtNXAWyhOxdBikL4tt/IcgW
	 Tx5Fj9d1C/BlGIsCk22iQnac21MpVtGF179f9QWPJi+GQQBDS09W042Q5bNVcv7D1F
	 F5OnRj7H0Pc4BUl7nRzWpvIQElzxnncmcAdFvX0XmCUYCbVEaKl2eCfP4PO2GU4kdO
	 2Zoe3PX0skhaUSBtKwFgBs5efBoX8a48rSHT3SSbRZ/3NwDolLJfbRRuYaCnY50r0e
	 KK4dgtlMDlkXg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W9Z7904F0z4wcS;
	Fri, 28 Jun 2024 22:12:04 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 3/7] powerpc: Remove 40x from Kconfig and defconfig
Date: Fri, 28 Jun 2024 22:11:57 +1000
Message-ID: <20240628121201.130802-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628121201.130802-1-mpe@ellerman.id.au>
References: <20240628121201.130802-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove 40x from Kconfig, making the code unreachable.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig                   | 12 ++++++------
 arch/powerpc/Kconfig.debug             | 13 -------------
 arch/powerpc/Makefile                  |  5 -----
 arch/powerpc/configs/40x.config        |  2 --
 arch/powerpc/platforms/Kconfig.cputype | 21 ++++-----------------
 5 files changed, 10 insertions(+), 43 deletions(-)
 delete mode 100644 arch/powerpc/configs/40x.config

v3: Unchanged.

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c88c6d46a5bc..16d625c71dfa 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -149,7 +149,7 @@ config PPC
 	select ARCH_HAS_PTE_SPECIAL
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
-	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx || 40x) && !HIBERNATION
+	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
 	select ARCH_HAS_STRICT_KERNEL_RWX	if PPC_85xx && !HIBERNATION && !RANDOMIZE_BASE
 	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_SYSCALL_WRAPPER		if !SPU_BASE && !COMPAT
@@ -167,7 +167,7 @@ config PPC
 	select ARCH_SPLIT_ARG64			if PPC32
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
-	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
+	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
@@ -389,7 +389,7 @@ config ARCH_SUSPEND_POSSIBLE
 	def_bool y
 	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
 		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
-		   || 44x || 40x
+		   || 44x
 
 config ARCH_SUSPEND_NONZERO_CPU
 	def_bool y
@@ -443,7 +443,7 @@ config ARCH_SUPPORTS_UPROBES
 
 config PPC_ADV_DEBUG_REGS
 	bool
-	depends on 40x || BOOKE
+	depends on BOOKE
 	default y
 
 config PPC_ADV_DEBUG_IACS
@@ -1077,7 +1077,7 @@ config GENERIC_ISA_DMA
 config PPC_INDIRECT_PCI
 	bool
 	depends on PCI
-	default y if 40x || 44x
+	default y if 44x
 
 config SBUS
 	bool
@@ -1102,7 +1102,7 @@ config FSL_PMC
 config PPC4xx_CPM
 	bool
 	default y
-	depends on SUSPEND && (44x || 40x)
+	depends on SUSPEND && 44x
 	help
 	  PPC4xx Clock Power Management (CPM) support (suspend/resume).
 	  It also enables support for two different idle states (idle-wait
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 8c80b154e814..3799ceceb04a 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -244,14 +244,6 @@ config PPC_EARLY_DEBUG_44x
 	  inbuilt serial port.  If you enable this, ensure you set
 	  PPC_EARLY_DEBUG_44x_PHYSLOW below to suit your target board.
 
-config PPC_EARLY_DEBUG_40x
-	bool "Early serial debugging for IBM/AMCC 40x CPUs"
-	depends on 40x
-	help
-	  Select this to enable early debugging for IBM 40x chips via the
-	  inbuilt serial port. This works on chips with a 16550 compatible
-	  UART.
-
 config PPC_EARLY_DEBUG_CPM
 	bool "Early serial debugging for Freescale CPM-based serial ports"
 	depends on SERIAL_CPM=y
@@ -356,11 +348,6 @@ config PPC_EARLY_DEBUG_44x_PHYSHIGH
 	depends on PPC_EARLY_DEBUG_44x
 	default "0x1"
 
-config PPC_EARLY_DEBUG_40x_PHYSADDR
-	hex "Early debug UART physical address"
-	depends on PPC_EARLY_DEBUG_40x
-	default "0xef600300"
-
 config PPC_EARLY_DEBUG_CPM_ADDR
 	hex "CPM UART early debug transmit descriptor address"
 	depends on PPC_EARLY_DEBUG_CPM
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index a8479c881cac..bbfe4a1f06ef 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -301,11 +301,6 @@ ppc32_allmodconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/book3s_32.config \
 		-f $(srctree)/Makefile allmodconfig
 
-generated_configs += ppc40x_allmodconfig
-ppc40x_allmodconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/40x.config \
-		-f $(srctree)/Makefile allmodconfig
-
 generated_configs += ppc44x_allmodconfig
 ppc44x_allmodconfig:
 	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/44x.config \
diff --git a/arch/powerpc/configs/40x.config b/arch/powerpc/configs/40x.config
deleted file mode 100644
index 82a9d58ddb81..000000000000
--- a/arch/powerpc/configs/40x.config
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_PPC64=n
-CONFIG_40x=y
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index b2d8c0da2ad9..2b686ee2dd2b 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -43,14 +43,6 @@ config PPC_8xx
 	select HAVE_ARCH_VMAP_STACK
 	select HUGETLBFS
 
-config 40x
-	bool "AMCC 40x"
-	select PPC_DCR_NATIVE
-	select PPC_UDBG_16550
-	select 4xx_SOC
-	select HAVE_PCI
-	select PPC_KUEP if PPC_KUAP
-
 config 44x
 	bool "AMCC 44x, 46x or 47x"
 	select PPC_DCR_NATIVE
@@ -194,11 +186,6 @@ config E6500_CPU
 	depends on !CC_IS_CLANG
 	select PPC_HAS_LBARX_LHARX
 
-config 405_CPU
-	bool "40x family"
-	depends on 40x
-	depends on !CC_IS_CLANG
-
 config 440_CPU
 	bool "440 (44x family)"
 	depends on 44x
@@ -340,7 +327,7 @@ config FSL_EMB_PERF_EVENT_E500
 
 config 4xx
 	bool
-	depends on 40x || 44x
+	depends on 44x
 	default y
 
 config BOOKE
@@ -350,7 +337,7 @@ config BOOKE
 
 config BOOKE_OR_40x
 	bool
-	depends on BOOKE || 40x
+	depends on BOOKE
 	default y
 
 config PTE_64BIT
@@ -495,8 +482,8 @@ config PPC_KERNEL_PCREL
 	  This option builds the kernel with the pc relative ABI model.
 
 config PPC_KUEP
-	bool "Kernel Userspace Execution Prevention" if !40x
-	default y if !40x
+	bool "Kernel Userspace Execution Prevention"
+	default y
 	help
 	  Enable support for Kernel Userspace Execution Prevention (KUEP)
 
-- 
2.45.2

