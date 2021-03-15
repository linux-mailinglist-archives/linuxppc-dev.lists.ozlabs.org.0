Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EFC33A9DF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:18:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzM8116BZz3dJZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:18:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SXeBKIJ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SXeBKIJ/; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM6j6MHQz2xb6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:33 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id 18so5706469pfo.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CuJ6ZpofNVoD/Z+R+A2lb4OwSdofcRT/Uaob3XZUfMo=;
 b=SXeBKIJ/3OPQKLgLvRjn4mvESoL4N+duyNJZlTa+IkL4IT9vtZCQ3uxIltSxjnyAWs
 x698J7vcE+Y3L7vjqDZXcKAtQCSScpC4G1l+RkCaKzcfuXZCoqIek9T4pKjoT92tzxag
 0I9CPYzip5d0wJEZc9aeQr6HOAMd5n1rMQxNX45IVgVpe9oc24lTKjWPesTP0QU1oP/R
 yYS9sY5VuKFM0ofMRLZZdJbBAdeFnqycASsikGrcg3A+zxwOigN392vgVs/gUOLflVwB
 mz2pCw8Q5rSTIaSva/wgULeWZMG/kslxek6bkCqDF2vmlhg5DJ5eJzKtQE9RIOo5M8JK
 HlNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CuJ6ZpofNVoD/Z+R+A2lb4OwSdofcRT/Uaob3XZUfMo=;
 b=aLbygu+AqKefWmkEoR1BeG1Mpb4Lz5GCExmwn234lJv4k+sMV0VNWHrQsJPD8RY/c4
 ek4YxthbsulX6HHdYRNDQXEHPvqJmk1FS7tLZq+gRX7kbm9M+wjKu09yEdKno9lvugRh
 bLe/WEOTcePIdBrXwt5piFqu2+pwhczPnPUEygjmiQfMB63Zbcww/4w8BsYQWVCx2iwt
 lE/l81kx5yb8H6CF9m9/auuqaXuv8NhWETZdv4Lz6ZaWmth76QnoLz1MYXR8IkebouQM
 woNfod1SVK+Ma5pfqYO/Ika7n2B88Me7uGLjcQ04SPfy+4FPb7yhC/f3roSDsnCIiHiB
 Mejg==
X-Gm-Message-State: AOAM532M3m3go1Ab4BifMpwLvTPLtAeExPQ783RFUPCsP5atdFthf9P3
 GpY46/adL3ignM7TWYhInkGFCVSHQqU=
X-Google-Smtp-Source: ABdhPJyeOLWXFaYx8gQ707k/r0ZjvYtzKlfIwLnjfTuceHbfdXhWxVCnIJZ9Ux6sLoaHhmbDa5V7og==
X-Received: by 2002:a65:47cc:: with SMTP id f12mr21113489pgs.305.1615778251039; 
 Sun, 14 Mar 2021 20:17:31 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 02/10] powerpc/64e/interrupt: always save nvgprs on interrupt
Date: Mon, 15 Mar 2021 13:17:08 +1000
Message-Id: <20210315031716.3940350-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to use the C interrupt return, nvgprs must always be saved.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h    |  9 +--------
 arch/powerpc/kernel/entry_64.S       | 13 -------------
 arch/powerpc/kernel/exceptions-64e.S | 27 +++------------------------
 3 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 1aca5fe79285..c5b3669918f4 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -186,18 +186,11 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 	((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_SIZE) - 1)
 
 #ifdef __powerpc64__
-#ifdef CONFIG_PPC_BOOK3S
 #define TRAP_FLAGS_MASK		0x10
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #define FULL_REGS(regs)		true
 #define SET_FULL_REGS(regs)	do { } while (0)
-#else
-#define TRAP_FLAGS_MASK		0x11
-#define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
-#define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
-#define SET_FULL_REGS(regs)	((regs)->trap &= ~1)
-#endif
-#define CHECK_FULL_REGS(regs)	BUG_ON(!FULL_REGS(regs))
+#define CHECK_FULL_REGS(regs)	do { } while (0)
 #define NV_REG_POISON		0xdeadbeefdeadbeefUL
 #else
 /*
diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
index 6c4d9e276c4d..853534b2ae2e 100644
--- a/arch/powerpc/kernel/entry_64.S
+++ b/arch/powerpc/kernel/entry_64.S
@@ -417,19 +417,6 @@ _GLOBAL(ret_from_kernel_thread)
 	li	r3,0
 	b	.Lsyscall_exit
 
-#ifdef CONFIG_PPC_BOOK3E
-/* Save non-volatile GPRs, if not already saved. */
-_GLOBAL(save_nvgprs)
-	ld	r11,_TRAP(r1)
-	andi.	r0,r11,1
-	beqlr-
-	SAVE_NVGPRS(r1)
-	clrrdi	r0,r11,1
-	std	r0,_TRAP(r1)
-	blr
-_ASM_NOKPROBE_SYMBOL(save_nvgprs);
-#endif
-
 #ifdef CONFIG_PPC_BOOK3S_64
 
 #define FLUSH_COUNT_CACHE	\
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index e8eb9992a270..da78eb6ab92f 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -417,14 +417,15 @@ exc_##n##_common:							    \
 	std	r6,_LINK(r1);						    \
 	std	r7,_CTR(r1);						    \
 	std	r8,_XER(r1);						    \
