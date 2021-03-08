Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E93330A9F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 10:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvDFy371Zz3dSn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 20:54:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pjVUomGE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pjVUomGE; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvDDP3c37z3cQH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 20:53:09 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id kx1so2718396pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 01:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A6BkpxfVTNOoYbvmw0TKKH42FzCykEiic8GI4mV9LME=;
 b=pjVUomGEVTVSl8Xi61KI936UWtruC+EW3Iava5lONYlsXCkSJdt6TQepugAVL4Y4eM
 hdgf/PXxrzEFzYOMn5jEiygCpPUdc6j/3ejgZNDM5j/TiYmSCcfpT/hdf1pgydbwZwd7
 l6ADYcz4LAGZusNYKXgG5Rvma+EtYShpAi0VsKG12guGhHs3iWmGc03m81gJrtulE7Eu
 VpujjG+qBKvSDD4gqkCQUtu0+Ai9XhHs/sC34mvIL+hnQEnqoEdYR4R9kCSuduQ8tfdL
 XiHFs4CDwT5pKMToWpymXstPAhTnyXXFEQsHTAPOJf8ptjkiAbKilA6hruiL7MxdCBaR
 WW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A6BkpxfVTNOoYbvmw0TKKH42FzCykEiic8GI4mV9LME=;
 b=HpiXrpTR6DGWrFmyWrbN4Caxjr9UHpi+dbo+KjeTxocSgtfzjUZ5qe0/phv1kZNEWo
 GtasOOuqtot564lvN2BqE5bNjAgeKYSsps0j0+aIPOPPAj8InU8TsJ/0vvIQ5AF3YFwS
 n87f9Vgb9N5bg5o4+Z1EIN/YeDR2mHZuNLzJpV2d//TWNlzUkGZrVOFdPnOld9AaQeRf
 UrTf0vkBrabbsPqOy0MDrubPT2/KzCQRMoL2GZGd4I9urHx2lSMmj7LHKf1x33hnGpCp
 adL2jmFWL2Wy4cpTIjDqgD44LAARQjXJDMj3fdxqvqcVtYoJMVEnDNjsmsmlrwqOt80V
 dsoA==
X-Gm-Message-State: AOAM530MtgtasK51sWqsyE3ZwASmudmA5b9GsmxMK5Cnp25E2xH5UU/l
 8TNmySEo6AdV0WXFLOT23W6Ipj+dfu4=
X-Google-Smtp-Source: ABdhPJxIWg0NEXy0Tnrd1uFACVsutLsivyXHZlJSybLp4jWp47ftQz3E/t3W/dAA8CBjGEhEQQaA3w==
X-Received: by 2002:a17:902:6b43:b029:e6:3d73:e9fb with SMTP id
 g3-20020a1709026b43b02900e63d73e9fbmr507097plt.37.1615197186862; 
 Mon, 08 Mar 2021 01:53:06 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 e63sm1326850pfe.208.2021.03.08.01.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 01:53:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/7] powerpc/64e/interrupt: always save nvgprs on interrupt
Date: Mon,  8 Mar 2021 19:52:39 +1000
Message-Id: <20210308095244.3195782-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210308095244.3195782-1-npiggin@gmail.com>
References: <20210308095244.3195782-1-npiggin@gmail.com>
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

In order to use the C interrupt return, nvgprs must always be saved.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h    |  9 +--------
 arch/powerpc/kernel/entry_64.S       | 13 -------------
 arch/powerpc/kernel/exceptions-64e.S | 27 +++------------------------
 3 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 1499e928ea6a..c8afed82d484 100644
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

