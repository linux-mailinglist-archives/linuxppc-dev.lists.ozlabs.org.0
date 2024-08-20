Return-Path: <linuxppc-dev+bounces-237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB8958D35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 19:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpGYW28VPz2yGN;
	Wed, 21 Aug 2024 03:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpGYW02WPz2xPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 03:24:46 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WpGY91VYZz9sSY;
	Tue, 20 Aug 2024 19:24:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JmDvM8lCWGJn; Tue, 20 Aug 2024 19:24:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WpGY70TDHz9sSR;
	Tue, 20 Aug 2024 19:24:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F04C58B778;
	Tue, 20 Aug 2024 19:24:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WCmLBWefrDZx; Tue, 20 Aug 2024 19:24:26 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.72])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 86CB88B779;
	Tue, 20 Aug 2024 19:24:26 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: CASAUBON Jean Michel <jean-michel.casaubon@cs-soprasteria.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/14] Revert "powerpc/8xx: Always pin kernel text TLB"
Date: Tue, 20 Aug 2024 19:23:48 +0200
Message-ID: <01b6780b860c8043b51a1ba9d83acfc6f2dde910.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1724173828.git.christophe.leroy@csgroup.eu>
References: <cover.1724173828.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724174648; l=3163; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=89l7e72r9luYR6lws+BwxH/ueiJ6/nSxxBE3Zkxuyh0=; b=BNQReqqPqedw4Pd3O7oDfjM6EUAgl0khRY5QflVXWvRe9l8vaL6VaFp0CUgwlIC11AjvRwY0t +RzPg8Jcg52BiNZp15GSIsDHdFlY9CozqTLWn5375ShcMZ6ztlZFFKu
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

This reverts commit bccc58986a2f98e3af349c85c5f49aac7fb19ef2.

When STRICT_KERNEL_RWX is selected, EXEC memory must stop where
RW memory start. When pinning iTLBs it means an 8M alignment for
RW data start. That may be acceptable on boards with a lot of
memory but one of my supported boards only has 32 Mbytes and this
forced alignment leads to a waste of almost 4 Mbytes with is more
than 10% of the total memory.

So revert commit bccc58986a2f ("powerpc/8xx: Always pin kernel text
TLB") but don't restore previous behaviour in ITLB miss handler
as now kernel PGD entries are copied into each process PGDIR.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_8xx.S     | 8 ++++++++
 arch/powerpc/mm/nohash/8xx.c       | 3 ++-
 arch/powerpc/platforms/8xx/Kconfig | 7 +++++++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index c955a8196d55..66ee0a31d99d 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -587,6 +587,10 @@ start_here:
 	lis	r0, (MD_TWAM | MD_RSV4I)@h
 	mtspr	SPRN_MD_CTR, r0
 #endif
+#ifndef CONFIG_PIN_TLB_TEXT
+	li	r0, 0
+	mtspr	SPRN_MI_CTR, r0
+#endif
 #if !defined(CONFIG_PIN_TLB_DATA) && !defined(CONFIG_PIN_TLB_IMMR)
 	lis	r0, MD_TWAM@h
 	mtspr	SPRN_MD_CTR, r0
@@ -683,6 +687,7 @@ SYM_FUNC_START_LOCAL(initial_mmu)
 	blr
 SYM_FUNC_END(initial_mmu)
 
+#ifdef CONFIG_PIN_TLB
 _GLOBAL(mmu_pin_tlb)
 	lis	r9, (1f - PAGE_OFFSET)@h
 	ori	r9, r9, (1f - PAGE_OFFSET)@l
@@ -704,6 +709,7 @@ _GLOBAL(mmu_pin_tlb)
 	mtspr	SPRN_MD_CTR, r6
 	tlbia
 
+#ifdef CONFIG_PIN_TLB_TEXT
 	LOAD_REG_IMMEDIATE(r5, 28 << 8)
 	LOAD_REG_IMMEDIATE(r6, PAGE_OFFSET)
 	LOAD_REG_IMMEDIATE(r7, MI_SVALID | MI_PS8MEG | _PMD_ACCESSED)
@@ -724,6 +730,7 @@ _GLOBAL(mmu_pin_tlb)
 	bdnzt	lt, 2b
 	lis	r0, MI_RSV4I@h
 	mtspr	SPRN_MI_CTR, r0
+#endif
 
 	LOAD_REG_IMMEDIATE(r5, 28 << 8 | MD_TWAM)
 #ifdef CONFIG_PIN_TLB_DATA
@@ -783,3 +790,4 @@ _GLOBAL(mmu_pin_tlb)
 	mtspr	SPRN_SRR1, r10
 	mtspr	SPRN_SRR0, r11
 	rfi
+#endif
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 15d918dce27d..4c2f9d716993 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -177,7 +177,8 @@ int mmu_mark_initmem_nx(void)
 	if (!debug_pagealloc_enabled_or_kfence())
 		err = mmu_mapin_ram_chunk(boundary, einittext8, PAGE_KERNEL, false);
 
-	mmu_pin_tlb(block_mapped_ram, false);
+	if (IS_ENABLED(CONFIG_PIN_TLB_TEXT))
+		mmu_pin_tlb(block_mapped_ram, false);
 
 	return err;
 }
diff --git a/arch/powerpc/platforms/8xx/Kconfig b/arch/powerpc/platforms/8xx/Kconfig
index c6cb0f3682ce..3e04329361fa 100644
--- a/arch/powerpc/platforms/8xx/Kconfig
+++ b/arch/powerpc/platforms/8xx/Kconfig
@@ -203,6 +203,13 @@ config PIN_TLB_IMMR
 	  CONFIG_PIN_TLB_DATA is also selected, it will reduce
 	  CONFIG_PIN_TLB_DATA to 24 Mbytes.
 
+config PIN_TLB_TEXT
+	bool "Pinned TLB for TEXT"
+	depends on PIN_TLB
+	default y
+	help
+	  This pins kernel text with 8M pages.
+
 endmenu
 
 endmenu
-- 
2.44.0


