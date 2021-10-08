Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE860426DB5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 17:41:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQsqz2QjTz3bXZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 02:41:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQsq66f0nz2ywW
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 02:41:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HQspy0sNzz9sSy;
 Fri,  8 Oct 2021 17:40:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SucORhE1mb7T; Fri,  8 Oct 2021 17:40:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HQspx2320z9sST;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29FD68B786;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zMJSXxoYf_TM; Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.75])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB6F88B763;
 Fri,  8 Oct 2021 17:40:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 198Feo1e1129700
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Oct 2021 17:40:50 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 198FeoEp1129699;
 Fri, 8 Oct 2021 17:40:50 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 15/16] powerpc/kuap: Wire-up KUAP on book3e/64
Date: Fri,  8 Oct 2021 17:40:43 +0200
Message-Id: <7ffb6b4d3c1ebe04782fe504a1b9256f35659f7a.1633707305.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633707305.git.christophe.leroy@csgroup.eu>
References: <cover.1633707305.git.christophe.leroy@csgroup.eu>
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
index 4ac99614d865..d0e52ad45d73 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -118,6 +118,7 @@ config PPC_BOOK3E_64
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	select ZONE_DMA
+	select PPC_HAVE_KUAP
 
 endchoice
 
-- 
2.31.1

