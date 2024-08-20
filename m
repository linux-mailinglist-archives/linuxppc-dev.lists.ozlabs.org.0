Return-Path: <linuxppc-dev+bounces-247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CC4958D48
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 19:26:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpGZH3KGMz2yN8;
	Wed, 21 Aug 2024 03:25:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGZH1CCTz2yPG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:25:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpGYP66jQz9sSL;
	Tue, 20 Aug 2024 19:24:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id plRWXHyXwK1C; Tue, 20 Aug 2024 19:24:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpGYC0bkPz9sSf;
	Tue, 20 Aug 2024 19:24:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 01EDA8B763;
	Tue, 20 Aug 2024 19:24:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mYYR_-AlqojN; Tue, 20 Aug 2024 19:24:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C7BB8B779;
	Tue, 20 Aug 2024 19:24:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/14] powerpc/603: Inconditionally use task PGDIR in DTLB misses
Date: Tue, 20 Aug 2024 19:23:58 +0200
Message-ID: <a2ba8eeb1c845eeb9e46b6fe3a5e9f841df9a033.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724173828.git.christophe.leroy@csgroup.eu>
References: <cover.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724174649; l=5785; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=QY0mM6rxGSovMexefAKs3hWoj6TF1MIze1nIqjlXY9g=; b=PSLuZDhtwZluoDKVhlUyhtmQ9FSvm0HFQUpAZHpO0iRhmmXMxlZRt8gs9TVmS9bstnKh9U+RW zCkpBAT9NsPCUf0AWIfC/TQpqMfuJpxbFUjWoSe4wknmDJDEmvMNv63
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

At the time being, DATA TLB miss handlers use task PGDIR for user
addresses and swapper_pg_dir for kernel addresses.

Now that kernel part of swapper_pg_dir is copied into task PGDIR
at PGD allocation, it is possible to avoid the above logic and
always use task PGDIR.

But new kernel PGD entries can still be created after init, in
which case those PGD entries may miss in task PGDIR. This can be
handled in DATA TLB error handler.

However, it needs to be done in real mode because the missing
entry might be related to the stack.

So implement copy of missing PGD entry in DATA TLB miss handler
just after detection of invalid PGD entry.

Also replace comparison by same calculation as in previous patch
to know if an address belongs to a kernel or user segment.

Note that as mentioned in platforms/Kconfig.cputype, SMP is not
supported on 603 processors so there is no risk of the PGD entry
be populated during the fault.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 65 ++++++++++++++++------------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 156304c00ece..cb2bca76be53 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -469,27 +469,22 @@ InstructionAddressInvalid:
 DataLoadTLBMiss:
 	/* Get PTE (linux-style) and check access */
 	mfspr	r0,SPRN_DMISS
-	lis	r1, TASK_SIZE@h		/* check if kernel address */
-	cmplw	0,r1,r0
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ
-	rlwinm	r2, r2, 28, 0xfffff000
-	li	r3, 3
-	bgt-	112f
-	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-	li	r3, 0
-	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
-112:	rlwimi	r2,r0,12,20,29		/* insert top 10 bits of address */
-	lwz	r2,0(r2)		/* get pmd entry */
+	rlwinm	r1, r2, 28, 0xfffff000
+	rlwimi	r1,r0,12,20,29		/* insert top 10 bits of address */
+	lwz	r2,0(r1)		/* get pmd entry */
+	rlwinm	r3, r0, 4, 0xf
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
-	beq-	DataAddressInvalid	/* return if no mapping */
-	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
+	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	beq-	2f			/* bail if no mapping */
+1:	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
 	lwz	r2,0(r2)		/* get linux-style pte */
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ
 	andc.	r1,r1,r2		/* check access & ~permission */
 	bne-	DataAddressInvalid	/* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
 	rlwinm	r1,r2,32-9,30,30	/* _PAGE_WRITE -> PP msb */
-	rlwimi	r2,r3,0,30,31		/* userspace ? -> PP */
+	rlwimi	r2,r3,2,30,31		/* userspace ? -> PP */
 	rlwimi	r1,r2,32-3,24,24	/* _PAGE_WRITE -> _PAGE_DIRTY */
 	xori	r1,r1,_PAGE_DIRTY	/* clear dirty when not rw */
 	ori	r1,r1,0xe04		/* clear out reserved bits */
@@ -518,6 +513,16 @@ MMU_FTR_SECTION_ELSE
 	tlbld	r0
 	rfi
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
+
+2:	lis     r2, (swapper_pg_dir - PAGE_OFFSET)@ha
+	addi    r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l        /* kernel page table */
+	rlwimi	r2,r0,12,20,29		/* insert top 10 bits of address */
+	lwz	r2,0(r2)		/* get pmd entry */
+	cmpwi	cr0,r2,0
+	beq-	DataAddressInvalid	/* return if no mapping */
+	stw	r2,0(r1)
+	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
+	b	1b
 DataAddressInvalid:
 	mfspr	r3,SPRN_SRR1
 	rlwinm	r1,r3,9,6,6	/* Get load/store bit */
@@ -543,26 +548,22 @@ DataAddressInvalid:
 DataStoreTLBMiss:
 	/* Get PTE (linux-style) and check access */
 	mfspr	r0,SPRN_DMISS
-	lis	r1, TASK_SIZE@h		/* check if kernel address */
-	cmplw	0,r1,r0
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
-	rlwinm	r2, r2, 28, 0xfffff000
-	li	r3, 3
-	bgt-	112f
-	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-	li	r3, 0
-	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
-112:	rlwimi	r2,r0,12,20,29		/* insert top 10 bits of address */
-	lwz	r2,0(r2)		/* get pmd entry */
+	rlwinm	r1, r2, 28, 0xfffff000
+	rlwimi	r1,r0,12,20,29		/* insert top 10 bits of address */
+	lwz	r2,0(r1)		/* get pmd entry */
+	rlwinm	r3, r0, 4, 0xf
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
-	beq-	DataAddressInvalid	/* return if no mapping */
+	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
+	beq-	2f			/* bail if no mapping */
+1:
 	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
 	lwz	r2,0(r2)		/* get linux-style pte */
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
 	andc.	r1,r1,r2		/* check access & ~permission */
 	bne-	DataAddressInvalid	/* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwimi	r2,r3,0,31,31		/* userspace ? -> PP lsb */
+	rlwimi	r2,r3,1,31,31		/* userspace ? -> PP lsb */
 	li	r1,0xe06		/* clear out reserved bits & PP msb */
 	andc	r1,r2,r1		/* PP = user? 1: 0 */
 BEGIN_FTR_SECTION
@@ -592,6 +593,16 @@ MMU_FTR_SECTION_ELSE
 	rfi
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
 
+2:	lis     r2, (swapper_pg_dir - PAGE_OFFSET)@ha
+	addi    r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l        /* kernel page table */
+	rlwimi	r2,r0,12,20,29		/* insert top 10 bits of address */
+	lwz	r2,0(r2)		/* get pmd entry */
+	cmpwi	cr0,r2,0
+	beq-	DataAddressInvalid	/* return if no mapping */
+	stw	r2,0(r1)
+	rlwinm	r2,r2,0,0,19		/* extract address of pte page */
+	b	1b
+
 #ifndef CONFIG_ALTIVEC
 #define altivec_assist_exception	unknown_exception
 #endif
-- 
2.44.0


