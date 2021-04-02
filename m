Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB70352BC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 17:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBkNg6HBTz3fRy
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 02:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBkG570Y7z3c3x
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 02:18:21 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBkG13TDmz9v2mD;
 Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id F6l6AA6-Funv; Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBkG11sggz9v2ls;
 Fri,  2 Apr 2021 17:18:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BFC78BB7C;
 Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EfU0KCsncQUw; Fri,  2 Apr 2021 17:18:19 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9978B8BB79;
 Fri,  2 Apr 2021 17:18:18 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3721D67989; Fri,  2 Apr 2021 15:18:18 +0000 (UTC)
Message-Id: <37fc5bd333125270f7032b8f9be225297e6dbe4f.1617375802.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617375802.git.christophe.leroy@csgroup.eu>
References: <cover.1617375802.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 16/20] sparc: Convert to GENERIC_CMDLINE
To: will@kernel.org, danielwa@cisco.com, robh@kernel.org,
 daniel@gimpelevich.san-francisco.ca.us, arnd@kernel.org,
 akpm@linux-foundation.org
Date: Fri,  2 Apr 2021 15:18:18 +0000 (UTC)
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
 arch/sparc/Kconfig           | 18 +-----------------
 arch/sparc/prom/bootstr_64.c |  2 +-
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 164a5254c91c..2a197f3a2549 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -50,6 +50,7 @@ config SPARC
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select SET_FS
+	select GENERIC_CMDLINE if SPARC64
 
 config SPARC32
 	def_bool !64BIT
@@ -313,23 +314,6 @@ config SCHED_MC
 	  making when dealing with multi-core CPU chips at a cost of slightly
 	  increased overhead in some places. If unsure say N here.
 
-config CMDLINE_BOOL
-	bool "Default bootloader kernel arguments"
-	depends on SPARC64
-
-config CMDLINE
-	string "Initial kernel command string"
-	depends on CMDLINE_BOOL
-	default "console=ttyS0,9600 root=/dev/sda1"
-	help
-	  Say Y here if you want to be able to pass default arguments to
-	  the kernel. This will be overridden by the bootloader, if you
-	  use one (such as SILO). This is most useful if you want to boot
-	  a kernel from TFTP, and want default options to be available
-	  with having them passed on the command line.
-
-	  NOTE: This option WILL override the PROM bootargs setting!
-
 config SUN_PM
 	bool
 	default y if SPARC32
diff --git a/arch/sparc/prom/bootstr_64.c b/arch/sparc/prom/bootstr_64.c
index f1cc34d99eec..4853a45b3de9 100644
--- a/arch/sparc/prom/bootstr_64.c
+++ b/arch/sparc/prom/bootstr_64.c
@@ -25,7 +25,7 @@ struct {
 	char bootstr_buf[BARG_LEN];
 } bootstr_info = {
 	.bootstr_len = BARG_LEN,
-#ifdef CONFIG_CMDLINE
+#if CONFIG_CMDLINE != ""
 	.bootstr_valid = 1,
 	.bootstr_buf = CONFIG_CMDLINE,
 #endif
-- 
2.25.0

