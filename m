Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88461432FBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 09:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYQZl0Rmkz3dxB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 18:38:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYQR12B82z3dgj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 18:31:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HYQPZ0ptzz9sTF;
 Tue, 19 Oct 2021 09:30:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id amw3mc1fD-Rp; Tue, 19 Oct 2021 09:30:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HYQP80P8dz9sT7;
 Tue, 19 Oct 2021 09:29:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01B8A8B779;
 Tue, 19 Oct 2021 09:29:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cVtbzBxYFAnQ; Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.71])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 461958B774;
 Tue, 19 Oct 2021 09:29:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19J7TfN93188482
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 09:29:41 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19J7Tfpd3188481;
 Tue, 19 Oct 2021 09:29:41 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 21/22] powerpc/kuap: Wire-up KUAP on book3e/64
Date: Tue, 19 Oct 2021 09:29:32 +0200
Message-Id: <e2c2c9375afd4bbc06aa904d0103a5f5102a2b1a.1634627931.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1634627931.git.christophe.leroy@csgroup.eu>
References: <cover.1634627931.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634628571; l=3439; s=20211009;
 h=from:subject:message-id; bh=iKUnttrFhPteXmV51nnstE3BdK77uTB9XSLAA0JSXNo=;
 b=p52vCUwOGOvMhFCyX975uvxhcJResH0hKj6rpA/hK6gO7WNaQJcnzyabL8jgQf0HdO/m90gKP6GH
 kHXnDg8ICzTfkxQFvklEV7yUc7dJdQ5BWYkYa8H6mdCulQxd4QXC
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

This adds KUAP support to book3e/64.
This is done by reading the content of SPRN_MAS1 and checking
the TID at the time user pgtable is loaded.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/nohash/tlb_low_64e.S   | 40 ++++++++++++++++++++++----
 arch/powerpc/platforms/Kconfig.cputype |  1 +
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/nohash/tlb_low_64e.S b/arch/powerpc/mm/nohash/tlb_low_64e.S
index bf24451f3e71..b43524ca2b95 100644
--- a/arch/powerpc/mm/nohash/tlb_low_64e.S
+++ b/arch/powerpc/mm/nohash/tlb_low_64e.S
@@ -128,6 +128,13 @@ END_BTB_FLUSH_SECTION
 
 	bne	tlb_miss_kernel_bolted
 
+tlb_miss_user_bolted:
+#ifdef CONFIG_PPC_KUAP
+	mfspr	r10,SPRN_MAS1
+	rlwinm.	r10,r10,0,0x3fff0000
+	beq-	tlb_miss_fault_bolted /* KUAP fault */
+#endif
+
 tlb_miss_common_bolted:
 /*
  * This is the guts of the TLB miss handler for bolted-linear.
@@ -246,7 +253,7 @@ itlb_miss_fault_bolted:
 
 	cmpldi	cr0,r15,0			/* Check for user region */
 	oris	r11,r11,_PAGE_ACCESSED@h
-	beq	tlb_miss_common_bolted
+	beq	tlb_miss_user_bolted
 	b	itlb_miss_kernel_bolted
 
 #ifdef CONFIG_PPC_FSL_BOOK3E
@@ -676,6 +683,11 @@ finish_normal_tlb_miss:
 	/* Check if required permissions are met */
 	andc.	r15,r11,r14
 	bne-	normal_tlb_miss_access_fault
+#ifdef CONFIG_PPC_KUAP
+	mfspr	r11,SPRN_MAS1
+	rlwinm.	r10,r11,0,0x3fff0000
+	beq-	normal_tlb_miss_access_fault /* KUAP fault */
+#endif
 
 	/* Now we build the MAS:
 	 *
@@ -689,15 +701,17 @@ finish_normal_tlb_miss:
 	 *
 	 * TODO: mix up code below for better scheduling
 	 */
-	clrrdi	r11,r16,12		/* Clear low crap in EA */
-	rlwimi	r11,r14,32-19,27,31	/* Insert WIMGE */
-	mtspr	SPRN_MAS2,r11
+	clrrdi	r10,r16,12		/* Clear low crap in EA */
+	rlwimi	r10,r14,32-19,27,31	/* Insert WIMGE */
+	mtspr	SPRN_MAS2,r10
 
 	/* Check page size, if not standard, update MAS1 */
-	rldicl	r11,r14,64-8,64-8
-	cmpldi	cr0,r11,BOOK3E_PAGESZ_4K
+	rldicl	r10,r14,64-8,64-8
+	cmpldi	cr0,r10,BOOK3E_PAGESZ_4K
 	beq-	1f
+#ifndef CONFIG_PPC_KUAP
 	mfspr	r11,SPRN_MAS1
+#endif
 	rlwimi	r11,r14,31,21,24
 	rlwinm	r11,r11,0,21,19
 	mtspr	SPRN_MAS1,r11
@@ -786,7 +800,16 @@ virt_page_table_tlb_miss:
 	mfspr	r10,SPRN_MAS1
 	rlwinm	r10,r10,0,16,1			/* Clear TID */
 	mtspr	SPRN_MAS1,r10
+#ifdef CONFIG_PPC_KUAP
+	b	2f
+1:
+	mfspr	r10,SPRN_MAS1
+	rlwinm.	r10,r10,0,0x3fff0000
+	beq-	virt_page_table_tlb_miss_fault /* KUAP fault */
+2:
+#else
 1:
+#endif
 BEGIN_MMU_FTR_SECTION
 	/* Search if we already have a TLB entry for that virtual address, and
 	 * if we do, bail out.
@@ -1027,6 +1050,11 @@ virt_page_table_tlb_miss_whacko_fault:
  * avoid too much complication, it will save/restore things for us
  */
 htw_tlb_miss:
+#ifdef CONFIG_PPC_KUAP
+	mfspr	r10,SPRN_MAS1
+	rlwinm.	r10,r10,0,0x3fff0000
+	beq-	htw_tlb_miss_fault /* KUAP fault */
+#endif
 	/* Search if we already have a TLB entry for that virtual address, and
 	 * if we do, bail out.
 	 *
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 611d6efc047b..f3614bfd47ad 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -122,6 +122,7 @@ config PPC_BOOK3E_64
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	select ZONE_DMA
+	select PPC_HAVE_KUAP
 
 endchoice
 
-- 
2.31.1

