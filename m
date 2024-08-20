Return-Path: <linuxppc-dev+bounces-246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE881958D46
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 19:26:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpGZC2nHPz2yNn;
	Wed, 21 Aug 2024 03:25:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGZC0kLNz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:25:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpGYN5S0mz9sSS;
	Tue, 20 Aug 2024 19:24:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4KsTrCJD-BLg; Tue, 20 Aug 2024 19:24:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpGYB4ZLSz9sSL;
	Tue, 20 Aug 2024 19:24:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 88E0A8B778;
	Tue, 20 Aug 2024 19:24:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4YCMkP3Q_kQL; Tue, 20 Aug 2024 19:24:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2B1D98B763;
	Tue, 20 Aug 2024 19:24:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/14] powerpc/603: Inconditionally use task PGDIR in ITLB misses
Date: Tue, 20 Aug 2024 19:23:57 +0200
Message-ID: <9a3242162ad2faab8019c698e501b326a126ee9e.1724173828.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724174649; l=2327; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=0gQfvAhs5YFK//CvvzjVtowt/pD4X2KbHREPhUMNy2M=; b=kobjcUi1Wo1HmZJYLzLO19ouawHQ6QEEkhu+YYJANwOnZOAlupLqequTxqJyI25mwXhkjNG3G v6ayDAWuBvZBDgdCWl7uR31OH6y7lpm338emnoIKOMY13kdyUsmCxko
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Now that modules exec page tables are preallocated, the instruction
TLBmiss handler can use task PGDIR inconditionally.

Also revise the identification of user vs kernel user space by doing
a calculation instead of a comparison: Get the segment number and
subtract the number of the first kernel segment. The result is
positive for kernel addresses and negative for user addresses,
which means that upper 2 bits are 0 for kernel and 3 for user.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 7995506e7fbd..156304c00ece 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -413,22 +413,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_FPU_UNAVAILABLE)
 InstructionTLBMiss:
 	/* Get PTE (linux-style) and check access */
 	mfspr	r0,SPRN_IMISS
-#ifdef CONFIG_EXECMEM
-	lis	r1, TASK_SIZE@h		/* check if kernel address */
-	cmplw	0,r1,r0
-#endif
 	mfspr	r2, SPRN_SDR1
 	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 	rlwinm	r2, r2, 28, 0xfffff000
+	rlwimi	r2,r0,12,20,29		/* insert top 10 bits of address */
+	lwz	r2,0(r2)		/* get pmd entry */
 #ifdef CONFIG_EXECMEM
-	li	r3, 3
-	bgt-	112f
-	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
-	li	r3, 0
-	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
+	rlwinm	r3, r0, 4, 0xf
+	subi	r3, r3, (TASK_SIZE >> 28) & 0xf
 #endif
-112:	rlwimi	r2,r0,12,20,29		/* insert top 10 bits of address */
-	lwz	r2,0(r2)		/* get pmd entry */
 	rlwinm.	r2,r2,0,0,19		/* extract address of pte page */
 	beq-	InstructionAddressInvalid	/* return if no mapping */
 	rlwimi	r2,r0,22,20,29		/* insert next 10 bits of address */
@@ -437,7 +430,7 @@ InstructionTLBMiss:
 	bne-	InstructionAddressInvalid /* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
 #ifdef CONFIG_EXECMEM
-	rlwimi	r2, r3, 0, 31, 31	/* userspace ? -> PP lsb */
+	rlwimi	r2, r3, 1, 31, 31	/* userspace ? -> PP lsb */
 #endif
 	ori	r1, r1, 0xe06		/* clear out reserved bits */
 	andc	r1, r2, r1		/* PP = user? 1 : 0 */
-- 
2.44.0


