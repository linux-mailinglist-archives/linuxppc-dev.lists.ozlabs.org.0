Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D513B5DF66
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 10:14:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dv5f1vh4zDq6q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 18:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="K0iFDuGy"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dthk4q8BzDqQV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2019 17:56:06 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id c13so796004pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 00:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PCs8eSgWybCHSB1nMZu06bU5YDzW3YpvI3lD71aJLwU=;
 b=K0iFDuGykkeIs8FseVDUqATgwzphxGFqMyhBuxCkG/OEt/0bk15or3kJqEvL8DjLAt
 2D9l6z5fDYSNIsCl81dHfF9zmekcY5xpm4NmSeAbj7xf6WsfJg6Mpq8ROVaivu63Hgfg
 MwBvVbeVsQNKGtnjTsqJhX55q4+ccb8RM5rzE+Zcin8Ab+Vi7zaeSW+YUdDe+RCJqIdV
 TjemsZjrBGh6bDwnyy/XH+M7zmdvYk7uO/iWr60yuQxAKIGm9PNor/zGpLalzBPN4a9Z
 WC9LopB5irMqvRXutwz7PDCCBoHV+nIH3HLUivNAQzN4KQJF0+xM2O2ozLiN9D0oG4QO
 fJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PCs8eSgWybCHSB1nMZu06bU5YDzW3YpvI3lD71aJLwU=;
 b=gO404BCq+NWuX4J3sYNmbgDG9dd9qv56HusgzYZq8jH6yqjsLsRZZlWrk92l9wGZbp
 zNe/UVk++aZljOVjJ0gUr2acyQNfD9mxiLCaKMFj65MQoI0FPh2ri12T1F7OGqvwNkc1
 wBZqKt7gaMp4Wuax9YfUCiQ5Bt1pNFslpDWde2qF7U/2b+ordvsskJ0qISzfCD9uRlqG
 y2xa3iQ26A0P5rGRtDIndAn6ii3vBIfQ2GA5wxJMJzVhmZ4oOU3kuNtjyYPVf0maHilY
 lb256hEWcWYxiDfdhiPw4Z9XZqD5NTByrd6VuXGG1UA0iKecTGuxBnSMyet+Abyweegc
 Dz2A==
X-Gm-Message-State: APjAAAXAYAm4ns0ZnCRvAXA2sQ3DYH00ZnuOf+LumomWA0jOCFxRDixY
 6WuE3+4cdgNaZqypH7U2gUesvGdA
X-Google-Smtp-Source: APXvYqyR4KQodI+aoRFBFvk9HoZeLQwkHAlvTAtOBqDMcr4t3qfHgYPcWqOpoVJfeb3bwkw1B4VwBQ==
X-Received: by 2002:a65:4348:: with SMTP id k8mr36371699pgq.219.1562140564397; 
 Wed, 03 Jul 2019 00:56:04 -0700 (PDT)
Received: from bobo.local0.net (193-116-88-34.tpgi.com.au. [193.116.88.34])
 by smtp.gmail.com with ESMTPSA id p68sm2955849pfb.80.2019.07.03.00.56.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 00:56:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/14] powerpc/64s/exception: machine check restructure to
 reuse common macros
Date: Wed,  3 Jul 2019 17:54:39 +1000
Message-Id: <20190703075444.19005-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703075444.19005-1-npiggin@gmail.com>
References: <20190703075444.19005-1-npiggin@gmail.com>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Follow the pattern of sreset and HMI handlers more closely: use
EXCEPTION_PROLOG_COMMON_1 rather than open-coding it, and run the
handler at the relocated location.

This helps later simplification and code sharing.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 71 ++++++++++++++--------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index ac7b5bb614d9..3cc5ee6e4b56 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -934,17 +934,23 @@ EXC_COMMON_BEGIN(system_reset_common)
 
 EXC_REAL_BEGIN(machine_check, 0x200, 0x100)
 	EXCEPTION_PROLOG_0 PACA_EXMC
-	b	machine_check_common_early
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
+	mfctr	r10			/* save ctr, even for !RELOCATABLE */
+	BRANCH_TO_C000(r11, machine_check_early_common)
+	/*
+	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
+	 * nested machine check corrupts it. machine_check_common enables
+	 * MSR_RI.
+	 */
 EXC_REAL_END(machine_check, 0x200, 0x100)
 EXC_VIRT_NONE(0x4200, 0x100)
