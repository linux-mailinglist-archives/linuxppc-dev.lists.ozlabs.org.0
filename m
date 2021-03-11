Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21468337C88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 19:25:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxHRt1Bjzz3dMV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 05:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxHR953Vgz3cKR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 05:24:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxHR12yR5z9v1Bt;
 Thu, 11 Mar 2021 19:24:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id goZu1LU10u-X; Thu, 11 Mar 2021 19:24:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxHR124RZz9v1Bs;
 Thu, 11 Mar 2021 19:24:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EAB168B80D;
 Thu, 11 Mar 2021 19:24:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oM5t9zfqagzP; Thu, 11 Mar 2021 19:24:30 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2AE38B80B;
 Thu, 11 Mar 2021 19:24:30 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3DF036758B; Thu, 11 Mar 2021 18:24:30 +0000 (UTC)
Message-Id: <656520fecf792b8842dc54beec2da3bc29d0133c.1615486986.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] [backport for 5.10] powerpc/603: Fix protection of user pages
 mapped with PROT_NONE
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Date: Thu, 11 Mar 2021 18:24:30 +0000 (UTC)
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

(cherry picked from commit c119565a15a628efdfa51352f9f6c5186e506a1c)

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

Fixes: f342adca3afc ("powerpc/32s: Prepare Kernel Userspace Access Protection")
Change-Id: I68bc5e5ff4542bdfcdcd12923fa96a5811707475
Cc: stable@vger.kernel.org # v5.2+
Reported-by: Christoph Plattner <christoph.plattner@thalesgroup.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/4a0c6e3bb8f0c162457bf54d9bc6fd8d7b55129f.1612160907.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/kernel/head_book3s_32.S | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 2729d8fa6e77..96b45901da64 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -461,10 +461,11 @@ InstructionTLBMiss:
 	cmplw	0,r1,r3
 #endif
 	mfspr	r2, SPRN_SPRG_PGDIR
-	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
+	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC | _PAGE_USER
 #if defined(CONFIG_MODULES) || defined(CONFIG_DEBUG_PAGEALLOC)
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 #endif
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
@@ -523,9 +524,10 @@ DataLoadTLBMiss:
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SPRG_PGDIR
-	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1, _PAGE_PRESENT | _PAGE_ACCESSED
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
@@ -599,9 +601,10 @@ DataStoreTLBMiss:
 	lis	r1, TASK_SIZE@h		/* check if kernel address */
 	cmplw	0,r1,r3
 	mfspr	r2, SPRN_SPRG_PGDIR
-	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER
 	bgt-	112f
 	lis	r2, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
+	li	r1, _PAGE_RW | _PAGE_DIRTY | _PAGE_PRESENT | _PAGE_ACCESSED
 	addi	r2, r2, (swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
 112:	rlwimi	r2,r3,12,20,29		/* insert top 10 bits of address */
 	lwz	r2,0(r2)		/* get pmd entry */
-- 
2.25.0

