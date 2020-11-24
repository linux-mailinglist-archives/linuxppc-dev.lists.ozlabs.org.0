Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F28A2C318E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 21:00:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgZd43qDgzDqLy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 07:00:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgZRR0cHgzDqKj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 06:52:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgZRJ2lK7z9v0DN;
 Tue, 24 Nov 2020 20:51:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0zthhqvlE51a; Tue, 24 Nov 2020 20:51:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgZRH63W5z9v0DM;
 Tue, 24 Nov 2020 20:51:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B32088B7B7;
 Tue, 24 Nov 2020 20:51:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QBHhHxe0qopc; Tue, 24 Nov 2020 20:51:55 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7395C8B7AF;
 Tue, 24 Nov 2020 20:51:55 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4AFB66688D; Tue, 24 Nov 2020 19:51:55 +0000 (UTC)
Message-Id: <6470ab99e58c84a5445af43ce4d1d772b0dc3e93.1606247495.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 1/3] powerpc/32s: Remove unused counters incremented by
 create_hpte()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 24 Nov 2020 19:51:55 +0000 (UTC)
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

primary_pteg_full and htab_hash_searches are not used.

Remove them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/book3s32/hash_low.S | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 9a56ba4f68f2..f964fd34dad9 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -359,11 +359,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	beq+	10f			/* no PTE: go look for an empty slot */
 	tlbie	r4
 
-	lis	r4, (htab_hash_searches - PAGE_OFFSET)@ha
-	lwz	r6, (htab_hash_searches - PAGE_OFFSET)@l(r4)
-	addi	r6,r6,1			/* count how many searches we do */
-	stw	r6, (htab_hash_searches - PAGE_OFFSET)@l(r4)
-
 	/* Search the primary PTEG for a PTE whose 1st (d)word matches r5 */
 	mtctr	r0
 	addi	r4,r3,-HPTE_SIZE
@@ -393,12 +388,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 	bdnzf	2,1b			/* loop while ctr != 0 && !cr0.eq */
 	beq+	.Lfound_empty
 
-	/* update counter of times that the primary PTEG is full */
-	lis	r4, (primary_pteg_full - PAGE_OFFSET)@ha
-	lwz	r6, (primary_pteg_full - PAGE_OFFSET)@l(r4)
-	addi	r6,r6,1
-	stw	r6, (primary_pteg_full - PAGE_OFFSET)@l(r4)
-
 	patch_site	0f, patch__hash_page_C
 	/* Search the secondary PTEG for an empty slot */
 	ori	r5,r5,PTE_H		/* set H (secondary hash) bit */
@@ -491,10 +480,6 @@ _ASM_NOKPROBE_SYMBOL(create_hpte)
 	.align	2
 next_slot:
 	.space	4
-primary_pteg_full:
-	.space	4
-htab_hash_searches:
-	.space	4
 	.previous
 
 /*
-- 
2.25.0

