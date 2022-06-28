Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F97255E575
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 16:50:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXSDy6YzHz3cBp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 00:50:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXSD831Z5z3ccy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 00:49:28 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LXSCy3XXsz9tTw;
	Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2UtnhNzopbXw; Tue, 28 Jun 2022 16:49:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LXSCx4ylfz9tV1;
	Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8770A8B787;
	Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3e92SFMNOl1c; Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.132])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 38FB28B765;
	Tue, 28 Jun 2022 16:49:17 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 25SEn7C32928187
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 28 Jun 2022 16:49:07 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 25SEn70V2928183;
	Tue, 28 Jun 2022 16:49:07 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, dja@axtens.net
Subject: [PATCH v1 1/6] powerpc/64e: Fix early TLB miss with KUAP
Date: Tue, 28 Jun 2022 16:48:54 +0200
Message-Id: <8d6c5859a45935d6e1a336da4dc20be421e8cea7.1656427701.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1656427736; l=2726; s=20211009; h=from:subject:message-id; bh=4c9cq6TjMjaZsHx8VkXNUgeyvb6bfH74ZSSKL8bYUs8=; b=SF5iSK7Ye4Q+8F6+uETerT8Y4xg2atv7a8xzA5RRwjQ0BieTWvBNamBMtM+PUxwpJNgV2/V66k4c 5FFHmehFB3AzouAMpaZRrZAJixojUdOLIqZyHGkcfVsUoae0itdr
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With KUAP, the TLB miss handler bails out when an access to user
memory is performed with a nul TID.

But the normal TLB miss routine which is only used early during boot
does the check regardless for all memory areas, not only user memory.

By chance there is no early IO or vmalloc access, but when KASAN
come we will start having early TLB misses.

Fix it by creating a special branch for user accesses similar to the
one in the 'bolted' TLB miss handlers. Unfortunately SPRN_MAS1 is
now read too early and there are no registers available to preserve
it so it will be read a second time.

Fixes: 57bc963837f5 ("powerpc/kuap: Wire-up KUAP on book3e/64")
Cc: stable@vger.kernel.org
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/tlb_low_64e.S | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index 8b97c4acfebf..9e9ab3803fb2 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -583,7 +583,7 @@ itlb_miss_fault_e6500:
 	 */
 	rlwimi	r11,r14,32-19,27,27
 	rlwimi	r11,r14,32-16,19,19
-	beq	normal_tlb_miss
+	beq	normal_tlb_miss_user
 	/* XXX replace the RMW cycles with immediate loads + writes */
 1:	mfspr	r10,SPRN_MAS1
 	cmpldi	cr0,r15,8		/* Check for vmalloc region */
@@ -626,7 +626,7 @@ itlb_miss_fault_e6500:
 
 	cmpldi	cr0,r15,0			/* Check for user region */
 	std	r14,EX_TLB_ESR(r12)		/* write crazy -1 to frame */
-	beq	normal_tlb_miss
+	beq	normal_tlb_miss_user
 
 	li	r11,_PAGE_PRESENT|_PAGE_BAP_SX	/* Base perm */
 	oris	r11,r11,_PAGE_ACCESSED@h
@@ -653,6 +653,12 @@ itlb_miss_fault_e6500:
  * r11 = PTE permission mask
  * r10 = crap (free to use)
  */
+normal_tlb_miss_user:
+#ifdef CONFIG_PPC_KUAP
+	mfspr	r14,SPRN_MAS1
+	rlwinm.	r14,r14,0,0x3fff0000
+	beq-	normal_tlb_miss_access_fault /* KUAP fault */
+#endif
 normal_tlb_miss:
 	/* So we first construct the page table address. We do that by
 	 * shifting the bottom of the address (not the region ID) by
@@ -683,11 +689,6 @@ finish_normal_tlb_miss:
 	/* Check if required permissions are met */
 	andc.	r15,r11,r14
 	bne-	normal_tlb_miss_access_fault
-#ifdef CONFIG_PPC_KUAP
-	mfspr	r11,SPRN_MAS1
-	rlwinm.	r10,r11,0,0x3fff0000
-	beq-	normal_tlb_miss_access_fault /* KUAP fault */
-#endif
 
 	/* Now we build the MAS:
 	 *
@@ -709,9 +710,7 @@ finish_normal_tlb_miss:
 	rldicl	r10,r14,64-8,64-8
 	cmpldi	cr0,r10,BOOK3E_PAGESZ_4K
 	beq-	1f
-#ifndef CONFIG_PPC_KUAP
 	mfspr	r11,SPRN_MAS1
-#endif
 	rlwimi	r11,r14,31,21,24
 	rlwinm	r11,r11,0,21,19
 	mtspr	SPRN_MAS1,r11
-- 
2.36.1

