Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 865CB2C39BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:12:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgsY04WzlzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:12:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgsVj44rCzDqg3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 18:10:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgsVY5L4Kz9tyTR;
 Wed, 25 Nov 2020 08:10:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2D5r1qhoXvQi; Wed, 25 Nov 2020 08:10:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgsVY4SmQz9tyTJ;
 Wed, 25 Nov 2020 08:10:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82EB18B7C2;
 Wed, 25 Nov 2020 08:10:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Mxo7yPnDQRmT; Wed, 25 Nov 2020 08:10:46 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 374D08B7B7;
 Wed, 25 Nov 2020 08:10:46 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 0AAD1668BA; Wed, 25 Nov 2020 07:10:46 +0000 (UTC)
Message-Id: <da51f7ec632825a4ce43290a904aad61648408c0.1606285013.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 1/8] powerpc/32s: Always map kernel text and rodata with
 BATs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 25 Nov 2020 07:10:46 +0000 (UTC)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 2b279c0348af ("powerpc/32s: Allow mapping with BATs with
DEBUG_PAGEALLOC"), there is no real situation where mapping without
BATs is required.

In order to simplify memory handling, always map kernel text
and rodata with BATs even when "nobats" kernel parameter is set.

Also fix the 603 TLB miss exceptions that don't require anymore
kernel page table if DEBUG_PAGEALLOC.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 4 ++--
 arch/powerpc/mm/book3s32/mmu.c       | 8 +++-----
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index a0dda2a1f2df..27767f3e7ec1 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -453,13 +453,13 @@ InstructionTLBMiss:
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_IMISS
-#if defined(CONFIG_MODULES) || defined(CONFIG_DEBUG_PAGEALLOC)
+#ifdef CONFIG_MODULES
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SPRG_PGDIR
 	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
-#if defined(CONFIG_MODULES) || defined(CONFIG_DEBUG_PAGEALLOC)
+#ifdef CONFIG_MODULES
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index a59e7ec98180..5c60dcade90a 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -157,11 +157,9 @@ unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
 	unsigned long done;
 	unsigned long border = (unsigned long)__init_begin - PAGE_OFFSET;
 
-	if (__map_without_bats) {
-		pr_debug("RAM mapped without BATs\n");
-		return base;
-	}
-	if (debug_pagealloc_enabled()) {
+
+	if (debug_pagealloc_enabled() || __map_without_bats) {
+		pr_debug_once("Read-Write memory mapped without BATs\n");
 		if (base >= border)
 			return base;
 		if (top >= border)
-- 
2.25.0