-	li	r3,(n)+1;		/* indicate partial regs in trap */ \
+	li	r3,(n);			/* indicate partial regs in trap */ \
 	std	r9,0(r1);		/* store stack frame back link */   \
 	std	r10,_CCR(r1);		/* store orig CR in stackframe */   \
 	std	r9,GPR1(r1);		/* store stack frame back link */   \
 	std	r11,SOFTE(r1);		/* and save it to stackframe */     \
 	std	r12,STACK_FRAME_OVERHEAD-16(r1); /* mark the frame */	    \
 	std	r3,_TRAP(r1);		/* set trap number		*/  \
-	std	r0,RESULT(r1);		/* clear regs->result */
+	std	r0,RESULT(r1);		/* clear regs->result */	    \
+	SAVE_NVGPRS(r1);
 
 #define EXCEPTION_COMMON(n) \
 	EXCEPTION_COMMON_LVL(n, SPRN_SPRG_GEN_SCRATCH, PACA_EXGEN)
@@ -561,7 +562,6 @@ __end_interrupts:
 	CRIT_EXCEPTION_PROLOG(0x100, BOOKE_INTERRUPT_CRITICAL,
 			      PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON_CRIT(0x100)
-	bl	save_nvgprs
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -573,7 +573,6 @@ __end_interrupts:
 	MC_EXCEPTION_PROLOG(0x000, BOOKE_INTERRUPT_MACHINE_CHECK,
 			    PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON_MC(0x000)
-	bl	save_nvgprs
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -623,7 +622,6 @@ __end_interrupts:
 	std	r14,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
-	bl	save_nvgprs
 	bl	program_check_exception
 	b	ret_from_except
 
@@ -639,7 +637,6 @@ __end_interrupts:
 	bl	load_up_fpu
 	b	fast_exception_return
 1:	INTS_DISABLE
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	kernel_fp_unavailable_exception
 	b	ret_from_except
@@ -661,7 +658,6 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
 	INTS_DISABLE
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	altivec_unavailable_exception
 	b	ret_from_except
@@ -673,7 +669,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x220)
 	INTS_DISABLE
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
 BEGIN_FTR_SECTION
@@ -698,7 +693,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	CRIT_EXCEPTION_PROLOG(0x9f0, BOOKE_INTERRUPT_WATCHDOG,
 			      PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON_CRIT(0x9f0)
-	bl	save_nvgprs
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -723,7 +717,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 				PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0xf20)
 	INTS_DISABLE
-	bl	save_nvgprs
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	unknown_exception
 	b	ret_from_except
@@ -792,7 +785,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXCRIT+EX_R14(r13)
 	ld	r15,PACA_EXCRIT+EX_R15(r13)
-	bl	save_nvgprs
 	bl	DebugException
 	b	ret_from_except
 
@@ -864,7 +856,6 @@ kernel_dbg_exc:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXDBG+EX_R14(r13)
 	ld	r15,PACA_EXDBG+EX_R15(r13)
-	bl	save_nvgprs
 	bl	DebugException
 	b	ret_from_except
 
@@ -887,7 +878,6 @@ kernel_dbg_exc:
 	CRIT_EXCEPTION_PROLOG(0x2a0, BOOKE_INTERRUPT_DOORBELL_CRITICAL,
 			      PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON_CRIT(0x2a0)
-	bl	save_nvgprs
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -903,7 +893,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x2c0)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	save_nvgprs
 	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	ret_from_except
@@ -913,7 +902,6 @@ kernel_dbg_exc:
 	CRIT_EXCEPTION_PROLOG(0x2e0, BOOKE_INTERRUPT_GUEST_DBELL_CRIT,
 			      PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON_CRIT(0x2e0)
-	bl	save_nvgprs
 	bl	special_reg_save
 	CHECK_NAPPING();
 	addi	r3,r1,STACK_FRAME_OVERHEAD
@@ -926,7 +914,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x310)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	save_nvgprs
 	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	ret_from_except
@@ -937,7 +924,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x320)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	save_nvgprs
 	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	ret_from_except
@@ -948,7 +934,6 @@ kernel_dbg_exc:
 			        PROLOG_ADDITION_NONE)
 	EXCEPTION_COMMON(0x340)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	save_nvgprs
 	INTS_RESTORE_HARD
 	bl	unknown_exception
 	b	ret_from_except
@@ -1014,7 +999,6 @@ storage_fault_common:
 	cmpdi	r3,0
 	bne-	1f
 	b	ret_from_except_lite
-1:	bl	save_nvgprs
 	mr	r4,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	__bad_page_fault
@@ -1030,16 +1014,12 @@ alignment_more:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
-	bl	save_nvgprs
 	INTS_RESTORE_HARD
 	bl	alignment_exception
 	b	ret_from_except
 
 	.align	7
 _GLOBAL(ret_from_except)
-	ld	r11,_TRAP(r1)
-	andi.	r0,r11,1
-	bne	ret_from_except_lite
 	REST_NVGPRS(r1)
 
 _GLOBAL(ret_from_except_lite)
@@ -1080,7 +1060,6 @@ _GLOBAL(ret_from_except_lite)
 	SCHEDULE_USER
 	b	ret_from_except_lite
 2:
-	bl	save_nvgprs
 	/*
 	 * Use a non volatile GPR to save and restore our thread_info flags
 	 * across the call to restore_interrupts.
-- 
2.23.0

