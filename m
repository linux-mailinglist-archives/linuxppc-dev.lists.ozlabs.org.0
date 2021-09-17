Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E9840F496
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 11:17:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H9pHy4Fp7z2yp5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Sep 2021 19:17:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H9pHS03sQz2yHb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Sep 2021 19:16:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H9pHK5gnNz9sV5;
 Fri, 17 Sep 2021 11:16:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ztcfKQ7GnnFR; Fri, 17 Sep 2021 11:16:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H9pHK4lJhz9sS4;
 Fri, 17 Sep 2021 11:16:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 903158B783;
 Fri, 17 Sep 2021 11:16:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 71PENj4KiEWQ; Fri, 17 Sep 2021 11:16:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.36])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4728D8B768;
 Fri, 17 Sep 2021 11:16:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18H9GYmP553829
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 17 Sep 2021 11:16:34 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18H9GWAJ553827;
 Fri, 17 Sep 2021 11:16:32 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/8xx: Simplify TLB handling
Date: Fri, 17 Sep 2021 11:16:22 +0200
Message-Id: <5f5bb00293c4bf8115c327eb80488b3aa01b9f36.1631870171.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the old days, TLB handling for 8xx was using tlbie and tlbia
instructions directly as much as possible.

But commit f048aace29e0 ("powerpc/mm: Add SMP support to no-hash
TLB handling") broke that by introducing out-of-line unnecessary
complex functions for booke/smp which don't have tlbie/tlbia
instructions and require more complex handling.

Restore direct use of tlbie and tlbia for 8xx which is never SMP.

With this patch we now get

	c00ecc68 <ptep_clear_flush>:
	c00ecc68:	39 00 00 00 	li      r8,0
	c00ecc6c:	81 46 00 00 	lwz     r10,0(r6)
	c00ecc70:	91 06 00 00 	stw     r8,0(r6)
	c00ecc74:	7c 00 2a 64 	tlbie   r5,r0
	c00ecc78:	7c 00 04 ac 	hwsync
	c00ecc7c:	91 43 00 00 	stw     r10,0(r3)
	c00ecc80:	4e 80 00 20 	blr

Before it was

	c0012880 <local_flush_tlb_page>:
	c0012880:	2c 03 00 00 	cmpwi   r3,0
	c0012884:	41 82 00 54 	beq     c00128d8 <local_flush_tlb_page+0x58>
	c0012888:	81 22 00 00 	lwz     r9,0(r2)
	c001288c:	81 43 00 20 	lwz     r10,32(r3)
	c0012890:	39 29 00 01 	addi    r9,r9,1
	c0012894:	91 22 00 00 	stw     r9,0(r2)
	c0012898:	2c 0a 00 00 	cmpwi   r10,0
	c001289c:	41 82 00 10 	beq     c00128ac <local_flush_tlb_page+0x2c>
	c00128a0:	81 2a 01 dc 	lwz     r9,476(r10)
	c00128a4:	2c 09 ff ff 	cmpwi   r9,-1
	c00128a8:	41 82 00 0c 	beq     c00128b4 <local_flush_tlb_page+0x34>
	c00128ac:	7c 00 22 64 	tlbie   r4,r0
	c00128b0:	7c 00 04 ac 	hwsync
	c00128b4:	81 22 00 00 	lwz     r9,0(r2)
	c00128b8:	39 29 ff ff 	addi    r9,r9,-1
	c00128bc:	2c 09 00 00 	cmpwi   r9,0
	c00128c0:	91 22 00 00 	stw     r9,0(r2)
	c00128c4:	4c a2 00 20 	bclr+   4,eq
	c00128c8:	81 22 00 70 	lwz     r9,112(r2)
	c00128cc:	71 29 00 04 	andi.   r9,r9,4
	c00128d0:	4d 82 00 20 	beqlr
	c00128d4:	48 65 76 74 	b       c0669f48 <preempt_schedule>
	c00128d8:	81 22 00 00 	lwz     r9,0(r2)
	c00128dc:	39 29 00 01 	addi    r9,r9,1
	c00128e0:	91 22 00 00 	stw     r9,0(r2)
	c00128e4:	4b ff ff c8 	b       c00128ac <local_flush_tlb_page+0x2c>
...
	c00ecdc8 <ptep_clear_flush>:
	c00ecdc8:	94 21 ff f0 	stwu    r1,-16(r1)
	c00ecdcc:	39 20 00 00 	li      r9,0
	c00ecdd0:	93 c1 00 08 	stw     r30,8(r1)
	c00ecdd4:	83 c6 00 00 	lwz     r30,0(r6)
	c00ecdd8:	91 26 00 00 	stw     r9,0(r6)
	c00ecddc:	93 e1 00 0c 	stw     r31,12(r1)
	c00ecde0:	7c 08 02 a6 	mflr    r0
	c00ecde4:	7c 7f 1b 78 	mr      r31,r3
	c00ecde8:	7c 83 23 78 	mr      r3,r4
	c00ecdec:	7c a4 2b 78 	mr      r4,r5
	c00ecdf0:	90 01 00 14 	stw     r0,20(r1)
	c00ecdf4:	4b f2 5a 8d 	bl      c0012880 <local_flush_tlb_page>
	c00ecdf8:	93 df 00 00 	stw     r30,0(r31)
	c00ecdfc:	7f e3 fb 78 	mr      r3,r31
	c00ece00:	80 01 00 14 	lwz     r0,20(r1)
	c00ece04:	83 c1 00 08 	lwz     r30,8(r1)
	c00ece08:	83 e1 00 0c 	lwz     r31,12(r1)
	c00ece0c:	7c 08 03 a6 	mtlr    r0
	c00ece10:	38 21 00 10 	addi    r1,r1,16
	c00ece14:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/tlbflush.h | 20 ++++++++++++++++++++
 arch/powerpc/mm/nohash/tlb.c               |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h b/arch/powerpc/include/asm/nohash/tlbflush.h
index 1edb7243e515..a7ec171d79a6 100644
--- a/arch/powerpc/include/asm/nohash/tlbflush.h
+++ b/arch/powerpc/include/asm/nohash/tlbflush.h
@@ -32,11 +32,31 @@ extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			    unsigned long end);
 extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