-TRAMP_REAL_BEGIN(machine_check_common_early)
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 0, 0, 0
+
+EXC_COMMON_BEGIN(machine_check_early_common)
+	mtctr	r10			/* Restore ctr */
+	mfspr	r11,SPRN_SRR0
+	mfspr	r12,SPRN_SRR1
+
 	/*
-	 * Register contents:
-	 * R13		= PACA
-	 * R9		= CR
-	 * Original R9 to R13 is saved on PACA_EXMC
-	 *
 	 * Switch to mc_emergency stack and handle re-entrancy (we limit
 	 * the nested MCE upto level 4 to avoid stack overflow).
 	 * Save MCE registers srr1, srr0, dar and dsisr and then set ME=1
@@ -965,32 +971,30 @@ TRAMP_REAL_BEGIN(machine_check_common_early)
 	 * the machine check is handled then the idle wakeup code is called
 	 * to restore state.
 	 */
-	mr	r11,r1			/* Save r1 */
 	lhz	r10,PACA_IN_MCE(r13)
 	cmpwi	r10,0			/* Are we in nested machine check */
-	bne	0f			/* Yes, we are. */
-	/* First machine check entry */
-	ld	r1,PACAMCEMERGSP(r13)	/* Use MC emergency stack */
-0:	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
+	cmpwi	cr1,r10,MAX_MCE_DEPTH	/* Are we at maximum nesting */
 	addi	r10,r10,1		/* increment paca->in_mce */
 	sth	r10,PACA_IN_MCE(r13)
+
+	mr	r10,r1			/* Save r1 */
+	bne	1f
+	/* First machine check entry */
+	ld	r1,PACAMCEMERGSP(r13)	/* Use MC emergency stack */
+1:	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame */
 	/* Limit nested MCE to level 4 to avoid stack overflow */
-	cmpwi	r10,MAX_MCE_DEPTH
-	bgt	2f			/* Check if we hit limit of 4 */
-	std	r11,GPR1(r1)		/* Save r1 on the stack. */
-	std	r11,0(r1)		/* make stack chain pointer */
-	mfspr	r11,SPRN_SRR0		/* Save SRR0 */
-	std	r11,_NIP(r1)
-	mfspr	r11,SPRN_SRR1		/* Save SRR1 */
-	std	r11,_MSR(r1)
-	mfspr	r11,SPRN_DAR		/* Save DAR */
-	std	r11,_DAR(r1)
-	mfspr	r11,SPRN_DSISR		/* Save DSISR */
-	std	r11,_DSISR(r1)
-	std	r9,_CCR(r1)		/* Save CR in stackframe */
+	bge	cr1,2f			/* Check if we hit limit of 4 */
+
+	EXCEPTION_PROLOG_COMMON_1()
 	/* We don't touch AMR here, we never go to virtual mode */
-	/* Save r9 through r13 from EXMC save area to stack frame. */
 	EXCEPTION_PROLOG_COMMON_2(PACA_EXMC)
+	EXCEPTION_PROLOG_COMMON_3(0x200)
+
+	ld	r3,PACA_EXMC+EX_DAR(r13)
+	lwz	r4,PACA_EXMC+EX_DSISR(r13)
+	std	r3,_DAR(r1)
+	std	r4,_DSISR(r1)
+
 	mfmsr	r11			/* get MSR value */
 BEGIN_FTR_SECTION
 	ori	r11,r11,MSR_ME		/* turn on ME bit */
@@ -1016,8 +1020,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 
 #ifdef CONFIG_PPC_PSERIES
 TRAMP_REAL_BEGIN(machine_check_fwnmi)
+	/* See comment at machine_check exception, don't turn on RI */
 	EXCEPTION_PROLOG_0 PACA_EXMC
-	b	machine_check_common_early
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
+	mfctr	r10		/* save ctr */
+	BRANCH_TO_C000(r11, machine_check_early_common)
 #endif
 
 TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
@@ -1088,8 +1095,6 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	 * ME=1, MMU (IR=0 and DR=0) off and using MC emergency stack.
 	 */
 EXC_COMMON_BEGIN(machine_check_handle_early)
-	std	r0,GPR0(r1)	/* Save r0 */
-	EXCEPTION_PROLOG_COMMON_3(0x200)
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
@@ -1180,14 +1185,10 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_CFAR,r10
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	MACHINE_CHECK_HANDLER_WINDUP
+	/* See comment at machine_check exception, don't turn on RI */
 	EXCEPTION_PROLOG_0 PACA_EXMC
 	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
 	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
-	/*
-	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
-	 * nested machine check corrupts it. machine_check_common enables
-	 * MSR_RI.
-	 */
 
 EXC_COMMON_BEGIN(unrecover_mce)
 	/* Invoke machine_check_exception to print MCE event and panic. */
-- 
2.20.1

