Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2E16C8E7E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 14:27:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkKcj0tJWz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 00:27:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=csdkjtez;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=csdkjtez;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkKYs38kxz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 00:24:49 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso7582376pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679750687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY/X7w2UVp4vpGmbsJ01sfUEHhI2p4xepSvf4l4W4mg=;
        b=csdkjtezn93LYROxm2sL0cPt7aV2L9FNk9LsL1WaSTWiE2MijoG+upmM3fJM3Exo/o
         ctpWeXuLDhkmWI/rpa3zF1CLteHM7NmmCNyCJgbvQZP2LGKx71h54nRniyGDd3F/j9a7
         eFc0AEZ0DbC0W2bonCGqZGvHZgB4b9xb68VJvpt130iNf9TCUk13FGmnPclCmML8007W
         2FRWLTuqBc7/TCDBP1mIbgcmSWlQopdmp2E4OSkyjZIAPTokrdVpZ97/Pf4VCfgLa/G/
         4WVsulTWyGj0YiXv2CmqwKzIlses3GygNZDWHnyExHpVNz/ZP9i5/t/r8kQLUsQuY/fL
         LECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679750687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DY/X7w2UVp4vpGmbsJ01sfUEHhI2p4xepSvf4l4W4mg=;
        b=iAOiOp9E6y16N96oWomo0fmULKHxCRFA1S8IVqxSjzNtOO/s0PHRdVGHVLYAv1160d
         Y2coRthfAejVojpCaXZA7a9o6478a0MoYxqT73tyOCQ56xlyxNgJ9JD4XXVQNXUNw9Tw
         ogvISMsbgvS7CD2kMdL14vSaswVZNCux1YyCBx3fKroMINxW+uHhLa1X6bQWqo0Og2OK
         mbyNMlmUq20qmOC/DDUn/NWeVhxmclm+nV6begHxfk+MYwM7DZ37ULXK2+nuLsmWsDey
         ZxL7U+KF31wIpFtcaDXVxm2jO+HuMbSWQIR+iNZO/wbQGENvzgFlYpoF+IpXxeZ3KKlT
         q6uQ==
X-Gm-Message-State: AAQBX9f8ZQH+eK1AEU0uB8ZKmlaRYcVADXj+7GeHQfsOwNJa5V/2iIjr
	2SOkpowMWRf7luBtHl0r89VxvMuepjU=
X-Google-Smtp-Source: AKy350ab48BGErP5kIj5F+m02fGLGREGMRMypvoLU4l8W0iG1JJjB0XBkFOnIb1J8j9fnsBNwOWlkA==
X-Received: by 2002:a17:902:d04b:b0:1a1:bd50:a9e with SMTP id l11-20020a170902d04b00b001a1bd500a9emr4547757pll.47.1679750686727;
        Sat, 25 Mar 2023 06:24:46 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id k2-20020a170902e90200b0019c919bccf8sm16001552pld.86.2023.03.25.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 06:24:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] powerpc/64s: Run at the kernel virtual address earlier in boot
Date: Sat, 25 Mar 2023 23:24:35 +1000
Message-Id: <20230325132435.2459170-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230325132435.2459170-1-npiggin@gmail.com>
References: <20230325132435.2459170-1-npiggin@gmail.com>
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
2.37.2

