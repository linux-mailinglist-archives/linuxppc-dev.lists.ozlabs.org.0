Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23F30A1F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 07:31:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTdQG3g1gzDr1f
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 17:31:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTdNB385nzDr10
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 17:29:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DTdMs6KSQz9ty3Z;
 Mon,  1 Feb 2021 07:29:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dm3KCNoZYkNq; Mon,  1 Feb 2021 07:29:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DTdMs5CGVz9ty3Y;
 Mon,  1 Feb 2021 07:29:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F18F8B777;
 Mon,  1 Feb 2021 07:29:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id INx2U6gSzvaF; Mon,  1 Feb 2021 07:29:50 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 31B3E8B766;
 Mon,  1 Feb 2021 07:29:50 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 170A766B27; Mon,  1 Feb 2021 06:29:50 +0000 (UTC)
Message-Id: <4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/603: Fix protection of user pages mapped with
 PROT_NONE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Plattner <christoph.plattner@thalesgroup.com>
Date: Mon,  1 Feb 2021 06:29:50 +0000 (UTC)
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

On book3s/32, page protection is defined by the PP bits in the PTE
which provide the following protection depending on the access
keys defined in the matching segment register:
- PP 00 means RW with key 0 and N/A with key 1.
- PP 01 means RW with key 0 and RO with key 1.
- PP 10 means RW with both key 0 and key 1.
- PP 11 means RO with both key 0 and key 1.

Since the implementation of kernel userspace access protection,
PP bits have been set as follows:
- PP00 for pages without _PAGE_USER
- PP01 for pages with _PAGE_USER and _PAGE_RW
- PP11 for pages with _PAGE_USER and without _PAGE_RW

For kernelspace segments, kernel accesses are performed with key 0
and user accesses are performed with key 1. As PP00 is used for
non _PAGE_USER pages, user can't access kernel pages not flagged
_PAGE_USER while kernel can.

For userspace segments, both kernel and user accesses are performed
with key 0, therefore pages not flagged _PAGE_USER are still
accessible to the user.

This shouldn't be an issue, because userspace is expected to be
accessible to the user. But unlike most other architectures, powerpc
implements PROT_NONE protection by removing _PAGE_USER flag instead of
flagging the page as not valid. This means that pages in userspace
that are not flagged _PAGE_USER shall remain inaccessible.

To get the expected behaviour, just mimic other architectures in the
TLB miss handler by checking _PAGE_USER permission on userspace
accesses as if it was the _PAGE_PRESENT bit.

Note that this problem only is only for 603 cores. The 604+ have
an hash table, and hash_page() function already implement the
verification of _PAGE_USER permission on userspace pages.

Reported-by: Christoph Plattner <christoph.plattner@thalesgroup.com>
Fixes: f342adca3afc ("powerpc/32s: Prepare Kernel Userspace Access Protection")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 858fbc8b19f3..0004e8a6a58e 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -453,11 +453,12 @@ InstructionTLBMiss:
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SDR1
-	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
+	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC | _PAGE_USER
 	rlwinm	r2, r2, 28, 0xfffff000
 #ifdef CONFIG_MODULES
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 #endif
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
@@ -516,10 +517,11 @@ DataLoadTLBMiss:
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER
 	rlwinm	r2, r2, 28, 0xfffff000
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
@@ -593,10 +595,11 @@ DataStoreTLBMiss:
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SDR1
-	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER
 	rlwinm	r2, r2, 28, 0xfffff000
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
-- 
2.25.0

