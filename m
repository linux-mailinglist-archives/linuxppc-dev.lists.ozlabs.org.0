Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA45B5A7A47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 11:33:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHfBT52C4z3cDs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 19:33:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHf9D74Vrz3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 19:32:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MHf8x2lfVz9sVQ;
	Wed, 31 Aug 2022 11:32:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a-n1N6O5ZN4k; Wed, 31 Aug 2022 11:32:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MHf8w1TxGz9sf4;
	Wed, 31 Aug 2022 11:32:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 23CBB8B77A;
	Wed, 31 Aug 2022 11:32:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id QV0Zrev9zaSn; Wed, 31 Aug 2022 11:32:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 04C8C8B766;
	Wed, 31 Aug 2022 11:32:32 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 27V9WSBY1567859
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Aug 2022 11:32:28 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 27V9WRtb1567828;
	Wed, 31 Aug 2022 11:32:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 3/3] powerpc/32: Remove wii_memory_fixups()
Date: Wed, 31 Aug 2022 11:32:09 +0200
Message-Id: <5f2091f86528b59ef92ef1daed5d3dd8c0d7bebd.1661938317.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <959d77be630b9b46a7458f0fbd41dc3a94ec811a.1661938317.git.christophe.leroy@csgroup.eu>
References: <959d77be630b9b46a7458f0fbd41dc3a94ec811a.1661938317.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1661938326; l=1978; s=20211009; h=from:subject:message-id; bh=ZS2ts3r/FWR4lJ5dMmgFvcH2uwiPJ5VLgro8FN39SEA=; b=D/faDj1PzXiQq3BtXU7rUCwwtG6EVZENk9NMUQkTIz0ln0tZgqHzQ9BP1HdkfHfDZenWNAO4UNkL qgmVgjMyAIu4JBA11wbeLFdcX/CEILhBk/xwLeRyCJTUIUsQWo4p
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

wii_memory_fixups() is not called anymore, remove it.

Also remove left-overs in mmu_decl.h which were forgotten by
commit 160985f3025b ("powerpc/wii: remove wii_mmu_mapin_mem2()")

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/mmu_decl.h               |  8 --------
 arch/powerpc/platforms/embedded6xx/wii.c | 15 ---------------
 2 files changed, 23 deletions(-)

diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 6dd4744cc56a..0e3528aec49e 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -102,14 +102,6 @@ extern phys_addr_t total_lowmem;
 extern phys_addr_t memstart_addr;
 extern phys_addr_t lowmem_end_addr;
 
-#ifdef CONFIG_WII
-extern unsigned long wii_hole_start;
-extern unsigned long wii_hole_size;
-
-extern unsigned long wii_mmu_mapin_mem2(unsigned long top);
-extern void wii_memory_fixups(void);
-#endif
-
 /* ...and now those things that may be slightly different between processor
  * architectures.  -- Dan
  */
diff --git a/arch/powerpc/platforms/embedded6xx/wii.c b/arch/powerpc/platforms/embedded6xx/wii.c
index 9e03ff8f631c..f4e654a9d4ff 100644
--- a/arch/powerpc/platforms/embedded6xx/wii.c
+++ b/arch/powerpc/platforms/embedded6xx/wii.c
@@ -15,8 +15,6 @@
 #include <linux/seq_file.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
-#include <linux/memblock.h>
-#include <mm/mmu_decl.h>
 
 #include <asm/io.h>
 #include <asm/machdep.h>
@@ -49,19 +47,6 @@
 static void __iomem *hw_ctrl;
 static void __iomem *hw_gpio;
 
-static int __init page_aligned(unsigned long x)
-{
-	return !(x & (PAGE_SIZE-1));
-}
-
-void __init wii_memory_fixups(void)
-{
-	struct memblock_region *p = memblock.memory.regions;
-
-	BUG_ON(memblock.memory.cnt != 2);
-	BUG_ON(!page_aligned(p[0].base) || !page_aligned(p[1].base));
-}
-
 static void __noreturn wii_spin(void)
 {
 	local_irq_disable();
-- 
2.37.1

