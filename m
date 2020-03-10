Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB831804D1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 18:30:52 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cMZ10bPPzDqTK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 04:30:49 +1100 (AEDT)
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
 header.s=mail header.b=K7W5xBae; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cMXH4C2fzDqQx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 04:29:18 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48cMX73ZVLz9tyJT;
 Tue, 10 Mar 2020 18:29:11 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=K7W5xBae; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HkzUNqv0j9FF; Tue, 10 Mar 2020 18:29:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48cMX72XnSz9tyJR;
 Tue, 10 Mar 2020 18:29:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1583861351; bh=wQFGA5yOUDCLiaQWRK43yJsCfrQxWMeWcX1p+cg+rY4=;
 h=From:Subject:To:Cc:Date:From;
 b=K7W5xBaeaIen39k2xESJ1+k6eHbVqFRJTEU7UDmC1DbQ6SfocM6JVkjExmj9AQ0BW
 NKf/34uzOhgNo892c0yk3qRsO1n7i5QsyRdvTvwgdfosU8COLT7PvPdzOo+YhEOpXV
 76GgtOL4hjDvTgkZIqyf1bAXCKAxBmewclpnYVeM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 17E978B874;
 Tue, 10 Mar 2020 18:29:13 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vYZ3gXVSD6nz; Tue, 10 Mar 2020 18:29:12 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B49AE8B756;
 Tue, 10 Mar 2020 18:29:12 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6DC86654D9; Tue, 10 Mar 2020 17:29:12 +0000 (UTC)
Message-Id: <c4d6c18a7f8d9d3b899bc492f55fbc40ef38896a.1583861325.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3] powerpc/32s: reorder Linux PTE bits to better match Hash
 PTE bits.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 10 Mar 2020 17:29:12 +0000 (UTC)
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

Reorder Linux PTE bits to (almost) match Hash PTE bits.

RW Kernel : PP = 00
RO Kernel : PP = 00
RW User   : PP = 01
RO User   : PP = 11

So naturally, we should have
_PAGE_USER = 0x001
_PAGE_RW   = 0x002

Today 0x001 and 0x002 and _PAGE_PRESENT and _PAGE_HASHPTE which
both are software only bits.

Switch _PAGE_USER and _PAGE_PRESET
Switch _PAGE_RW and _PAGE_HASHPTE

This allows to remove a few insns.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v3: rebased on today's powerpc/merge

v2: rebased on today's powerpc/merge
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/hash.h |  8 ++++----
 arch/powerpc/kernel/head_32.S             |  9 +++------
 arch/powerpc/mm/book3s32/hash_low.S       | 14 ++++++--------
 3 files changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/hash.h b/arch/powerpc/include/asm/book3s/32/hash.h
index 2a0a467d2985..34a7215ae81e 100644
--- a/arch/powerpc/include/asm/book3s/32/hash.h
+++ b/arch/powerpc/include/asm/book3s/32/hash.h
@@ -17,9 +17,9 @@
  * updating the accessed and modified bits in the page table tree.
  */
 
-#define _PAGE_PRESENT	0x001	/* software: pte contains a translation */
-#define _PAGE_HASHPTE	0x002	/* hash_page has made an HPTE for this pte */
-#define _PAGE_USER	0x004	/* usermode access allowed */
+#define _PAGE_USER	0x001	/* usermode access allowed */
+#define _PAGE_RW	0x002	/* software: user write access allowed */
+#define _PAGE_PRESENT	0x004	/* software: pte contains a translation */
 #define _PAGE_GUARDED	0x008	/* G: prohibit speculative access */
 #define _PAGE_COHERENT	0x010	/* M: enforce memory coherence (SMP systems) */
 #define _PAGE_NO_CACHE	0x020	/* I: cache inhibit */
@@ -27,7 +27,7 @@
 #define _PAGE_DIRTY	0x080	/* C: page changed */
 #define _PAGE_ACCESSED	0x100	/* R: page referenced */
 #define _PAGE_EXEC	0x200	/* software: exec allowed */
-#define _PAGE_RW	0x400	/* software: user write access allowed */
+#define _PAGE_HASHPTE	0x400	/* hash_page has made an HPTE for this pte */
 #define _PAGE_SPECIAL	0x800	/* software: Special page */
 
 #ifdef CONFIG_PTE_64BIT
diff --git a/arch/powerpc/kernel/head_32.S b/arch/powerpc/kernel/head_32.S
index 97c887950c3c..daaa153950c2 100644
--- a/arch/powerpc/kernel/head_32.S
+++ b/arch/powerpc/kernel/head_32.S
@@ -348,7 +348,7 @@ BEGIN_MMU_FTR_SECTION
 	andis.	r0, r5, (DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)@h
 #endif
 	bne	handle_page_fault_tramp_2	/* if not, try to put a PTE */
-	rlwinm	r3, r5, 32 - 15, 21, 21		/* DSISR_STORE -> _PAGE_RW */
+	rlwinm	r3, r5, 32 - 24, 30, 30		/* DSISR_STORE -> _PAGE_RW */
 	bl	hash_page
 	b	handle_page_fault_tramp_1
 FTR_SECTION_ELSE
