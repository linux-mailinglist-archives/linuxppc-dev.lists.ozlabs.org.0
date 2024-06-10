Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CB5901ACB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 08:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VyLlN6zSkz78cY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2024 16:01:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VyLdj6bHzz3dK1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2024 15:56:09 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4VyLcb0cTVz9v6s;
	Mon, 10 Jun 2024 07:55:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IatcaPycSvwn; Mon, 10 Jun 2024 07:55:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4VyLcM0Xccz9v6y;
	Mon, 10 Jun 2024 07:54:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DFB58B76C;
	Mon, 10 Jun 2024 07:54:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 90IcYmTAACrX; Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE5038B76E;
	Mon, 10 Jun 2024 07:54:58 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Peter Xu <peterx@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v5 14/18] powerpc/e500: Free r10 for FIND_PTE
Date: Mon, 10 Jun 2024 07:54:59 +0200
Message-ID: <d82db15e15052aa696e5430b02bc2108febd08f6.1717955559.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1717955558.git.christophe.leroy@csgroup.eu>
References: <cover.1717955558.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717998887; l=4544; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=CGeNYqnnvnjPnGCbM1yMAoxPPNyoWmWcvtJY5TjAVy0=; b=s7I5Kfq9tOAr0tMpAuTkGwgZZLSIM1G9Y/ldC3ZFWbKbUT+5W9MHXPbhU2EjMjh151AUz0aRB szpZ9jLv+GtBqY08UHUfxcf1gGEACRcyZL3sSe03IZsBTHa3hrOro7d
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move r13 load after the call to FIND_PTE, and use r13 instead of
r10 for storing fault address. This will allow using r10 freely
in FIND_PTE in following patch to handle hugepage size.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New
---
 arch/powerpc/kernel/head_85xx.S | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index 282e49c51deb..226f88e77d6d 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -294,9 +294,10 @@ set_ivor:
 /* Macros to hide the PTE size differences
  *
  * FIND_PTE -- walks the page tables given EA & pgdir pointer
- *   r10 -- EA of fault
+ *   r10 -- free
  *   r11 -- PGDIR pointer
  *   r12 -- free
+ *   r13 -- EA of fault
  *   label 2: is the bailout case
  *
  * if we find the pte (fall through):
@@ -307,7 +308,7 @@ set_ivor:
 #ifdef CONFIG_PTE_64BIT
 #ifdef CONFIG_HUGETLB_PAGE
 #define FIND_PTE	\
-	rlwinm	r12, r10, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
+	rlwinm	r12, r13, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
 	add	r12, r11, r12;						\
 	lwz	r11, 4(r12);		/* Get pgd/pmd entry */		\
 	rlwinm.	r12, r11, 0, 0, 20;	/* Extract pt base address */	\
@@ -317,26 +318,26 @@ set_ivor:
 	andi.	r10, r11, HUGEPD_SHIFT_MASK@l; /* extract size field */	\
 	xor	r12, r10, r11;		/* drop size bits from pointer */ \
 	b	1001f;							\
-1000:	rlwimi	r12, r10, 23, 20, 28;	/* Compute pte address */	\
+1000:	rlwimi	r12, r13, 23, 20, 28;	/* Compute pte address */	\
 	li	r10, 0;			/* clear r10 */			\
 1001:	lwz	r11, 4(r12);		/* Get pte entry */
 #else
 #define FIND_PTE	\
-	rlwinm	r12, r10, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
+	rlwinm	r12, r13, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
 	add	r12, r11, r12;						\
 	lwz	r11, 4(r12);		/* Get pgd/pmd entry */		\
 	rlwinm.	r12, r11, 0, 0, 20;	/* Extract pt base address */	\
 	beq	2f;			/* Bail if no table */		\
