Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE0634A8DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 14:47:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6NZr3tpMz3dg3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 00:47:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6NWZ5BK1z3bwN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 00:44:58 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F6NWV6Xcgz9v03G;
 Fri, 26 Mar 2021 14:44:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id iHvyC-mVLzvr; Fri, 26 Mar 2021 14:44:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F6NWV5V7Pz9v03B;
 Fri, 26 Mar 2021 14:44:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9951F8B8C9;
 Fri, 26 Mar 2021 14:44:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yHHbHQHnKvxK; Fri, 26 Mar 2021 14:44:55 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0731A8B8C7;
 Fri, 26 Mar 2021 14:44:55 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 87B0D67611; Fri, 26 Mar 2021 13:44:55 +0000 (UTC)
Message-Id: <0ce1c49ba4db6ffad82561d8b2877bd2ecde854d.1616765870.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616765869.git.christophe.leroy@csgroup.eu>
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 08/17] microblaze: Convert to GENERIC_CMDLINE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us
Date: Fri, 26 Mar 2021 13:44:55 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 microblaze <monstr@monstr.eu>, linux-xtensa@linux-xtensa.org,
 linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, nios2 <ley.foon.tan@intel.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This converts the architecture to GENERIC_CMDLINE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/microblaze/Kconfig               | 24 +-----------------------
 arch/microblaze/configs/mmu_defconfig |  2 +-
 arch/microblaze/kernel/head.S         |  4 ++--
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 0660f47012bc..1242f34bc2a2 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -15,6 +15,7 @@ config MICROBLAZE
 	select COMMON_CLK
 	select DMA_DIRECT_REMAP
 	select GENERIC_ATOMIC64
+	select GENERIC_CMDLINE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_PROBE
@@ -93,29 +94,6 @@ source "kernel/Kconfig.hz"
 config MMU
 	def_bool y
 
-comment "Boot options"
-
-config CMDLINE_BOOL
-	bool "Default bootloader kernel arguments"
-
-config CMDLINE
-	string "Default kernel command string"
-	depends on CMDLINE_BOOL
-	default "console=ttyUL0,115200"
-	help
-	  On some architectures there is currently no way for the boot loader
-	  to pass arguments to the kernel. For these architectures, you should
-	  supply some command-line options at build time by entering them
-	  here.
-
-config CMDLINE_FORCE
-	bool "Force default kernel command string"
-	depends on CMDLINE_BOOL
-	default n
-	help
-	  Set this to have arguments from the default kernel command string
-	  override those passed by the boot loader.
-
 endmenu
 
 menu "Kernel features"
diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
index 51337fffb947..b4d2219d0a8f 100644
--- a/arch/microblaze/configs/mmu_defconfig
+++ b/arch/microblaze/configs/mmu_defconfig
@@ -16,7 +16,7 @@ CONFIG_XILINX_MICROBLAZE0_USE_DIV=1
 CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=2
 CONFIG_XILINX_MICROBLAZE0_USE_FPU=2
 CONFIG_HZ_100=y
-CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="console=ttyUL0,115200"
 CONFIG_CMDLINE_FORCE=y
 CONFIG_HIGHMEM=y
 CONFIG_PCI_XILINX=y
diff --git a/arch/microblaze/kernel/head.S b/arch/microblaze/kernel/head.S
index ec2fcb545e64..605b18c86ac8 100644
--- a/arch/microblaze/kernel/head.S
+++ b/arch/microblaze/kernel/head.S
@@ -105,7 +105,7 @@ _copy_fdt:
 	addik	r3, r3, -4 /* descrement loop */
 no_fdt_arg:
 
-#ifndef CONFIG_CMDLINE_BOOL
+#if CONFIG_CMDLINE == ""
 /*
  * handling command line
  * copy command line directly to cmd_line placed in data section.
@@ -126,7 +126,7 @@ _copy_command_line:
 	addik	r5, r4, 0		/* add new space for command line */
 	tovirt(r5,r5)
 skip:
-#endif /* CONFIG_CMDLINE_BOOL */
+#endif /* CONFIG_CMDLINE */
 
 #ifdef NOT_COMPILE
 /* save bram context */
-- 
2.25.0

