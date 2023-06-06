Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AFD724454
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:26:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbB8716MHz3bkm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 23:26:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FlY3DSkf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=FlY3DSkf;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbB6S31Csz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 23:25:04 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-543c692db30so1607742a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 06:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686057900; x=1688649900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5Luu2+nAvmgg3QO8bS2xi4T814Sj2uZBDpgc+X3amI=;
        b=FlY3DSkfyPrX8M8LJrL4jsPOFYTQpp4boO332pt8tWrA7ekvDXk3MOQUcQQ7B+3OAB
         xdb5zR7AF2VsfIdOIdDR5Yh9sKYjXjZeALL/Alw+v2X5n1IHCNZF8VZLkeTiVVAeGmy9
         sAIhgHZkLMrh5g/j44N6GlN6qVtFXGHKkQEISyRQe0Q+eiNYIAPvpYXx4B2I1aEZVU8U
         oBbySe8WbrGgZhqYjdS1WvJkx+Y0mg8nAowso+BD/4mgNS+UJhIoe5Rb7/3mx3W19+CJ
         xePBUDzxO3Y7mZJ5bYg1MUVIfOZ8uT99Kjei5yj4IeHdqb3s7n2VLOVERMBwAY1LHncz
         HRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686057900; x=1688649900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5Luu2+nAvmgg3QO8bS2xi4T814Sj2uZBDpgc+X3amI=;
        b=bpOm8wEvxWxJlGXHSXht40/xB/8TXcOV27o+gw8fY/qYeyAA17yVFne84HhluozjjJ
         Ki6MeqZtjQNvLuVSKn22hixR827uptKNJFPjE5j8ZMxRxOgWHecZP09BlT/sVWOEtOaJ
         BNI+0V2KrsanUPMoOcYCFpzAgD9JThyuNCiD3W+jk4C8mCYiMYpGMpStEpFgVxbuC4+Y
         v4L2wzJPRaOLYiJLrO6xxU00YVSgmqD58I4gRRlVCPgeAp59aq69UA18FJ9u77YetZxa
         liCUJlI1fG79fjU9g0b3TshWkV1WGHkbFXLvWBqO90CGCY5N0abuhhjJSD1tVny4iQtr
         HRBg==
X-Gm-Message-State: AC+VfDwiZQIHI+g9W0fu8FrYH+/Azdy2u8FhmBmbgvfM3LeE/036d/2s
	sRomowSANtA50ceq45g0+psaW83/GwY=
X-Google-Smtp-Source: ACHHUZ4at0BG91OPbnl/JZOVHLYfeaae8aGDbHzhkwEwPahRtI9R5Ko931z+wG6x3POp4ZoJv3uUgg==
X-Received: by 2002:a17:902:a988:b0:1b2:fa8:d9c9 with SMTP id bh8-20020a170902a98800b001b20fa8d9c9mr1773797plb.49.1686057899777;
        Tue, 06 Jun 2023 06:24:59 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id jd18-20020a170903261200b001ac2c3e54adsm8522132plb.118.2023.06.06.06.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 06:24:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 1/6] powerpc/64s: move stack SLB pinning out of line from _switch
Date: Tue,  6 Jun 2023 23:24:42 +1000
Message-Id: <20230606132447.315714-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606132447.315714-1-npiggin@gmail.com>
References: <20230606132447.315714-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The large hunk of SLB pinning in _switch asm code makes it more
difficult to see everything else that's going on. It is a less important
path now, so icache and fetch footprint overhead can be avoided.

Move context switch stack SLB pinning out of line.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/entry_64.S | 113 ++++++++++++++++++---------------
 1 file changed, 62 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 1bf1121e17f1..2e02834c5824 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -105,6 +105,64 @@ flush_branch_caches:
 	.endr
 
 	blr
