Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C928264A73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2019 18:05:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kPDZ1dt5zDqpy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 02:05:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="faVomjO9"; 
 dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kNHb0y2mzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 01:23:22 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id b7so1408212pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2019 08:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s4SmQ6O7Ul+0V5pEPZadNSvis52cy2Vc0rTotcGREWI=;
 b=faVomjO9xrOiaN2qhxTVXLmsFpd/0gIt5v1QLI7+TyCUY2dUz0+jy8tMhro4yoDO3P
 RzN7pyj5KYgSwI9mJrvV8NQ7VXryH6Ci07FdFok6pkl6w5TANxaenyijaSj4TBt/QwUc
 IlGdlfHIzMP+/vV+VTILBHFT9PTB4y7+pZmKFMr0ZQibUZV+4eqHFsOhGW9QEFoybopH
 HOCVFj9DEdCwTBsZBsuz/r4sdUfafK7/5wBQs38YasD1E4YxwRVAFatT5IE7vbAB2+pT
 ktB5Yq1wrYHFE/P7Dq7QkxGD4Ozv2bmvVfL+eBQzVI9PxlHEvJKGgMrjqfkJsaOMzGeu
 AUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s4SmQ6O7Ul+0V5pEPZadNSvis52cy2Vc0rTotcGREWI=;
 b=rG6sz2pcR3mHZ2oXGIfQRgjaSrhHKTajOIimGkO6MBqNqSoG9t62+tOVCGw1rwMJdu
 baxdDQ4+pvpbYBj5tGnJNAe7EyTei0mfpITqaEFD3MondXjpR6zyCElD5AEmAGW7cUmY
 B3YEMhOOHNRipEkMHLOQfOoq8hUSEFEB8wqmTqnBo+J0NNiYCi4C09o85dJJ/nhzSHrZ
 47n4NTrvVR126OPaDD/LSpElylVXVJbS9qmHwV6L/4IGiitYFy0pyQA5MhRY5ednri+P
 QkqWH9KyLCiq4cQy9NupGtJJMAUavGr/m6HRgEhieHhByoGsRRwCZSjyYgQwi13NVMLZ
 vY2w==
X-Gm-Message-State: APjAAAUmme3vY2JFJ5+sJ8PeOThDMQ+bnXH3zUyJpyhYm4gvkD/z++9Q
 sOfjPYpH8+qYXQCC37F82CrrTGSQvhE=
X-Google-Smtp-Source: APXvYqw8KPoOnEE3tEq2RwtnLGwV0gg5NIBl3l7x5PUTpLqMR3YcYG+ys2r0lZzuLsK/RhfwDCTYFw==
X-Received: by 2002:a17:902:583:: with SMTP id
 f3mr39354603plf.137.1562772200201; 
 Wed, 10 Jul 2019 08:23:20 -0700 (PDT)
Received: from bobo.local0.net (14-203-207-157.tpgi.com.au. [14.203.207.157])
 by smtp.gmail.com with ESMTPSA id
 s22sm2699212pfh.107.2019.07.10.08.23.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 08:23:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/16] powerpc/64s/exception: machine check move
 unrecoverable handling out of line
Date: Thu, 11 Jul 2019 01:19:48 +1000
Message-Id: <20190710151950.31906-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190710151950.31906-1-npiggin@gmail.com>
References: <20190710151950.31906-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Aravinda Prasad <aravinda@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similarly to the previous change, all callers of the unrecoverable
handler run relocated so can reach it with a direct branch. This makes
it easy to move out of line, which makes the "normal" path less
cluttered and easier to follow.

MSR[ME] manipulation still requires the rfi, so that is moved out of
line to its own function.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 87 ++++++++++++++--------------
 1 file changed, 44 insertions(+), 43 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 2a17275296d5..95dd7ff3ef04 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -992,9 +992,9 @@ EXC_COMMON_BEGIN(machine_check_early_common)
 	bne	1f
 	/* First machine check entry */
 	ld	r1,PACAMCEMERGSP(r13)	/* Use MC emergency stack */
-1:	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
-	/* Limit nested MCE to level 4 to avoid stack overflow */
-	bge	cr1,2f			/* Check if we hit limit of 4 */
+1:	/* Limit nested MCE to level 4 to avoid stack overflow */
+	bgt	cr1,unrecoverable_mce	/* Check if we hit limit of 4 */
+	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
 
 	EXCEPTION_PROLOG_COMMON_1()
 	/* We don't touch AMR here, we never go to virtual mode */
