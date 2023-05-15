Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F16702306
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 06:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKRgW0NJ0z3cdd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 14:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rPhaKQ4u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rPhaKQ4u;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKRdf08PQz3cMR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 14:45:57 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1ab14cb3aaeso87146125ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 21:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684125954; x=1686717954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbR3bSplzyYLP3yJva1VXv65s98TbF9LdLBzE9tcc6I=;
        b=rPhaKQ4uwHtwgUm3GBOVc1PFP0Qg2qF5GNxJ0Tp6V2jRBL3CvgdbWEl9H9tcJVQkGn
         QtqN4hjvk9kSO+LHgqDV6j6dxnQCChJtQW2xviIMAntC6EnhnqoB4iMdR6eBJxl+IyVu
         y2Y48ttkHAXOF/o2X9SqBFCCnGLdm8y33+aZDvILQK7pN7GVKGWqm77J4nnVnmeP5SG9
         Uxe8EYZ86tWZKOctDsZAA0oeg7lQjs6Xg5Bo+XS7MuzzKvBzH7TYWw8gAhs92IBCWE6Z
         Xam9HnedSnA4ZrlBH9kre3CZkTx2firu+24GrrYQoN6Zv4CKaaEblXFzOjWXeSn87qVZ
         kZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684125954; x=1686717954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbR3bSplzyYLP3yJva1VXv65s98TbF9LdLBzE9tcc6I=;
        b=XgRKwFyDsO5mMSLr6dz6Fi+MvqoS1N4k8SdIIiV+KEOYiQiPKlP/8C4YOA+S4GA8D6
         SsE26V8xuo1hyPE54wzdv10mUG4TYeSoZeU1+1Rqbcb7ch9Wf7JaN/OXyB+hRiw99uGO
         jXAnpp5XffSlQ4/PB+ladi3Qdn6SrO8Td5k4vfsHJD5E0TpdcIE5HliqoDqFXh6T7sTy
         LmTc0xy5IOfXiClGl3lq8NAsJJUYonewqhtyaGz3cM+nt1LJjUCdE6qcNimFEgVmuQ/o
         6Q2HdIPbybhJt+/2Dp9OcCT4fJ8lWoteZrciVidcRlXzyrEfH4iIO4JvYnur8sSPGURK
         Ji3w==
X-Gm-Message-State: AC+VfDz0VocQuQb8e2hf3FynOcq6mc2chX+dKQxdUTEHfowPnNJheAbo
	jBBlyjGcctkFHumcre2SL7tUgQ36yRPQ0Q==
X-Google-Smtp-Source: ACHHUZ4GBeNtMDnK8JtqdUSYYr0A+uhI5t10Gso7+0pVI7eve1ZbhtfSOFP7eimSr1SNmqOwy7azgA==
X-Received: by 2002:a17:902:cec9:b0:1a6:dba5:2e60 with SMTP id d9-20020a170902cec900b001a6dba52e60mr42977247plg.25.1684125954495;
        Sun, 14 May 2023 21:45:54 -0700 (PDT)
Received: from wheely.local0.net ([1.146.102.8])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001a64851087bsm2514018plh.272.2023.05.14.21.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 21:45:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/6] powerpc/64s: move stack SLB pinning out of line from _switch
Date: Mon, 15 May 2023 14:45:38 +1000
Message-Id: <20230515044543.78903-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515044543.78903-1-npiggin@gmail.com>
References: <20230515044543.78903-1-npiggin@gmail.com>
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
difficult to see everything else that's going on. Also the code
footprint of the increasingly less important path is likely to
take up icache footprint and fetch.

Move it out of line.

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