+
+#ifdef CONFIG_PPC_64S_HASH_MMU
+.balign 32
+/*
+ * New stack pointer in r8, old stack pointer in r1, must not clobber r3
+ */
+pin_stack_slb:
+BEGIN_FTR_SECTION
+	clrrdi	r6,r8,28	/* get its ESID */
+	clrrdi	r9,r1,28	/* get current sp ESID */
+FTR_SECTION_ELSE
+	clrrdi	r6,r8,40	/* get its 1T ESID */
+	clrrdi	r9,r1,40	/* get current sp 1T ESID */
+ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_1T_SEGMENT)
+	clrldi.	r0,r6,2		/* is new ESID c00000000? */
+	cmpd	cr1,r6,r9	/* or is new ESID the same as current ESID? */
+	cror	eq,4*cr1+eq,eq
+	beq	2f		/* if yes, don't slbie it */
+
+	/* Bolt in the new stack SLB entry */
+	ld	r7,KSP_VSID(r4)	/* Get new stack's VSID */
+	oris	r0,r6,(SLB_ESID_V)@h
+	ori	r0,r0,(SLB_NUM_BOLTED-1)@l
+BEGIN_FTR_SECTION
+	li	r9,MMU_SEGSIZE_1T	/* insert B field */
+	oris	r6,r6,(MMU_SEGSIZE_1T << SLBIE_SSIZE_SHIFT)@h
+	rldimi	r7,r9,SLB_VSID_SSIZE_SHIFT,0
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_1T_SEGMENT)
+
+	/* Update the last bolted SLB.  No write barriers are needed
+	 * here, provided we only update the current CPU's SLB shadow
+	 * buffer.
+	 */
+	ld	r9,PACA_SLBSHADOWPTR(r13)
+	li	r12,0
+	std	r12,SLBSHADOW_STACKESID(r9)	/* Clear ESID */
+	li	r12,SLBSHADOW_STACKVSID
+	STDX_BE	r7,r12,r9			/* Save VSID */
+	li	r12,SLBSHADOW_STACKESID
+	STDX_BE	r0,r12,r9			/* Save ESID */
+
+	/* No need to check for MMU_FTR_NO_SLBIE_B here, since when
+	 * we have 1TB segments, the only CPUs known to have the errata
+	 * only support less than 1TB of system memory and we'll never
+	 * actually hit this code path.
+	 */
+
+	isync
+	slbie	r6
+BEGIN_FTR_SECTION
+	slbie	r6		/* Workaround POWER5 < DD2.1 issue */
+END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
+	slbmte	r7,r0
+	isync
+2:	blr
+	.size pin_stack_slb,.-pin_stack_slb
+#endif /* CONFIG_PPC_64S_HASH_MMU */
+
 #else
 #define FLUSH_COUNT_CACHE
 #endif /* CONFIG_PPC_BOOK3S_64 */
@@ -182,59 +240,12 @@ _GLOBAL(_switch)
 #endif
 
 	ld	r8,KSP(r4)	/* new stack pointer */
+
 #ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
-	b	2f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
-BEGIN_FTR_SECTION
-	clrrdi	r6,r8,28	/* get its ESID */
-	clrrdi	r9,r1,28	/* get current sp ESID */
-FTR_SECTION_ELSE
-	clrrdi	r6,r8,40	/* get its 1T ESID */
-	clrrdi	r9,r1,40	/* get current sp 1T ESID */
-ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_1T_SEGMENT)
-	clrldi.	r0,r6,2		/* is new ESID c00000000? */
-	cmpd	cr1,r6,r9	/* or is new ESID the same as current ESID? */
-	cror	eq,4*cr1+eq,eq
-	beq	2f		/* if yes, don't slbie it */
-
-	/* Bolt in the new stack SLB entry */
-	ld	r7,KSP_VSID(r4)	/* Get new stack's VSID */
-	oris	r0,r6,(SLB_ESID_V)@h
-	ori	r0,r0,(SLB_NUM_BOLTED-1)@l
-BEGIN_FTR_SECTION
-	li	r9,MMU_SEGSIZE_1T	/* insert B field */
-	oris	r6,r6,(MMU_SEGSIZE_1T << SLBIE_SSIZE_SHIFT)@h
-	rldimi	r7,r9,SLB_VSID_SSIZE_SHIFT,0
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_1T_SEGMENT)
-
-	/* Update the last bolted SLB.  No write barriers are needed
-	 * here, provided we only update the current CPU's SLB shadow
-	 * buffer.
-	 */
-	ld	r9,PACA_SLBSHADOWPTR(r13)
-	li	r12,0
-	std	r12,SLBSHADOW_STACKESID(r9)	/* Clear ESID */
-	li	r12,SLBSHADOW_STACKVSID
-	STDX_BE	r7,r12,r9			/* Save VSID */
-	li	r12,SLBSHADOW_STACKESID
-	STDX_BE	r0,r12,r9			/* Save ESID */
-
-	/* No need to check for MMU_FTR_NO_SLBIE_B here, since when
-	 * we have 1TB segments, the only CPUs known to have the errata
-	 * only support less than 1TB of system memory and we'll never
-	 * actually hit this code path.
-	 */
-
-	isync
-	slbie	r6
-BEGIN_FTR_SECTION
-	slbie	r6		/* Workaround POWER5 < DD2.1 issue */
-END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
-	slbmte	r7,r0
-	isync
-2:
-#endif /* CONFIG_PPC_64S_HASH_MMU */
+	bl	pin_stack_slb
+END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
+#endif
 
 	clrrdi	r7, r8, THREAD_SHIFT	/* base of new stack */
 	/* Note: this uses SWITCH_FRAME_SIZE rather than INT_FRAME_SIZE
-- 
2.40.1