-	rlwimi	r12, r10, 23, 20, 28;	/* Compute pte address */	\
+	rlwimi	r12, r13, 23, 20, 28;	/* Compute pte address */	\
 	lwz	r11, 4(r12);		/* Get pte entry */
 #endif /* HUGEPAGE */
 #else /* !PTE_64BIT */
 #define FIND_PTE	\
-	rlwimi	r11, r10, 12, 20, 29;	/* Create L1 (pgdir/pmd) address */	\
+	rlwimi	r11, r13, 12, 20, 29;	/* Create L1 (pgdir/pmd) address */	\
 	lwz	r11, 0(r11);		/* Get L1 entry */			\
 	rlwinm.	r12, r11, 0, 0, 19;	/* Extract L2 (pte) base address */	\
 	beq	2f;			/* Bail if no table */			\
-	rlwimi	r12, r10, 22, 20, 29;	/* Compute PTE address */		\
+	rlwimi	r12, r13, 22, 20, 29;	/* Compute PTE address */		\
 	lwz	r11, 0(r12);		/* Get Linux PTE */
 #endif
 
@@ -443,13 +444,13 @@ START_BTB_FLUSH_SECTION
 	BTB_FLUSH(r10)
 1:
 END_BTB_FLUSH_SECTION
-	mfspr	r10, SPRN_DEAR		/* Get faulting address */
+	mfspr	r13, SPRN_DEAR		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the
 	 * kernel page tables.
 	 */
 	lis	r11, PAGE_OFFSET@h
-	cmplw	5, r10, r11
+	cmplw	5, r13, r11
 	blt	5, 3f
 	lis	r11, swapper_pg_dir@h
 	ori	r11, r11, swapper_pg_dir@l
@@ -472,14 +473,14 @@ END_BTB_FLUSH_SECTION
 #endif
 
 4:
+	FIND_PTE
+
 #ifdef CONFIG_PTE_64BIT
 	li	r13,_PAGE_PRESENT|_PAGE_BAP_SR
 	oris	r13,r13,_PAGE_ACCESSED@h
 #else
 	li	r13,_PAGE_PRESENT|_PAGE_READ|_PAGE_ACCESSED
 #endif
-
-	FIND_PTE
 	andc.	r13,r13,r11		/* Check permission */
 
 #ifdef CONFIG_PTE_64BIT
@@ -536,13 +537,13 @@ START_BTB_FLUSH_SECTION
 1:
 END_BTB_FLUSH_SECTION
 
-	mfspr	r10, SPRN_SRR0		/* Get faulting address */
+	mfspr	r13, SPRN_SRR0		/* Get faulting address */
 
 	/* If we are faulting a kernel address, we have to use the
 	 * kernel page tables.
 	 */
 	lis	r11, PAGE_OFFSET@h
-	cmplw	5, r10, r11
+	cmplw	5, r13, r11
 	blt	5, 3f
 	lis	r11, swapper_pg_dir@h
 	ori	r11, r11, swapper_pg_dir@l
@@ -551,6 +552,7 @@ END_BTB_FLUSH_SECTION
 	rlwinm	r12,r12,0,16,1
 	mtspr	SPRN_MAS1,r12
 
+	FIND_PTE
 	/* Make up the required permissions for kernel code */
 #ifdef CONFIG_PTE_64BIT
 	li	r13,_PAGE_PRESENT | _PAGE_BAP_SX
@@ -571,6 +573,7 @@ END_BTB_FLUSH_SECTION
 	beq	2f			/* KUAP fault */
 #endif
 
+	FIND_PTE
 	/* Make up the required permissions for user code */
 #ifdef CONFIG_PTE_64BIT
 	li	r13,_PAGE_PRESENT | _PAGE_BAP_UX
@@ -580,7 +583,6 @@ END_BTB_FLUSH_SECTION
 #endif
 
 4:
-	FIND_PTE
 	andc.	r13,r13,r11		/* Check permission */
 
 #ifdef CONFIG_PTE_64BIT
-- 
2.44.0