@@ -1013,21 +1013,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	mtmsrd	r10,1
 	b	machine_check_handle_early
 
-2:
-	/* Stack overflow. Stay on emergency stack and panic.
-	 * Keep the ME bit off while panic-ing, so that if we hit
-	 * another machine check we checkstop.
-	 */
-	addi	r1,r1,INT_FRAME_SIZE	/* go back to previous stack frame */
-	ld	r11,PACAKMSR(r13)
-	LOAD_HANDLER(r12, unrecover_mce)
-	li	r10,MSR_ME
-	andc	r11,r11,r10		/* Turn off MSR_ME */
-	mtspr	SPRN_SRR0,r12
-	mtspr	SPRN_SRR1,r11
-	RFI_TO_KERNEL
-	b	.	/* prevent speculative execution */
-
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
 	 * Machine check is different because we use a different
@@ -1141,32 +1126,15 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 * If yes, then stay on emergency stack and panic.
 	 */
 	andi.	r11,r12,MSR_RI
-	bne	2f
-1:	mfspr	r11,SPRN_SRR0
-	LOAD_HANDLER(r10,unrecover_mce)
-	mtspr	SPRN_SRR0,r10
-	ld	r10,PACAKMSR(r13)
-	/*
-	 * We are going down. But there are chances that we might get hit by
-	 * another MCE during panic path and we may run into unstable state
-	 * with no way out. Hence, turn ME bit off while going down, so that
-	 * when another MCE is hit during panic path, system will checkstop
-	 * and hypervisor will get restarted cleanly by SP.
-	 */
-	li	r3,MSR_ME
-	andc	r10,r10,r3		/* Turn off MSR_ME */
-	mtspr	SPRN_SRR1,r10
-	RFI_TO_KERNEL
-	b	.
-2:
+	beq	unrecoverable_mce
+
 	/*
 	 * Check if we have successfully handled/recovered from error, if not
 	 * then stay on emergency stack and panic.
 	 */
 	ld	r3,RESULT(r1)	/* Load result */
 	cmpdi	r3,0		/* see if we handled MCE successfully */
-
-	beq	1b		/* if !handled then panic */
+	beq	unrecoverable_mce /* if !handled then panic */
 
 	/*
 	 * Return from MC interrupt.
@@ -1189,17 +1157,35 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
 	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
 
-EXC_COMMON_BEGIN(unrecover_mce)
+EXC_COMMON_BEGIN(unrecoverable_mce)
+	/*
+	 * We are going down. But there are chances that we might get hit by
+	 * another MCE during panic path and we may run into unstable state
+	 * with no way out. Hence, turn ME bit off while going down, so that
+	 * when another MCE is hit during panic path, system will checkstop
+	 * and hypervisor will get restarted cleanly by SP.
+	 */
+BEGIN_FTR_SECTION
+	li	r10,0 /* clear MSR_RI */
+	mtmsrd	r10,1
+	bl	disable_machine_check
+END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
+	ld	r10,PACAKMSR(r13)
+	li	r3,MSR_ME
+	andc	r10,r10,r3
+	mtmsrd	r10
+
 	/* Invoke machine_check_exception to print MCE event and panic. */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_exception
+
 	/*
-	 * We will not reach here. Even if we did, there is no way out. Call
-	 * unrecoverable_exception and die.
+	 * We will not reach here. Even if we did, there is no way out.
+	 * Call unrecoverable_exception and die.
 	 */
-1:	addi	r3,r1,STACK_FRAME_OVERHEAD
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unrecoverable_exception
-	b	1b
+	b	.
 
 
 EXC_REAL_BEGIN(data_access, 0x300, 0x80)
@@ -2283,6 +2269,21 @@ enable_machine_check:
 1:	mtlr	r0
 	blr
 
+/* MSR[RI] should be clear because this uses SRR[01] */
+disable_machine_check:
+	mflr	r0
+	bcl	20,31,$+4
+0:	mflr	r3
+	addi	r3,r3,(1f - 0b)
+	mtspr	SPRN_SRR0,r3
+	mfmsr	r3
+	li	r4,MSR_ME
+	andc	r3,r3,r4
+	mtspr	SPRN_SRR1,r3
+	RFI_TO_KERNEL
+1:	mtlr	r0
+	blr
+
 /*
  * Hash table stuff
  */
-- 
2.20.1