+#ifdef CONFIG_PPC_8xx
+#include <asm/trace.h>
+
+static inline void local_flush_tlb_mm(struct mm_struct *mm)
+{
+	unsigned int pid = READ_ONCE(mm->context.id);
+
+	if (pid != MMU_NO_CONTEXT) {
+		asm volatile ("sync; tlbia; isync" : : : "memory");
+		trace_tlbia(pid);
+	}
+}
+
+static inline void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
+{
+	asm volatile ("tlbie %0; sync" : : "r" (vmaddr) : "memory");
+	trace_tlbie(0, 0, vmaddr, vma ? vma->vm_mm->context.id : 0, 0, 0, 0);
+}
+#else
 extern void local_flush_tlb_mm(struct mm_struct *mm);
 extern void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 
 extern void __local_flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
 				   int tsize, int ind);
+#endif
 
 #ifdef CONFIG_SMP
 extern void flush_tlb_mm(struct mm_struct *mm);
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5872f69141d5..6d8cb68f6efb 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -185,6 +185,7 @@ EXPORT_PER_CPU_SYMBOL(next_tlbcam_idx);
  *    processor
  */
 
+#ifndef CONFIG_PPC_8xx
 /*
  * These are the base non-SMP variants of page and mm flushing
  */
@@ -218,6 +219,7 @@ void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 			       mmu_get_tsize(mmu_virtual_psize), 0);
 }
 EXPORT_SYMBOL(local_flush_tlb_page);
+#endif
 
 /*
  * And here are the SMP non-local implementations
-- 
2.31.1

