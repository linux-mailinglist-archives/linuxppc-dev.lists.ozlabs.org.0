Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F42F6DB81C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 04:20:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ptf8s1M4mz3fgw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 12:20:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oUVD0o2B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oUVD0o2B;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptf6B2Pywz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 12:18:10 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id bg9so482543plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 19:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680920288; x=1683512288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWV2YzJkSdVhHH8yn695MrgwE31x1dFs+RHWpfsQ+HM=;
        b=oUVD0o2BKraOLnU1M2aVt007Fep2I5ZrdfPI97jvkSC/OP/WDGlB+LBk45h7JS/te5
         TafSpWW/9Ilj2YD91+H82o3m1WP0KJzlfMaYS1EBTYfLQyxqrMY+1K7lXMbGolNcvffb
         E8UY2b71eatIFFrvW0mCrk3MO1WHzcqKYAXOiAtgzU6awKp8cX+GRZLT7E6YafKAbU8d
         u102Up98pfVFfl4kZ2TPdL3K4eIax5J67Y1B+uEPyLzTt1BZEbhaljkUdilSBShdFGRi
         DlmJJGUlkYidMyAD+7F9Ll644jyeR8UyQ9c1QPH1T8hfIdXs9d5wcEyCVBp69KWTN5Sb
         oxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680920288; x=1683512288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWV2YzJkSdVhHH8yn695MrgwE31x1dFs+RHWpfsQ+HM=;
        b=K1wXsBUfZrDP9PDsK03VrpaM8Y2bgsIu2fOEvMg6H4WnJ07ZVUL/TGwANtY7YL3jgo
         eyEiyLGfZk2SpXuTrxerYGzneGV/buYjz+FFNgrrq4QfxCWex1j/LNWjvOWh2dx0CfUR
         F3dv0QlaLdrrILoXv4nLxcf/IGJ9vCMtRpULyi0VneYHb3VV/t+vUrAm+I+P1Sn9NhT7
         zY6AEx0qwGHKJUmGGHyZmZoM99AE7x6D/a4TKr7+VPXvkdfXqw0BeoVNGWAcVBK+X/Q5
         Jtxa0T026yxiWzr4JoALTqQTTuteo2BDHCBLPWzjDNjuo7ks525+KWjROaV/agq4lFhs
         MGWA==
X-Gm-Message-State: AAQBX9cSdlP7vV1dklKfGTzqPWPL5TnqarS6sEre8RHnnWDWMw2jOHt7
	6MWYoOjz5oi8gmBMw2vwDBHeIx1LYb3u/g==
X-Google-Smtp-Source: AKy350b22zyVMsb1yYBJJL9V6XIjuSZ8BsSu/Mq7hMA9TKDSGMQs8r/B3tVTX8DIL4NHX0IHIcbRnQ==
X-Received: by 2002:a17:90b:180e:b0:246:725e:cd42 with SMTP id lw14-20020a17090b180e00b00246725ecd42mr1172845pjb.21.1680920287917;
        Fri, 07 Apr 2023 19:18:07 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001a19f3a661esm3498577pln.138.2023.04.07.19.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 19:18:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/64s: Run at the kernel virtual address earlier in boot
Date: Sat,  8 Apr 2023 12:17:48 +1000
Message-Id: <20230408021752.862660-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230408021752.862660-1-npiggin@gmail.com>
References: <20230408021752.862660-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This mostly consolidates the Book3E and Book3S behaviour in boot WRT
executing from the physical or virtual address.

Book3E sets up kernel virtual linear map in start_initialization_book3e
and runs from the virtual linear alias after that. This change makes
Book3S begin to execute from the virtual alias at the same point. Book3S
can not use its MMU for that at this point, but when the MMU is disabled,
the virtual linear address correctly aliases to physical memory because
the top bits of the address are ignored with MMU disabled.

Secondaries execute from the virtual address similarly early.

