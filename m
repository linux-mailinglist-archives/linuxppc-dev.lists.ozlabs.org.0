Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2C14C7B5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 08:55:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tsyh5Ll6zDr02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 16:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="E37e9LqB"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqms6ysXzDqvw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:16:45 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c14so895178plo.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PBZr6UKLR5QR4Zyo5ewuKGh3k8AVHIfVNzUFjZ9kavc=;
 b=E37e9LqBkDcBNtR8ju7LERbgPFY64nldlu5vxhv81iOAwI61epHbFyXGnIp/qMS2Fi
 euEFDfVgrgHDSXjmZbmCpfL8BrIcCL4MIglktA89adNj679/EGaBvaAo7UFA5kll83w3
 eHoO86vUNjcpja5p8tJ1CBhBvAT8rx1WmySsoiqvFhUEW85uZurt/lsnZGW17VX7VWTy
 dxSs789XBpZmQHoZbF+Rr9q2BX2JCxdc/mpjsrzVyrGpJg0hjAqyG8FR39Hoz0q1J1PC
 TduXByT00TBwLzezHDWrx86/M4teAviTMNftGJa6kPgoJuEMrGK4xoHIEqMLdqFF8I0I
 Z0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PBZr6UKLR5QR4Zyo5ewuKGh3k8AVHIfVNzUFjZ9kavc=;
 b=PL+fnj24hWl509y3n8+MCeqVbII1un+vP9ECQi27MhTruh9Nn73GuUi+Iu7Xn+/xxJ
 fxiHyH97cybMQ8P68P+Qi4m2yco3IBeyuW0e4/1I8GC4xbG36ny+MYMEdKq213I6iT5B
 9cMte1r0+dCeIi18UJMxdJKMuHZiioDVkxDwK+l6FmWPpwuFw2vGitHhwW5+wiMfloy8
 yVsJfV1D+1mbBQRFm3UFMmXOwHgozkQhb6xbGy4HZgwcxiDl4tw0P5vlFvpizjGn/q1K
 BoCEr28nEXS7+Fx4s3+U6RoYHDk/fHiP7yj6Dej5H3mT/Om8rrEUTjNmD+zs/ditA5Im
 Pqkg==
X-Gm-Message-State: APjAAAXLw2zQa9t/qGmtbhvHmoR9nXPoJcZqmGnJZq+GAMFzNcWwwBaM
 75ufmRmy2zHubRu1ZDbopbZByvH6
X-Google-Smtp-Source: APXvYqxzv4ZblAtmFvydJNfF4cw3r2ism4HWMidiNwvtyJwyUDgak2wThQ5AE3qvdR6buvQUkZi1pg==
X-Received: by 2002:a17:902:205:: with SMTP id
 5mr114955719plc.165.1561007802781; 
 Wed, 19 Jun 2019 22:16:42 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.16.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:16:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 47/52] powerpc/64s/exception: machine check restructure
 handler to be more regular
Date: Thu, 20 Jun 2019 15:14:54 +1000
Message-Id: <20190620051459.29573-48-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190620051459.29573-1-npiggin@gmail.com>
References: <20190620051459.29573-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Follow the pattern of sreset and HMI handlers more closely, in using
EXCEPTION_PROLOG_COMMON_1 rather than open-coding it. Run the handler
at the relocated location.

This will help with simplification and code sharing.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 86 ++++++++++++++--------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8ed787dc579c..384f591ef078 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -958,17 +958,34 @@ BEGIN_FTR_SECTION
 	b	machine_check_pseries
 END_FTR_SECTION_IFCLR(CPU_FTR_HVMODE)
 #endif
-	b	machine_check_common_early
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 0, 0x200, 1, 1, 0
+	mfctr	r10		/* save ctr */
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
+#ifdef CONFIG_PPC_PSERIES
+TRAMP_REAL_BEGIN(machine_check_fwnmi)
+	/* See comment at machine_check exception, don't turn on RI */
+	EXCEPTION_PROLOG_0 PACA_EXMC
+machine_check_pseries:
+	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
+	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
+#endif
+
+TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
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
@@ -989,32 +1006,30 @@ TRAMP_REAL_BEGIN(machine_check_common_early)
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
 	ori	r11,r11,MSR_ME|MSR_RI	/* turn on ME, RI */
 	LOAD_HANDLER(r12, machine_check_handle_early)
@@ -1035,21 +1050,6 @@ TRAMP_REAL_BEGIN(machine_check_common_early)
 	b	1b
 	b	.	/* prevent speculative execution */
 
-#ifdef CONFIG_PPC_PSERIES
-TRAMP_REAL_BEGIN(machine_check_fwnmi)
-	EXCEPTION_PROLOG_0 PACA_EXMC
-machine_check_pseries:
-	EXCEPTION_PROLOG_1 EXC_STD, PACA_EXMC, 1, 0x200, 1, 1, 0
-	EXCEPTION_PROLOG_2_REAL machine_check_common, EXC_STD, 0
-	/*
-	 * MSR_RI is not enabled, because PACA_EXMC is being used, so a
-	 * nested machine check corrupts it. machine_check_common enables
-	 * MSR_RI.
-	 */
-#endif
-
-TRAMP_KVM_SKIP(PACA_EXMC, 0x200)
-
 EXC_COMMON_BEGIN(machine_check_common)
 	/*
 	 * Machine check is different because we use a different
@@ -1116,8 +1116,6 @@ EXC_COMMON_BEGIN(machine_check_idle_common)
 	 * ME=1, MMU (IR=0 and DR=0) off and using MC emergency stack.
 	 */
 EXC_COMMON_BEGIN(machine_check_handle_early)
-	std	r0,GPR0(r1)	/* Save r0 */
-	EXCEPTION_PROLOG_COMMON_3(0x200)
 	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_early
-- 
2.20.1

