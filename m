Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3420CE36
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 13:27:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wQFK3LXjzDqGm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jun 2020 21:27:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wPzl6mc3zDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 21:15:31 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49wPzW0x6Rz9tyrM;
 Mon, 29 Jun 2020 13:15:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cKlGC0OSkxdq; Mon, 29 Jun 2020 13:15:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49wPzV70Lcz9tyqw;
 Mon, 29 Jun 2020 13:15:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 42A3D8B7A0;
 Mon, 29 Jun 2020 13:15:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xebvCT7XwNct; Mon, 29 Jun 2020 13:15:25 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 00C338B799;
 Mon, 29 Jun 2020 13:15:24 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0000565B29; Mon, 29 Jun 2020 11:15:24 +0000 (UTC)
Message-Id: <893425e32cd0a003539573b2d115e0ffa98bc26c.1593428200.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1593428200.git.christophe.leroy@csgroup.eu>
References: <cover.1593428200.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 5/6] powerpc/32s: Kernel space starts at TASK_SIZE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 29 Jun 2020 11:15:24 +0000 (UTC)
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

Kernel space starts at TASK_SIZE. Select kernel page table
when address is over TASK_SIZE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_32.S       | 12 ++++++------
 arch/powerpc/mm/book3s32/hash_low.S |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 705c042309d8..bbef6ce8322b 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -474,7 +474,7 @@ InstructionTLBMiss:
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_IMISS
 #if defined(CONFIG_MODULES) || defined(CONFIG_DEBUG_PAGEALLOC)
-	lis	r1,PAGE_OFFSET@h		/* check if kernel address */
+	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SPRG_PGDIR
@@ -484,7 +484,7 @@ InstructionTLBMiss:
 	li	r1,_PAGE_PRESENT | _PAGE_EXEC
 #endif
 #if defined(CONFIG_MODULES) || defined(CONFIG_DEBUG_PAGEALLOC)
-	bge-	112f
+	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 #endif
@@ -541,7 +541,7 @@ DataLoadTLBMiss:
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_DMISS
-	lis	r1,PAGE_OFFSET@h		/* check if kernel address */
+	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SPRG_PGDIR
 #ifdef CONFIG_SWAP
@@ -549,7 +549,7 @@ DataLoadTLBMiss:
 #else
 	li	r1, _PAGE_PRESENT
 #endif
-	bge-	112f
+	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
@@ -621,7 +621,7 @@ DataStoreTLBMiss:
  */
 	/* Get PTE (linux-style) and check access */
 	mfspr	r3,SPRN_DMISS
-	lis	r1,PAGE_OFFSET@h		/* check if kernel address */
+	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SPRG_PGDIR
 #ifdef CONFIG_SWAP
@@ -629,7 +629,7 @@ DataStoreTLBMiss:
 #else
 	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT
 #endif
-	bge-	112f
+	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 923ad8f374eb..1690d369688b 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -62,7 +62,7 @@ _GLOBAL(hash_page)
 	isync
 #endif
 	/* Get PTE (linux-style) and check access */
-	lis	r0,KERNELBASE@h		/* check if kernel address */
+	lis	r0, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r4,r0
 	ori	r3,r3,_PAGE_USER|_PAGE_PRESENT /* test low addresses as user */
 	mfspr	r5, SPRN_SPRG_PGDIR	/* phys page-table root */
-- 
2.25.0