This reduces the differences between subarchs, but the main motivation
was to enable the PC-relative addressing ABI for Book3S, where pointer
calculations must execute from the virtual address or the top bits of
the pointer will be lost. This is similar to the requirement the TOC
relative addressing already has that the TOC pointer use its virtual
address.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 82 +++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 5b2d607cd1e8..66c21061036b 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -76,6 +76,13 @@
  *   2. The kernel is entered at __start
  */
 
+/*
+ * boot_from_prom and prom_init run at the physical address. Everything
+ * after prom and kexec entry run at the virtual address (PAGE_OFFSET).
+ * Secondaries run at the virtual address from generic_secondary_common_init
+ * onward.
+ */
+
 OPEN_FIXED_SECTION(first_256B, 0x0, 0x100)
 USE_FIXED_SECTION(first_256B)
 	/*
@@ -303,13 +310,11 @@ _GLOBAL(fsl_secondary_thread_init)
 	/* turn on 64-bit mode */
 	bl	enable_64b_mode
 
-	/* get a valid TOC pointer, wherever we're mapped at */
-	bl	relative_toc
-	tovirt(r2,r2)
-
 	/* Book3E initialization */
 	mr	r3,r24
 	bl	book3e_secondary_thread_init
+	bl	relative_toc
+
 	b	generic_secondary_common_init
 
 #endif /* CONFIG_PPC_BOOK3E_64 */
@@ -331,16 +336,12 @@ _GLOBAL(generic_secondary_smp_init)
 	/* turn on 64-bit mode */
 	bl	enable_64b_mode
 
-	/* get a valid TOC pointer, wherever we're mapped at */
-	bl	relative_toc
-	tovirt(r2,r2)
-
 #ifdef CONFIG_PPC_BOOK3E_64
 	/* Book3E initialization */
 	mr	r3,r24
 	mr	r4,r25
 	bl	book3e_secondary_core_init
-
+	/* Now NIA and r2 are relocated to PAGE_OFFSET if not already */
 /*
  * After common core init has finished, check if the current thread is the
  * one we wanted to boot. If not, start the specified thread and stop the
@@ -378,6 +379,16 @@ _GLOBAL(generic_secondary_smp_init)
 10:
 	b	10b
 20:
+#else
+	/* Now the MMU is off, can branch to our PAGE_OFFSET address */
+	bcl	20,31,$+4
+1:	mflr	r11
+	addi	r11,r11,(2f - 1b)
+	tovirt(r11, r11)
+	mtctr	r11
+	bctr
+2:
+	bl	relative_toc
 #endif
 
 generic_secondary_common_init:
@@ -492,6 +503,8 @@ SYM_FUNC_START_LOCAL(start_initialization_book3s)
 	/* Switch off MMU if not already off */
 	bl	__mmu_off
 
+	/* Now the MMU is off, can return to our PAGE_OFFSET address */
+	tovirt(r25,r25)
 	mtlr	r25
 	blr
 SYM_FUNC_END(start_initialization_book3s)
@@ -531,16 +544,19 @@ __start_initialization_multiplatform:
 	mr	r29,r9
 #endif
 
+	/* These functions return to the virtual (PAGE_OFFSET) address */
 #ifdef CONFIG_PPC_BOOK3E_64
 	bl	start_initialization_book3e
 #else
 	bl	start_initialization_book3s
 #endif /* CONFIG_PPC_BOOK3E_64 */
 
-	/* Get TOC pointer */
+	/* Get TOC pointer, virtual */
 	bl	relative_toc
 
 	/* find out where we are now */
+
+	/* OPAL doesn't pass base address in r4, have to derive it. */
 	bcl	20,31,$+4
 0:	mflr	r26			/* r26 = runtime addr here */
 	addis	r26,r26,(_stext - 0b)@ha
@@ -551,7 +567,7 @@ __start_initialization_multiplatform:
 __REF
 __boot_from_prom:
 #ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
-	/* Get TOC pointer */
+	/* Get TOC pointer, non-virtual */
 	bl	relative_toc
 
 	/* find out where we are now */
