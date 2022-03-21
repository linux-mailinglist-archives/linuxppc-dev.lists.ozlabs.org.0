Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F02F4E2CA9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 16:44:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMf7s2qNxz30Ml
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 02:44:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMf7P51S3z3081
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 02:44:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KMf7J0j7Pz9sTR;
 Mon, 21 Mar 2022 16:44:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoBeDnlYAB27; Mon, 21 Mar 2022 16:44:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KMf7H6v0Dz9sTJ;
 Mon, 21 Mar 2022 16:44:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DAB568B76C;
 Mon, 21 Mar 2022 16:44:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x5kFrdRoHAZQ; Mon, 21 Mar 2022 16:44:27 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BADD38B763;
 Mon, 21 Mar 2022 16:44:27 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22LFiKbT961626
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 16:44:20 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22LFiKf3961625;
 Mon, 21 Mar 2022 16:44:20 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/8xx: Simplify flush_tlb_kernel_range()
Date: Mon, 21 Mar 2022 16:44:18 +0100
Message-Id: <d2610043419ce3e0e53a85386baf2c3625af5cfb.1647877442.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647877457; l=3207; s=20211009;
 h=from:subject:message-id; bh=wo+l3Ty7x7G0TJcI1el4B2Dq+N11ZiAUXWWCrMOWJR0=;
 b=AaHLo6d1XQVXoC7ycHe2Zgf5XOznVtzZlBfvRgWElSRF1EE4kNOYDXg4wteWWEuKxdwT0Pu80xHO
 bKWNsylWAw7RT1/ujBd5Q+f5pU1yiOzdkgXbNBa/8oKl+achgAuw
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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

In the same spirit as commit 63f501e07a85 ("powerpc/8xx: Simplify TLB
handling"), simplify flush_tlb_kernel_range() for 8xx.

8xx cannot be SMP, and has 'tlbie' and 'tlbia' instructions, so
an inline version of flush_tlb_kernel_range() for 8xx is worth it.

With this page, first leg of change_page_attr() is:

	  2c:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
	  30:	91 23 00 00 	stw     r9,0(r3)
	  34:	7c 00 22 64 	tlbie   r4,r0
	  38:	7c 00 04 ac 	hwsync
	  3c:	38 60 00 00 	li      r3,0
	  40:	4e 80 00 20 	blr

Before the patch it was:

	  30:	55 29 00 3c 	rlwinm  r9,r9,0,0,30
	  34:	91 2a 00 00 	stw     r9,0(r10)
	  38:	94 21 ff f0 	stwu    r1,-16(r1)
	  3c:	7c 08 02 a6 	mflr    r0
	  40:	38 83 10 00 	addi    r4,r3,4096
	  44:	90 01 00 14 	stw     r0,20(r1)
	  48:	48 00 00 01 	bl      48 <change_page_attr+0x48>
				48: R_PPC_REL24	flush_tlb_kernel_range
	  4c:	80 01 00 14 	lwz     r0,20(r1)
	  50:	38 60 00 00 	li      r3,0
	  54:	7c 08 03 a6 	mtlr    r0
	  58:	38 21 00 10 	addi    r1,r1,16
	  5c:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/tlbflush.h | 12 +++++++++++-
 arch/powerpc/mm/nohash/tlb.c               |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/nohash/tlbflush.h b/arch/powerpc/include/asm/nohash/tlbflush.h
index c08d25e3e626..698935d4f72d 100644
--- a/arch/powerpc/include/asm/nohash/tlbflush.h
+++ b/arch/powerpc/include/asm/nohash/tlbflush.h
@@ -30,7 +30,6 @@ struct mm_struct;
 
 extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			    unsigned long end);
-extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 
 #ifdef CONFIG_PPC_8xx
 static inline void local_flush_tlb_mm(struct mm_struct *mm)
@@ -45,7 +44,18 @@ static inline void local_flush_tlb_page(struct vm_area_struct *vma, unsigned lon
 {
 	asm volatile ("tlbie %0; sync" : : "r" (vmaddr) : "memory");
 }
+
+static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end)
+{
+	start &= PAGE_MASK;
+
+	if (end - start <= PAGE_SIZE)
+		asm volatile ("tlbie %0; sync" : : "r" (start) : "memory");
+	else
+		asm volatile ("sync; tlbia; isync" : : : "memory");
+}
 #else
+extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);
 extern void local_flush_tlb_mm(struct mm_struct *mm);
 extern void local_flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index fd2c77af5c55..47f81d1c35dc 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -358,6 +358,7 @@ void __init early_init_mmu_47x(void)
 /*
  * Flush kernel TLB entries in the given range
  */
+#ifndef CONFIG_PPC_8xx
 void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 {
 #ifdef CONFIG_SMP
@@ -370,6 +371,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end)
 #endif
 }
 EXPORT_SYMBOL(flush_tlb_kernel_range);
+#endif
 
 /*
  * Currently, for range flushing, we just do a full mm flush. This should
-- 
2.35.1