@@ -497,7 +497,6 @@ InstructionTLBMiss:
 	andc.	r1,r1,r0		/* check access & ~permission */
 	bne-	InstructionAddressInvalid /* return if access not permitted */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwimi	r0,r0,32-2,31,31	/* _PAGE_USER -> PP lsb */
 	ori	r1, r1, 0xe06		/* clear out reserved bits */
 	andc	r1, r0, r1		/* PP = user? 1 : 0 */
 BEGIN_FTR_SECTION
@@ -565,9 +564,8 @@ DataLoadTLBMiss:
 	 * we would need to update the pte atomically with lwarx/stwcx.
 	 */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwinm	r1,r0,32-9,30,30	/* _PAGE_RW -> PP msb */
-	rlwimi	r0,r0,32-1,30,30	/* _PAGE_USER -> PP msb */
-	rlwimi	r0,r0,32-1,31,31	/* _PAGE_USER -> PP lsb */
+	rlwinm	r1,r0,0,30,30		/* _PAGE_RW -> PP msb */
+	rlwimi	r0,r0,1,30,30		/* _PAGE_USER -> PP msb */
 	ori	r1,r1,0xe04		/* clear out reserved bits */
 	andc	r1,r0,r1		/* PP = user? rw? 1: 3: 0 */
 BEGIN_FTR_SECTION
@@ -645,7 +643,6 @@ DataStoreTLBMiss:
 	 * we would need to update the pte atomically with lwarx/stwcx.
 	 */
 	/* Convert linux-style PTE to low word of PPC-style PTE */
-	rlwimi	r0,r0,32-2,31,31	/* _PAGE_USER -> PP lsb */
 	li	r1,0xe06		/* clear out reserved bits & PP msb */
 	andc	r1,r0,r1		/* PP = user? 1: 0 */
 BEGIN_FTR_SECTION
diff --git a/arch/powerpc/mm/book3s32/hash_low.S b/arch/powerpc/mm/book3s32/hash_low.S
index 877d880890fe..6d236080cb1a 100644
--- a/arch/powerpc/mm/book3s32/hash_low.S
+++ b/arch/powerpc/mm/book3s32/hash_low.S
@@ -35,7 +35,7 @@ mmu_hash_lock:
 /*
  * Load a PTE into the hash table, if possible.
  * The address is in r4, and r3 contains an access flag:
- * _PAGE_RW (0x400) if a write.
+ * _PAGE_RW (0x002) if a write.
  * r9 contains the SRR1 value, from which we use the MSR_PR bit.
  * SPRG_THREAD contains the physical address of the current task's thread.
  *
@@ -69,7 +69,7 @@ _GLOBAL(hash_page)
 	blt+	112f			/* assume user more likely */
 	lis	r5, (swapper_pg_dir - PAGE_OFFSET)@ha	/* if kernel address, use */
 	addi	r5 ,r5 ,(swapper_pg_dir - PAGE_OFFSET)@l	/* kernel page table */
-	rlwimi	r3,r9,32-12,29,29	/* MSR_PR -> _PAGE_USER */
+	rlwimi	r3,r9,32-14,31,31	/* MSR_PR -> _PAGE_USER */
 112:
 #ifndef CONFIG_PTE_64BIT
 	rlwimi	r5,r4,12,20,29		/* insert top 10 bits of address */
@@ -94,7 +94,7 @@ _GLOBAL(hash_page)
 #else
 	rlwimi	r8,r4,23,20,28		/* compute pte address */
 #endif
-	rlwinm	r0,r3,32-3,24,24	/* _PAGE_RW access -> _PAGE_DIRTY */
+	rlwinm	r0,r3,6,24,24		/* _PAGE_RW access -> _PAGE_DIRTY */
 	ori	r0,r0,_PAGE_ACCESSED|_PAGE_HASHPTE
 
 	/*
@@ -310,11 +310,9 @@ Hash_msk = (((1 << Hash_bits) - 1) * 64)
 
 _GLOBAL(create_hpte)
 	/* Convert linux-style PTE (r5) to low word of PPC-style PTE (r8) */
-	rlwinm	r8,r5,32-9,30,30	/* _PAGE_RW -> PP msb */
 	rlwinm	r0,r5,32-6,30,30	/* _PAGE_DIRTY -> PP msb */
-	and	r8,r8,r0		/* writable if _RW & _DIRTY */
-	rlwimi	r5,r5,32-1,30,30	/* _PAGE_USER -> PP msb */
-	rlwimi	r5,r5,32-2,31,31	/* _PAGE_USER -> PP lsb */
+	and	r8,r5,r0		/* writable if _RW & _DIRTY */
+	rlwimi	r5,r5,1,30,30		/* _PAGE_USER -> PP msb */
 	ori	r8,r8,0xe04		/* clear out reserved bits */
 	andc	r8,r5,r8		/* PP = user? (rw&dirty? 1: 3): 0 */
 BEGIN_FTR_SECTION
@@ -566,7 +564,7 @@ _GLOBAL(flush_hash_pages)
 33:	lwarx	r8,0,r5			/* fetch the pte flags word */
 	andi.	r0,r8,_PAGE_HASHPTE
 	beq	8f			/* done if HASHPTE is already clear */
-	rlwinm	r8,r8,0,31,29		/* clear HASHPTE bit */
+	rlwinm	r8,r8,0,~_PAGE_HASHPTE	/* clear HASHPTE bit */
 	stwcx.	r8,0,r5			/* update the pte */
 	bne-	33b
 
-- 
2.25.0