@@ -600,18 +616,11 @@ __boot_from_prom:
 __after_prom_start:
 #ifdef CONFIG_RELOCATABLE
 	/* process relocations for the final address of the kernel */
-	lis	r25,PAGE_OFFSET@highest	/* compute virtual base of kernel */
-	sldi	r25,r25,32
-#if defined(CONFIG_PPC_BOOK3E_64)
-	tovirt(r26,r26)		/* on booke, we already run at PAGE_OFFSET */
-#endif
 	lwz	r7,(FIXED_SYMBOL_ABS_ADDR(__run_at_load))(r26)
-#if defined(CONFIG_PPC_BOOK3E_64)
-	tophys(r26,r26)
-#endif
 	cmplwi	cr0,r7,1	/* flagged to stay where we are ? */
-	bne	1f
-	add	r25,r25,r26
+	mr	r25,r26		/* then use current kernel base */
+	beq	1f
+	LOAD_REG_IMMEDIATE(r25, PAGE_OFFSET) /* else use static kernel base */
 1:	mr	r3,r25
 	bl	relocate
 #if defined(CONFIG_PPC_BOOK3E_64)
@@ -627,14 +636,8 @@ __after_prom_start:
  *
  * Note: This process overwrites the OF exception vectors.
  */
-	li	r3,0			/* target addr */
-#ifdef CONFIG_PPC_BOOK3E_64
-	tovirt(r3,r3)		/* on booke, we already run at PAGE_OFFSET */
-#endif
+	LOAD_REG_IMMEDIATE(r3, PAGE_OFFSET)
 	mr.	r4,r26			/* In some cases the loader may  */
-#if defined(CONFIG_PPC_BOOK3E_64)
-	tovirt(r4,r4)
-#endif
 	beq	9f			/* have already put us at zero */
 	li	r6,0x100		/* Start offset, the first 0x100 */
 					/* bytes were copied earlier.	 */
@@ -645,9 +648,6 @@ __after_prom_start:
  * variable __run_at_load, if it is set the kernel is treated as relocatable
  * kernel, otherwise it will be moved to PHYSICAL_START
  */
-#if defined(CONFIG_PPC_BOOK3E_64)
-	tovirt(r26,r26)		/* on booke, we already run at PAGE_OFFSET */
-#endif
 	lwz	r7,(FIXED_SYMBOL_ABS_ADDR(__run_at_load))(r26)
 	cmplwi	cr0,r7,1
 	bne	3f
@@ -766,9 +766,15 @@ _GLOBAL(pmac_secondary_start)
 	sync
 	slbia
 
-	/* get TOC pointer (real address) */
+	/* Branch to our PAGE_OFFSET address */
+	bcl	20,31,$+4
+1:	mflr	r11
+	addi	r11,r11,(2f - 1b)
+	tovirt(r11, r11)
+	mtctr	r11
+	bctr
+2:
 	bl	relative_toc
-	tovirt(r2,r2)
 
 	/* Copy some CPU settings from CPU 0 */
 	bl	__restore_cpu_ppc970
@@ -907,8 +913,9 @@ SYM_FUNC_END(enable_64b_mode)
  * TOC in -mcmodel=medium mode. After we relocate to 0 but before
  * the MMU is on we need our TOC to be a virtual address otherwise
  * these pointers will be real addresses which may get stored and
- * accessed later with the MMU on. We use tovirt() at the call
- * sites to handle this.
+ * accessed later with the MMU on. We branch to the virtual address
+ * while still in real mode then call relative_toc again to handle
+ * this.
  */
 _GLOBAL(relative_toc)
 	mflr	r0
@@ -927,9 +934,8 @@ p_toc:	.8byte	.TOC. - 0b
  */
 __REF
 start_here_multiplatform:
-	/* set up the TOC */
-	bl      relative_toc
-	tovirt(r2,r2)
+	/* Adjust TOC for moved kernel. Could adjust when moving it instead. */
+	bl	relative_toc
 
 	/* Clear out the BSS. It may have been done in prom_init,
 	 * already but that's irrelevant since prom_init will soon
-- 
2.40.0

