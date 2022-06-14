Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C354AE64
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 12:33:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMlCb234xz3cgS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 20:33:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMlBj6sVRz3c8S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 20:33:01 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LMlBX5CSlz9tNR;
	Tue, 14 Jun 2022 12:32:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QqG8AjRLTeg; Tue, 14 Jun 2022 12:32:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LMlBW04L7z9tNZ;
	Tue, 14 Jun 2022 12:32:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E17878B773;
	Tue, 14 Jun 2022 12:32:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2_Cop6hKjodS; Tue, 14 Jun 2022 12:32:50 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.246])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B74A8B76E;
	Tue, 14 Jun 2022 12:32:50 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25EAWaXB197837
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jun 2022 12:32:36 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25EAWamx197836;
	Tue, 14 Jun 2022 12:32:36 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] powerpc/32: Remove __map_without_ltlbs
Date: Tue, 14 Jun 2022 12:32:25 +0200
Message-Id: <3422094db965d218c4c3d8580f526963a9ac897f.1655202721.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <6977314c823cfb728bc0273cea634b41807bfb64.1655202721.git.christophe.leroy@csgroup.eu>
References: <6977314c823cfb728bc0273cea634b41807bfb64.1655202721.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1655202743; l=2348; s=20211009; h=from:subject:message-id; bh=79aJZFlau9V4EX0MkIvwL5a3GNFn5ZsgXUv/EMZRsRE=; b=ob065Ze7/f/8PW70jrpOG4YYD6+I92fxhm1vPQvpXLAY94M5AhPO4Ew8Tf9+4osxt6mL8m5+7yHG 7UC3UlHnCnlrvLLqpo8l7uKjNkzgpur+tQdd3e55WKB319IZhUA4
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__map_without_ltlbs is used only for 40x, and only when
STRICT_KERNEL_RWX, KFENCE or DEBUG_PAGEALLOC is active.

Do the verification directly in 40x version of mmu_mapin_ram()
and remove __map_without_ltlbs from core ppc32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/init_32.c    | 23 -----------------------
 arch/powerpc/mm/nohash/40x.c |  9 +++++++--
 2 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index 6f2e6210c273..62d9af6606cd 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -69,29 +69,9 @@ EXPORT_SYMBOL(agp_special_page);
 
 void MMU_init(void);
 
-int __map_without_ltlbs;
-
 /* max amount of low RAM to map in */
 unsigned long __max_low_memory = MAX_LOW_MEM;
 
-/*
- * Check for command-line options that affect what MMU_init will do.
- */
-static void __init MMU_setup(void)
-{
-	if (IS_ENABLED(CONFIG_PPC_8xx))
-		return;
-
-	if (IS_ENABLED(CONFIG_KFENCE))
-		__map_without_ltlbs = 1;
-
-	if (debug_pagealloc_enabled())
-		__map_without_ltlbs = 1;
-
-	if (strict_kernel_rwx_enabled())
-		__map_without_ltlbs = 1;
-}
-
 /*
  * MMU_init sets up the basic memory mappings for the kernel,
  * including both RAM and possibly some I/O regions,
@@ -102,9 +82,6 @@ void __init MMU_init(void)
 	if (ppc_md.progress)
 		ppc_md.progress("MMU:enter", 0x111);
 
-	/* parse args from command line */
-	MMU_setup();
-
 	/*
 	 * Reserve gigantic pages for hugetlb.  This MUST occur before
 	 * lowmem_end_addr is initialized below.
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
index b32e465a3d52..3684d6e570fb 100644
--- a/arch/powerpc/mm/nohash/40x.c
+++ b/arch/powerpc/mm/nohash/40x.c
@@ -43,7 +43,6 @@
 
 #include <mm/mmu_decl.h>
 
-extern int __map_without_ltlbs;
 /*
  * MMU_init_hw does the chip-specific initialization of the MMU hardware.
  */
@@ -94,7 +93,13 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	p = 0;
 	s = total_lowmem;
 
-	if (__map_without_ltlbs)
+	if (IS_ENABLED(CONFIG_KFENCE))
+		return 0;
+
+	if (debug_pagealloc_enabled())
+		return 0;
+
+	if (strict_kernel_rwx_enabled())
 		return 0;
 
 	while (s >= LARGE_PAGE_SIZE_16M) {
-- 
2.36.1

