Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 499D1352BB9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 17:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBkLJ27R9z3dwC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 02:22:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBkFz2rPxz3bxb
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 02:18:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkFt4S04z9v2lv;
 Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sA0hud0WLToF; Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkFt3brMz9v2ls;
 Fri,  2 Apr 2021 17:18:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 68B998BB7B;
 Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id b-4XVonvcJNM; Fri,  2 Apr 2021 17:18:12 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB36D8BB79;
 Fri,  2 Apr 2021 17:18:11 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C79AA67989; Fri,  2 Apr 2021 15:18:11 +0000 (UTC)
Message-Id: <1180421ba35993f4a533708b91c93f1da07d14dc.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 10/20] hexagon: Convert to GENERIC_CMDLINE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:11 +0000 (UTC)
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
 linux-mips@vger.kernel.org, linux-mm@kvack.org, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This converts the architecture to GENERIC_CMDLINE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/hexagon/Kconfig        | 11 +----------
 arch/hexagon/kernel/setup.c | 10 ++--------
 2 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index 44a409967af1..1e69c99bae6b 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -18,6 +18,7 @@ config HEXAGON
 	select HAVE_PERF_EVENTS
 	# GENERIC_ALLOCATOR is used by dma_alloc_coherent()
 	select GENERIC_ALLOCATOR
+	select GENERIC_CMDLINE
 	select GENERIC_IRQ_SHOW
 	select HAVE_ARCH_KGDB
 	select HAVE_ARCH_TRACEHOOK
@@ -91,16 +92,6 @@ config HEXAGON_ARCH_VERSION
 	int "Architecture version"
 	default 2
 
-config CMDLINE
-	string "Default kernel command string"
-	default ""
-	help
-	  On some platforms, there is currently no way for the boot loader
-	  to pass arguments to the kernel. For these, you should supply some
-	  command-line options at build time by entering them here.  At a
-	  minimum, you should specify the memory size and the root device
-	  (e.g., mem=64M root=/dev/nfs).
-
 config SMP
 	bool "Multi-Processing support"
 	help
diff --git a/arch/hexagon/kernel/setup.c b/arch/hexagon/kernel/setup.c
index 1880d9beaf2b..78641ce219e2 100644
--- a/arch/hexagon/kernel/setup.c
+++ b/arch/hexagon/kernel/setup.c
@@ -13,6 +13,7 @@
 #include <linux/seq_file.h>
 #include <linux/console.h>
 #include <linux/of_fdt.h>
+#include <linux/cmdline.h>
 #include <asm/io.h>
 #include <asm/sections.h>
 #include <asm/setup.h>
@@ -22,7 +23,6 @@
 #include <asm/time.h>
 
 char cmd_line[COMMAND_LINE_SIZE];
-static char default_command_line[COMMAND_LINE_SIZE] __initdata = CONFIG_CMDLINE;
 
 int on_simulator;
 
@@ -38,8 +38,6 @@ void calibrate_delay(void)
 
 void __init setup_arch(char **cmdline_p)
 {
-	char *p = &external_cmdline_buffer;
-
 	/*
 	 * These will eventually be pulled in via either some hypervisor
 	 * or devicetree description.  Hardwiring for now.
@@ -65,11 +63,7 @@ void __init setup_arch(char **cmdline_p)
 	else
 		on_simulator = 0;
 
-	if (p[0] != '\0')
-		strlcpy(boot_command_line, p, COMMAND_LINE_SIZE);
-	else
-		strlcpy(boot_command_line, default_command_line,
-			COMMAND_LINE_SIZE);
+	cmdline_build(boot_command_line, external_cmdline_buffer);
 
 	/*
 	 * boot_command_line and the value set up by setup_arch
-- 
2.25.0

