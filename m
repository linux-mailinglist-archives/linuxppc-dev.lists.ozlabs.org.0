Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7093F199B47
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 18:20:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sF1g4pgtzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 03:20:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=P/TI455F; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sDds2v07zDqby
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 03:03:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sDdm4rtYz9twdV;
 Tue, 31 Mar 2020 18:03:40 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=P/TI455F; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id j9HmtKA6VCWP; Tue, 31 Mar 2020 18:03:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sDdm3phzz9twdT;
 Tue, 31 Mar 2020 18:03:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585670620; bh=KeUGzZnFtGicM9GJG6W5CniE8Vm7EQU97MWuVfDdJ0s=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=P/TI455FBD68bvO13vcxWrFrXWjg//BtOLgr4zYq6l+ZsegcWlxx82qMTdVNR84xT
 8Cu6x6vTSLSFtkY9rCjCblzrFO4JfwmLV/jTEx+wXy7zVqOJo528pSU1bi5z2+XaDa
 TzpIYs2GDsW0ncVengJJlPuivKXQ7vzpqxyM3oRE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D679A8B752;
 Tue, 31 Mar 2020 18:03:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gtBu6Tf1jozS; Tue, 31 Mar 2020 18:03:41 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7625A8B868;
 Tue, 31 Mar 2020 18:03:41 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 668FB656AC; Tue, 31 Mar 2020 16:03:41 +0000 (UTC)
Message-Id: <90c430d9e0f7af772a58aaeaf17bcc6321265340.1585670437.git.christophe.leroy@c-s.fr>
In-Reply-To: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
References: <1ae02b6637b87fc5aaa1d5012c3e2cb30e62b4a3.1585670437.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 06/12] powerpc/32s: Make local symbols non visible in
 hash_low.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Tue, 31 Mar 2020 16:03:41 +0000 (UTC)
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

In hash_low.S, a lot of named local symbols are used instead of
numbers to ease code readability. However, they don't need to be
visible.

In order to ease blacklisting of functions running with MMU
disabled for kprobe, rename the symbols to .Lsymbols in order
to hide them as if they were numbered labels.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
v2: lisibility ==> readability
---
 arch/powerpc/mm/book3s32/hash_low.S | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 6d236080cb1a..2afa3fa2012d 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -81,7 +81,7 @@ _GLOBAL(hash_page)
 	rlwinm.	r8,r8,0,0,20		/* extract pt base address */
 #endif
 #ifdef CONFIG_SMP
-	beq-	hash_page_out		/* return if no mapping */
+	beq-	.Lhash_page_out		/* return if no mapping */
 #else
 	/* XXX it seems like the 601 will give a machine fault on the
 	   rfi if its alignment is wrong (bottom 4 bits of address are
@@ -109,11 +109,11 @@ _GLOBAL(hash_page)
 #if (PTE_FLAGS_OFFSET != 0)
 	addi	r8,r8,PTE_FLAGS_OFFSET
 #endif
-retry:
+.Lretry:
 	lwarx	r6,0,r8			/* get linux-style pte, flag word */
 	andc.	r5,r3,r6		/* check access & ~permission */
 #ifdef CONFIG_SMP
-	bne-	hash_page_out		/* return if access not permitted */
+	bne-	.Lhash_page_out		/* return if access not permitted */
 #else
 	bnelr-
 #endif
@@ -128,7 +128,7 @@ retry:
 #endif /* CONFIG_SMP */
 #endif /* CONFIG_PTE_64BIT */
 	stwcx.	r5,0,r8			/* attempt to update PTE */
-	bne-	retry			/* retry if someone got there first */
+	bne-	.Lretry			/* retry if someone got there first */
 
 	mfsrin	r3,r4			/* get segment reg for segment */
 #ifndef CONFIG_VMAP_STACK
@@ -156,7 +156,7 @@ retry:
 #endif
 
 #ifdef CONFIG_SMP
-hash_page_out:
+.Lhash_page_out:
 	eieio
 	lis	r8, (mmu_hash_lock - PAGE_OFFSET)@ha
 	li	r0,0
@@ -358,7 +358,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 1:	LDPTEu	r6,HPTE_SIZE(r4)	/* get next PTE */
 	CMPPTE	0,r6,r5
 	bdnzf	2,1b			/* loop while ctr != 0 && !cr0.eq */
-	beq+	found_slot
+	beq+	.Lfound_slot
 
 	patch_site	0f, patch__hash_page_B
 	/* Search the secondary PTEG for a matching PTE */
@@ -370,7 +370,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 2:	LDPTEu	r6,HPTE_SIZE(r4)
 	CMPPTE	0,r6,r5
 	bdnzf	2,2b
-	beq+	found_slot
+	beq+	.Lfound_slot
 	xori	r5,r5,PTE_H		/* clear H bit again */
 
 	/* Search the primary PTEG for an empty slot */
@@ -379,7 +379,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 1:	LDPTEu	r6,HPTE_SIZE(r4)	/* get next PTE */
 	TST_V(r6)			/* test valid bit */
 	bdnzf	2,1b			/* loop while ctr != 0 && !cr0.eq */
-	beq+	found_empty
+	beq+	.Lfound_empty
 
 	/* update counter of times that the primary PTEG is full */
 	lis	r4, (primary_pteg_full - PAGE_OFFSET)@ha
@@ -397,7 +397,7 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 2:	LDPTEu	r6,HPTE_SIZE(r4)
 	TST_V(r6)
 	bdnzf	2,2b
-	beq+	found_empty
+	beq+	.Lfound_empty
 	xori	r5,r5,PTE_H		/* clear H bit again */
 
 	/*
@@ -435,9 +435,9 @@ END_FTR_SECTION_IFCLR(CPU_FTR_NEED_COHERENT)
 
 #ifndef CONFIG_SMP
 	/* Store PTE in PTEG */
-found_empty:
+.Lfound_empty:
 	STPTE	r5,0(r4)
-found_slot:
+.Lfound_slot:
 	STPTE	r8,HPTE_SIZE/2(r4)
 
 #else /* CONFIG_SMP */
@@ -458,8 +458,8 @@ found_slot:
  * We do however have to make sure that the PTE is never in an invalid
  * state with the V bit set.
  */
-found_empty:
-found_slot:
+.Lfound_empty:
+.Lfound_slot:
 	CLR_V(r5,r0)		/* clear V (valid) bit in PTE */
 	STPTE	r5,0(r4)
 	sync
-- 
2.25.0

