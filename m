Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F31A2C3192
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:02:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZgw0jcKzDqYJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 07:02:52 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZRR0c7rzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 06:52:01 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgZRL03Z3z9v0DR;
 Tue, 24 Nov 2020 20:51:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id H_VMhRiRcdnR; Tue, 24 Nov 2020 20:51:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgZRK5mC1z9v0DM;
 Tue, 24 Nov 2020 20:51:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE2518B7B7;
 Tue, 24 Nov 2020 20:51:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PjDsj-tZCLnK; Tue, 24 Nov 2020 20:51:57 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EEB58B7AF;
 Tue, 24 Nov 2020 20:51:57 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 566DA6688D; Tue, 24 Nov 2020 19:51:57 +0000 (UTC)
Message-Id: <f5bc21db7a33dab55924734e6060c2e9daed562e.1606247495.git.christophe.leroy@csgroup.eu>
In-Reply-To: <6470ab99e58c84a5445af43ce4d1d772b0dc3e93.1606247495.git.christophe.leroy@csgroup.eu>
References: <6470ab99e58c84a5445af43ce4d1d772b0dc3e93.1606247495.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/3] powerpc/32s: Cleanup around PTE_FLAGS_OFFSET in
 hash_low.S
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 24 Nov 2020 19:51:57 +0000 (UTC)
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

PTE_FLAGS_OFFSET is defined in asm/page_32.h and used only
in hash_low.S

And PTE_FLAGS_OFFSET nullity depends on CONFIG_PTE_64BIT

Instead of tests like #if (PTE_FLAGS_OFFSET != 0), use
CONFIG_PTE_64BIT related code.

Also move the definition of PTE_FLAGS_OFFSET into hash_low.S
directly, that improves readability.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/page_32.h  |  6 ------
 arch/powerpc/mm/book3s32/hash_low.S | 23 +++++++++++++----------
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/page_32.h b/arch/powerpc/include/asm/page_32.h
index d64dfe3ac712..56f217606327 100644
--- a/arch/powerpc/include/asm/page_32.h
+++ b/arch/powerpc/include/asm/page_32.h
@@ -16,12 +16,6 @@
 #define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
 #endif
 
-#ifdef CONFIG_PTE_64BIT
-#define PTE_FLAGS_OFFSET	4	/* offset of PTE flags, in bytes */
-#else
-#define PTE_FLAGS_OFFSET	0
-#endif
-
 #if defined(CONFIG_PPC_256K_PAGES) || \
     (defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES))
 #define PTE_SHIFT	(PAGE_SHIFT - PTE_T_LOG2 - 2)	/* 1/4 of a page */
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 1366e8e4fc05..f559a931b9a8 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -26,6 +26,12 @@
 #include <asm/feature-fixups.h>
 #include <asm/code-patching-asm.h>
 
+#ifdef CONFIG_PTE_64BIT
+#define PTE_FLAGS_OFFSET	4	/* offset of PTE flags, in bytes */
+#else
+#define PTE_FLAGS_OFFSET	0
+#endif
+
 #ifdef CONFIG_SMP
 	.section .bss
 	.align	2
@@ -94,6 +100,11 @@ _GLOBAL(hash_page)
 	rlwimi	r8,r4,22,20,29		/* insert next 10 bits of address */
 #else
 	rlwimi	r8,r4,23,20,28		/* compute pte address */
+	/*
+	 * If PTE_64BIT is set, the low word is the flags word; use that
+	 * word for locking since it contains all the interesting bits.
+	 */
+	addi	r8,r8,PTE_FLAGS_OFFSET
 #endif
 
 	/*
@@ -101,13 +112,7 @@ _GLOBAL(hash_page)
 	 * because almost always, there won't be a permission violation
 	 * and there won't already be an HPTE, and thus we will have
 	 * to update the PTE to set _PAGE_HASHPTE.  -- paulus.
-	 *
-	 * If PTE_64BIT is set, the low word is the flags word; use that
-	 * word for locking since it contains all the interesting bits.
 	 */
-#if (PTE_FLAGS_OFFSET != 0)
-	addi	r8,r8,PTE_FLAGS_OFFSET
-#endif
 .Lretry:
 	lwarx	r6,0,r8			/* get linux-style pte, flag word */
 #ifdef CONFIG_PPC_KUAP
@@ -511,8 +516,9 @@ _GLOBAL(flush_hash_pages)
 	rlwimi	r5,r4,22,20,29
 #else
 	rlwimi	r5,r4,23,20,28
+	addi	r5,r5,PTE_FLAGS_OFFSET
 #endif
-1:	lwz	r0,PTE_FLAGS_OFFSET(r5)
+1:	lwz	r0,0(r5)
 	cmpwi	cr1,r6,1
 	andi.	r0,r0,_PAGE_HASHPTE
 	bne	2f
@@ -556,9 +562,6 @@ _GLOBAL(flush_hash_pages)
 	 * already clear, we're done (for this pte).  If not,
 	 * clear it (atomically) and proceed.  -- paulus.
 	 */
-#if (PTE_FLAGS_OFFSET != 0)
-	addi	r5,r5,PTE_FLAGS_OFFSET
-#endif
 33:	lwarx	r8,0,r5			/* fetch the pte flags word */
 	andi.	r0,r8,_PAGE_HASHPTE
 	beq	8f			/* done if HASHPTE is already clear */
-- 
2.25.0

