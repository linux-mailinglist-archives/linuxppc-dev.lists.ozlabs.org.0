Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF06DB81E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 04:22:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtfBk1SZ0z3flW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 12:22:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DmV8kIG7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DmV8kIG7;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ptf6K07xMz3cjW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 12:18:16 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 90-20020a17090a0fe300b0023b4bcf0727so199662pjz.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 19:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680920294; x=1683512294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dx7k0DT2Bv9DseyBatlGrZ4x3+BK9M+ugCj+JyJg4fE=;
        b=DmV8kIG7xLhdp0apFB96Ld54MuLWyf7pwI9okyFpQoqXe5HjOtwmCs4YxGdWjEJk78
         OGo3N1oBvfj/wlL511U2VGCeKtre/f+YO9VUBINDQ2t9u2ptS1dm+XD5tKM5PD2rwALD
         EWwZRiu2kt+ekACfghyfBqzVK9fUxwtQ5ljZCnBSWeRXyxrB4Sm0/EfDYSNzaM4F5suK
         Ky8uwydY85cPXSRaThFTraaBhhjK2f+CjEYWnKflfBDyddKynGJA+Lz2PRPEPiDk8D98
         ZPP4amelMxEql7/Zai7+qsI/wzOBsftU1WXNR4LfPUqFnN6izDBhGayqvKL4YgvMrjtY
         dKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680920294; x=1683512294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dx7k0DT2Bv9DseyBatlGrZ4x3+BK9M+ugCj+JyJg4fE=;
        b=1ZwjpID2NWIZgBsWsn8PMSPvdbrhGe3MpII4FEOrVEtkGwigeH8cnoaj9uVXVkxxdk
         SPhOA3tKsnZR9k4DStEdBb5OoIqwqsLfRgh+V6onpRCoEwZUROKpTmrvvNzWbBFfPBl0
         d6y36Nkwzyxj7discCTeMNdfV2R1pSG6AznIE6CiRYOaUCVpDaMke+Qoc3qjAVqgHfog
         d1HrVgqwDoMxFoqRuqcfO1qO8xlBLFSoWlJLte75FMRpgR72eumUobfGiLfL8S0qM5BM
         dHVJKBrItenPdpYa+eJ0IxIJOF6lQhz8nc0V+kprhdoMqobQKPz/FyJkzgjGfWyn1Dlq
         3V7g==
X-Gm-Message-State: AAQBX9dSp2gztIWN2bR1Q1PDNuFBOv1h1kPOh07N4psxnFRqyDzV9VbS
	bEGaO+LRfy+plkllpBw3w7gVwfL/hY0Bew==
X-Google-Smtp-Source: AKy350Z0fTaZy03ETLOnkKVMwG4R0E04TyiecGrLvEHUIhwRXagg6eREPJ/1QxyME1LcrmsbBQvtFg==
X-Received: by 2002:a17:903:11c8:b0:19f:1c64:c9d8 with SMTP id q8-20020a17090311c800b0019f1c64c9d8mr5315180plh.14.1680920294033;
        Fri, 07 Apr 2023 19:18:14 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id d11-20020a170902654b00b001a19f3a661esm3498577pln.138.2023.04.07.19.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 19:18:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc: add CFUNC assembly label annotation
Date: Sat,  8 Apr 2023 12:17:50 +1000
Message-Id: <20230408021752.862660-5-npiggin@gmail.com>
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

This macro is to be used in assembly where C functions are called.
pcrel addressing mode requires branches to functions with a
localentry value of 1 to have either a trailing nop or @notoc.
This macro permits the latter without changing callers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ppc_asm.h      |   5 ++
 arch/powerpc/kernel/exceptions-64s.S    | 112 ++++++++++++------------
 arch/powerpc/kernel/head_64.S           |  12 +--
 arch/powerpc/kernel/interrupt_64.S      |  28 +++---
 arch/powerpc/kernel/misc_64.S           |   2 +-
 arch/powerpc/kernel/vdso/gettimeofday.S |   6 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  16 ++--
 arch/powerpc/lib/copypage_power7.S      |   4 +-
 arch/powerpc/lib/copyuser_power7.S      |   8 +-
 arch/powerpc/lib/hweight_64.S           |   8 +-
 arch/powerpc/lib/memcmp_64.S            |   4 +-
 arch/powerpc/lib/memcpy_power7.S        |   6 +-
 arch/powerpc/platforms/pseries/hvCall.S |   4 +-
 13 files changed, 112 insertions(+), 103 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index d2f44612f4b0..9f64f9a6a897 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -180,6 +180,11 @@
 
 #ifdef __KERNEL__
 
+/*
+ * Used to name C functions called from asm
+ */
+#define CFUNC(name) name
+
 /*
  * We use __powerpc64__ here because we want the compat VDSO to use the 32-bit
  * version below in the else case of the ifdef.
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 6441a1ba57ac..c33c8ebf8641 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1075,7 +1075,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	__GEN_COMMON_BODY system_reset
 
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	system_reset_exception
+	bl	CFUNC(system_reset_exception)
 
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
 	li	r9,0
@@ -1223,9 +1223,9 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	addi	r3,r1,STACK_INT_FRAME_REGS
 BEGIN_FTR_SECTION
-	bl	machine_check_early_boot
+	bl	CFUNC(machine_check_early_boot)
 END_FTR_SECTION(0, 1)     // nop out after boot
-	bl	machine_check_early
+	bl	CFUNC(machine_check_early)
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
 
@@ -1286,7 +1286,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 * Queue up the MCE event so that we can log it later, while
 	 * returning from kernel or opal call.
 	 */
-	bl	machine_check_queue_event
+	bl	CFUNC(machine_check_queue_event)
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_KERNEL
 
@@ -1312,7 +1312,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 */
 	GEN_COMMON machine_check
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	machine_check_exception_async
+	bl	CFUNC(machine_check_exception_async)
 	b	interrupt_return_srr
 
 
@@ -1322,7 +1322,7 @@ EXC_COMMON_BEGIN(machine_check_common)
  * done. Queue the event then call the idle code to do the wake up.
  */
 EXC_COMMON_BEGIN(machine_check_idle_common)
-	bl	machine_check_queue_event
+	bl	CFUNC(machine_check_queue_event)
 
 	/*
 	 * GPR-loss wakeups are relatively straightforward, because the
@@ -1361,7 +1361,7 @@ EXC_COMMON_BEGIN(unrecoverable_mce)
 BEGIN_FTR_SECTION
 	li	r10,0 /* clear MSR_RI */
 	mtmsrd	r10,1
-	bl	disable_machine_check
+	bl	CFUNC(disable_machine_check)
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	ld	r10,PACAKMSR(r13)
 	li	r3,MSR_ME
@@ -1378,14 +1378,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	 * the early handler which is a true NMI.
 	 */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	machine_check_exception
+	bl	CFUNC(machine_check_exception)
 
 	/*
 	 * We will not reach here. Even if we did, there is no way out.
 	 * Call unrecoverable_exception and die.
 	 */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	unrecoverable_exception
+	bl	CFUNC(unrecoverable_exception)
 	b	.
 
 
@@ -1440,16 +1440,16 @@ EXC_COMMON_BEGIN(data_access_common)
 	bne-	1f
 #ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
-	bl	do_hash_fault
+	bl	CFUNC(do_hash_fault)
 MMU_FTR_SECTION_ELSE
-	bl	do_page_fault
+	bl	CFUNC(do_page_fault)
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 #else
-	bl	do_page_fault
+	bl	CFUNC(do_page_fault)
 #endif
 	b	interrupt_return_srr
 
-1:	bl	do_break
+1:	bl	CFUNC(do_break)
 	/*
 	 * do_break() may have changed the NV GPRS while handling a breakpoint.
 	 * If so, we need to restore them with their updated values.
@@ -1493,7 +1493,7 @@ EXC_COMMON_BEGIN(data_access_slb_common)
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	do_slb_fault
+	bl	CFUNC(do_slb_fault)
 	cmpdi	r3,0
 	bne-	1f
 	b	fast_interrupt_return_srr
@@ -1507,7 +1507,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 #endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	do_bad_segment_interrupt
+	bl	CFUNC(do_bad_segment_interrupt)
 	b	interrupt_return_srr
 
 
@@ -1541,12 +1541,12 @@ EXC_COMMON_BEGIN(instruction_access_common)
 	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_PPC_64S_HASH_MMU
 BEGIN_MMU_FTR_SECTION
-	bl	do_hash_fault
+	bl	CFUNC(do_hash_fault)
 MMU_FTR_SECTION_ELSE
-	bl	do_page_fault
+	bl	CFUNC(do_page_fault)
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 #else
-	bl	do_page_fault
+	bl	CFUNC(do_page_fault)
 #endif
 	b	interrupt_return_srr
 
@@ -1581,7 +1581,7 @@ EXC_COMMON_BEGIN(instruction_access_slb_common)
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	do_slb_fault
+	bl	CFUNC(do_slb_fault)
 	cmpdi	r3,0
 	bne-	1f
 	b	fast_interrupt_return_srr
@@ -1595,7 +1595,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 #endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	do_bad_segment_interrupt
+	bl	CFUNC(do_bad_segment_interrupt)
 	b	interrupt_return_srr
 
 
@@ -1649,7 +1649,7 @@ EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	do_IRQ
+	bl	CFUNC(do_IRQ)
 	BEGIN_FTR_SECTION
 	b	interrupt_return_hsrr
 	FTR_SECTION_ELSE
@@ -1679,7 +1679,7 @@ EXC_VIRT_END(alignment, 0x4600, 0x100)
 EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	alignment_exception
+	bl	CFUNC(alignment_exception)
 	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
@@ -1745,7 +1745,7 @@ EXC_COMMON_BEGIN(program_check_common)
 
 .Ldo_program_check:
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	program_check_exception
+	bl	CFUNC(program_check_exception)
 	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
@@ -1777,7 +1777,7 @@ EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	kernel_fp_unavailable_exception
+	bl	CFUNC(kernel_fp_unavailable_exception)
 0:	trap
 	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
 1:
@@ -1790,12 +1790,12 @@ BEGIN_FTR_SECTION
 	bne-	2f
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
-	bl	load_up_fpu
+	bl	CFUNC(load_up_fpu)
 	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	fp_unavailable_tm
+	bl	CFUNC(fp_unavailable_tm)
 	b	interrupt_return_srr
 #endif
 
@@ -1839,7 +1839,7 @@ EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	timer_interrupt
+	bl	CFUNC(timer_interrupt)
 	b	interrupt_return_srr
 
 
@@ -1925,9 +1925,9 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
 	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_PPC_DOORBELL
-	bl	doorbell_exception
+	bl	CFUNC(doorbell_exception)
 #else
-	bl	unknown_async_exception
+	bl	CFUNC(unknown_async_exception)
 #endif
 	b	interrupt_return_srr
 
@@ -2091,7 +2091,7 @@ EXC_VIRT_END(single_step, 0x4d00, 0x100)
 EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	single_step_exception
+	bl	CFUNC(single_step_exception)
 	b	interrupt_return_srr
 
 
@@ -2126,9 +2126,9 @@ EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
 	addi    r3,r1,STACK_INT_FRAME_REGS
 BEGIN_MMU_FTR_SECTION
-	bl      do_bad_page_fault_segv
+	bl	CFUNC(do_bad_page_fault_segv)
 MMU_FTR_SECTION_ELSE
-	bl      unknown_exception
+	bl	CFUNC(unknown_exception)
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 	b       interrupt_return_hsrr
 
@@ -2154,7 +2154,7 @@ EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	unknown_exception
+	bl	CFUNC(unknown_exception)
 	b	interrupt_return_hsrr
 
 
@@ -2177,7 +2177,7 @@ EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	emulation_assist_interrupt
+	bl	CFUNC(emulation_assist_interrupt)
 	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_hsrr
 
@@ -2237,7 +2237,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	__GEN_COMMON_BODY hmi_exception_early
 
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	hmi_exception_realmode
+	bl	CFUNC(hmi_exception_realmode)
 	cmpdi	cr0,r3,0
 	bne	1f
 
@@ -2255,7 +2255,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	handle_hmi_exception
+	bl	CFUNC(handle_hmi_exception)
 	b	interrupt_return_hsrr
 
 
@@ -2290,9 +2290,9 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
 	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_PPC_DOORBELL
-	bl	doorbell_exception
+	bl	CFUNC(doorbell_exception)
 #else
-	bl	unknown_async_exception
+	bl	CFUNC(unknown_async_exception)
 #endif
 	b	interrupt_return_hsrr
 
@@ -2325,7 +2325,7 @@ EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	do_IRQ
+	bl	CFUNC(do_IRQ)
 	b	interrupt_return_hsrr
 
 
@@ -2374,10 +2374,10 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	lbz	r4,PACAIRQSOFTMASK(r13)
 	cmpdi	r4,IRQS_ENABLED
 	bne	1f
-	bl	performance_monitor_exception_async
+	bl	CFUNC(performance_monitor_exception_async)
 	b	interrupt_return_srr
 1:
-	bl	performance_monitor_exception_nmi
+	bl	CFUNC(performance_monitor_exception_nmi)
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
 	li	r9,0
 	mtmsrd	r9,1
@@ -2421,19 +2421,19 @@ BEGIN_FTR_SECTION
 	bne-	2f
   END_FTR_SECTION_NESTED(CPU_FTR_TM, CPU_FTR_TM, 69)
 #endif
-	bl	load_up_altivec
+	bl	CFUNC(load_up_altivec)
 	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	altivec_unavailable_tm
+	bl	CFUNC(altivec_unavailable_tm)
 	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	altivec_unavailable_exception
+	bl	CFUNC(altivec_unavailable_exception)
 	b	interrupt_return_srr
 
 
@@ -2475,14 +2475,14 @@ BEGIN_FTR_SECTION
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	vsx_unavailable_tm
+	bl	CFUNC(vsx_unavailable_tm)
 	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	vsx_unavailable_exception
+	bl	CFUNC(vsx_unavailable_exception)
 	b	interrupt_return_srr
 
 
@@ -2509,7 +2509,7 @@ EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	facility_unavailable_exception
+	bl	CFUNC(facility_unavailable_exception)
 	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
@@ -2537,7 +2537,7 @@ EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	facility_unavailable_exception
+	bl	CFUNC(facility_unavailable_exception)
 	/* XXX Shouldn't be necessary in practice */
 	HANDLER_RESTORE_NVGPRS()
 	b	interrupt_return_hsrr
@@ -2568,7 +2568,7 @@ EXC_VIRT_NONE(0x5200, 0x100)
 EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	cbe_system_error_exception
+	bl	CFUNC(cbe_system_error_exception)
 	b	interrupt_return_hsrr
 
 #else /* CONFIG_CBE_RAS */
@@ -2599,7 +2599,7 @@ EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	instruction_breakpoint_exception
+	bl	CFUNC(instruction_breakpoint_exception)
 	b	interrupt_return_srr
 
 
@@ -2721,7 +2721,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 EXC_COMMON_BEGIN(denorm_exception_common)
 	GEN_COMMON denorm_exception
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	unknown_exception
+	bl	CFUNC(unknown_exception)
 	b	interrupt_return_hsrr
 
 
@@ -2738,7 +2738,7 @@ EXC_VIRT_NONE(0x5600, 0x100)
 EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	cbe_maintenance_exception
+	bl	CFUNC(cbe_maintenance_exception)
 	b	interrupt_return_hsrr
 
 #else /* CONFIG_CBE_RAS */
@@ -2764,10 +2764,10 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	GEN_COMMON altivec_assist
 	addi	r3,r1,STACK_INT_FRAME_REGS
 #ifdef CONFIG_ALTIVEC
-	bl	altivec_assist_exception
+	bl	CFUNC(altivec_assist_exception)
 	HANDLER_RESTORE_NVGPRS() /* instruction emulation may change GPRs */
 #else
-	bl	unknown_exception
+	bl	CFUNC(unknown_exception)
 #endif
 	b	interrupt_return_srr
 
@@ -2785,7 +2785,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 EXC_COMMON_BEGIN(cbe_thermal_common)
 	GEN_COMMON cbe_thermal
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	cbe_thermal_exception
+	bl	CFUNC(cbe_thermal_exception)
 	b	interrupt_return_hsrr
 
 #else /* CONFIG_CBE_RAS */
@@ -2818,7 +2818,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	__GEN_COMMON_BODY soft_nmi
 
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	soft_nmi_interrupt
+	bl	CFUNC(soft_nmi_interrupt)
 
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
 	li	r9,0
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 66c21061036b..2254f6fa3528 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -605,7 +605,7 @@ __boot_from_prom:
 
 	/* Do all of the interaction with OF client interface */
 	mr	r8,r26
-	bl	prom_init
+	bl	CFUNC(prom_init)
 #endif /* #CONFIG_PPC_OF_BOOT_TRAMPOLINE */
 
 	/* We never return. We also hit that trap if trying to boot
@@ -833,7 +833,7 @@ __secondary_start:
 	 * can turn it on below. This is a call to C, which is OK, we're still
 	 * running on the emergency stack.
 	 */
-	bl	early_setup_secondary
+	bl	CFUNC(early_setup_secondary)
 
 	/*
 	 * The primary has initialized our kernel stack for us in the paca, grab
@@ -872,7 +872,7 @@ start_secondary_prolog:
 	LOAD_PACA_TOC()
 	li	r3,0
 	std	r3,0(r1)		/* Zero the stack frame pointer	*/
-	bl	start_secondary
+	bl	CFUNC(start_secondary)
 	b	.
 /*
  * Reset stack pointer and call start_secondary
@@ -883,7 +883,7 @@ _GLOBAL(start_secondary_resume)
 	ld	r1,PACAKSAVE(r13)	/* Reload kernel stack pointer */
 	li	r3,0
 	std	r3,0(r1)		/* Zero the stack frame pointer	*/
-	bl	start_secondary
+	bl	CFUNC(start_secondary)
 	b	.
 #endif
 
@@ -988,7 +988,7 @@ start_here_multiplatform:
 	 */
 
 #ifdef CONFIG_KASAN
-	bl	kasan_early_init
+	bl	CFUNC(kasan_early_init)
 #endif
 	/* Restore parameters passed from prom_init/kexec */
 	mr	r3,r31
@@ -1021,7 +1021,7 @@ start_here_common:
 	stb	r0,PACAIRQHAPPENED(r13)
 
 	/* Generic kernel entry */
-	bl	start_kernel
+	bl	CFUNC(start_kernel)
 
 	/* Not reached */
 0:	trap
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index fccc34489add..23d7cdc5a23e 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -101,12 +101,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * state of kernel code.
 	 */
 	SANITIZE_SYSCALL_GPRS()
-	bl	system_call_exception
+	bl	CFUNC(system_call_exception)
 
 .Lsyscall_vectored_\name\()_exit:
 	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r5,1 /* scv */
-	bl	syscall_exit_prepare
+	bl	CFUNC(syscall_exit_prepare)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 .Lsyscall_vectored_\name\()_rst_start:
 	lbz	r11,PACAIRQHAPPENED(r13)
@@ -185,7 +185,7 @@ _ASM_NOKPROBE_SYMBOL(syscall_vectored_\name\()_restart)
 	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	syscall_exit_restart
+	bl	CFUNC(syscall_exit_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_vectored_\name\()_rst_start
 1:
@@ -286,12 +286,12 @@ END_BTB_FLUSH_SECTION
 	 * state of kernel code.
 	 */
 	SANITIZE_SYSCALL_GPRS()
-	bl	system_call_exception
+	bl	CFUNC(system_call_exception)
 
 .Lsyscall_exit:
 	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r5,0 /* !scv */
-	bl	syscall_exit_prepare
+	bl	CFUNC(syscall_exit_prepare)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 #ifdef CONFIG_PPC_BOOK3S
 .Lsyscall_rst_start:
@@ -372,7 +372,7 @@ _ASM_NOKPROBE_SYMBOL(syscall_restart)
 	addi	r4,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	syscall_exit_restart
+	bl	CFUNC(syscall_exit_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_rst_start
 1:
@@ -401,7 +401,7 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return_srr)
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return_srr
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	unrecoverable_exception
+	bl	CFUNC(unrecoverable_exception)
 	b	. /* should not get here */
 #else
 	bne	.Lfast_user_interrupt_return_srr
@@ -419,7 +419,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	interrupt_exit_user_prepare
+	bl	CFUNC(interrupt_exit_user_prepare)
 #ifndef CONFIG_INTERRUPT_SANITIZE_REGISTERS
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
@@ -523,7 +523,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	interrupt_exit_user_restart
+	bl	CFUNC(interrupt_exit_user_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Linterrupt_return_\srr\()_user_rst_start
 1:
@@ -536,7 +536,7 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
 interrupt_return_\srr\()_kernel:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	addi	r3,r1,STACK_INT_FRAME_REGS
-	bl	interrupt_exit_kernel_prepare
+	bl	CFUNC(interrupt_exit_kernel_prepare)
 
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 .Linterrupt_return_\srr\()_kernel_rst_start:
@@ -705,7 +705,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel_restart)
 	addi	r3,r1,STACK_INT_FRAME_REGS
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	interrupt_exit_kernel_restart
+	bl	CFUNC(interrupt_exit_kernel_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Linterrupt_return_\srr\()_kernel_rst_start
 1:
@@ -727,20 +727,20 @@ DEFINE_FIXED_SYMBOL(__end_soft_masked, text)
 
 #ifdef CONFIG_PPC_BOOK3S
 _GLOBAL(ret_from_fork_scv)
-	bl	schedule_tail
+	bl	CFUNC(schedule_tail)
 	REST_NVGPRS(r1)
 	li	r3,0	/* fork() return value */
 	b	.Lsyscall_vectored_common_exit
 #endif
 
 _GLOBAL(ret_from_fork)
-	bl	schedule_tail
+	bl	CFUNC(schedule_tail)
 	REST_NVGPRS(r1)
 	li	r3,0	/* fork() return value */
 	b	.Lsyscall_exit
 
 _GLOBAL(ret_from_kernel_thread)
-	bl	schedule_tail
+	bl	CFUNC(schedule_tail)
 	REST_NVGPRS(r1)
 	mtctr	r14
 	mr	r3,r15
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index c39c07a4c06e..2c9ac70aaf0c 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -432,7 +432,7 @@ _GLOBAL(kexec_sequence)
 1:
 	/* copy dest pages, flush whole dest image */
 	mr	r3,r29
-	bl	kexec_copy_flush	/* (image) */
+	bl	CFUNC(kexec_copy_flush)	/* (image) */
 
 	/* turn off mmu now if not done earlier */
 	cmpdi	r26,0
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 0c4ecc8fec5a..48fc6658053a 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -38,7 +38,11 @@
 	.else
 	addi		r4, r5, VDSO_DATA_OFFSET
 	.endif
-	bl		DOTSYM(\funct)
+#ifdef __powerpc64__
+	bl		CFUNC(DOTSYM(\funct))
+#else
+	bl		\funct
+#endif
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
 #ifdef __powerpc64__
 	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index acf80915f406..3eab313843b7 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -381,7 +381,7 @@ kvm_secondary_got_guest:
 	bne	kvm_no_guest
 
 	li	r3,0			/* NULL argument */
-	bl	hmi_exception_realmode
+	bl	CFUNC(hmi_exception_realmode)
 /*
  * At this point we have finished executing in the guest.
  * We need to wait for hwthread_req to become zero, since
@@ -458,7 +458,7 @@ kvm_unsplit_nap:
 	cmpwi	r12, BOOK3S_INTERRUPT_HMI
 	bne	55f
 	li	r3, 0			/* NULL argument */
-	bl	hmi_exception_realmode
+	bl	CFUNC(hmi_exception_realmode)
 55:
 	/*
 	 * Ensure that secondary doesn't nap when it has
@@ -859,7 +859,7 @@ deliver_guest_interrupt:	/* r4 = vcpu, r13 = paca */
 	cmpdi	r0, 0
 	beq	71f
 	mr	r3, r4
-	bl	kvmppc_guest_entry_inject_int
+	bl	CFUNC(kvmppc_guest_entry_inject_int)
 	ld	r4, HSTATE_KVM_VCPU(r13)
 71:
 	ld	r6, VCPU_SRR0(r4)
@@ -1544,7 +1544,7 @@ kvmppc_guest_external:
 	/* External interrupt, first check for host_ipi. If this is
 	 * set, we know the host wants us out so let's do it now
 	 */
-	bl	kvmppc_read_intr
+	bl	CFUNC(kvmppc_read_intr)
 
 	/*
 	 * Restore the active volatile registers after returning from
@@ -1626,7 +1626,7 @@ kvmppc_hdsi:
 	/* Search the hash table. */
 	mr	r3, r9			/* vcpu pointer */
 	li	r7, 1			/* data fault */
-	bl	kvmppc_hpte_hv_fault
+	bl	CFUNC(kvmppc_hpte_hv_fault)
 	ld	r9, HSTATE_KVM_VCPU(r13)
 	ld	r10, VCPU_PC(r9)
 	ld	r11, VCPU_MSR(r9)
@@ -1702,7 +1702,7 @@ kvmppc_hisi:
 	mr	r4, r10
 	mr	r6, r11
 	li	r7, 0			/* instruction fault */
-	bl	kvmppc_hpte_hv_fault
+	bl	CFUNC(kvmppc_hpte_hv_fault)
 	ld	r9, HSTATE_KVM_VCPU(r13)
 	ld	r10, VCPU_PC(r9)
 	ld	r11, VCPU_MSR(r9)
@@ -2342,7 +2342,7 @@ hmi_realmode:
 	lbz	r0, HSTATE_PTID(r13)
 	cmpwi	r0, 0
 	bne	guest_exit_cont
-	bl	kvmppc_realmode_hmi_handler
+	bl	CFUNC(kvmppc_realmode_hmi_handler)
 	ld	r9, HSTATE_KVM_VCPU(r13)
 	li	r12, BOOK3S_INTERRUPT_HMI
 	b	guest_exit_cont
@@ -2413,7 +2413,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 7:	mflr	r0
 	std	r0, PPC_LR_STKOFF(r1)
 	stdu	r1, -PPC_MIN_STKFRM(r1)
-	bl	kvmppc_read_intr
+	bl	CFUNC(kvmppc_read_intr)
 	nop
 	li	r12, BOOK3S_INTERRUPT_EXTERNAL
 	cmpdi	r3, 1
diff --git a/arch/powerpc/lib/copypage_power7.S b/arch/powerpc/lib/copypage_power7.S
index a9844c6353cf..a783973f1215 100644
--- a/arch/powerpc/lib/copypage_power7.S
+++ b/arch/powerpc/lib/copypage_power7.S
@@ -45,7 +45,7 @@ _GLOBAL(copypage_power7)
 	std	r4,-STACKFRAMESIZE+STK_REG(R30)(r1)
 	std	r0,16(r1)
 	stdu	r1,-STACKFRAMESIZE(r1)
-	bl	enter_vmx_ops
+	bl	CFUNC(enter_vmx_ops)
 	cmpwi	r3,0
 	ld	r0,STACKFRAMESIZE+16(r1)
 	ld	r3,STK_REG(R31)(r1)
@@ -88,7 +88,7 @@ _GLOBAL(copypage_power7)
 	addi	r3,r3,128
 	bdnz	1b
 
-	b	exit_vmx_ops		/* tail call optimise */
+	b	CFUNC(exit_vmx_ops)		/* tail call optimise */
 
 #else
 	li	r0,(PAGE_SIZE/128)
diff --git a/arch/powerpc/lib/copyuser_power7.S b/arch/powerpc/lib/copyuser_power7.S
index 28f0be523c06..ac41053c3a5a 100644
--- a/arch/powerpc/lib/copyuser_power7.S
+++ b/arch/powerpc/lib/copyuser_power7.S
@@ -47,7 +47,7 @@
 	ld	r15,STK_REG(R15)(r1)
 	ld	r14,STK_REG(R14)(r1)
 .Ldo_err3:
-	bl	exit_vmx_usercopy
+	bl	CFUNC(exit_vmx_usercopy)
 	ld	r0,STACKFRAMESIZE+16(r1)
 	mtlr	r0
 	b	.Lexit
@@ -272,7 +272,7 @@ err1;	stb	r0,0(r3)
 	mflr	r0
 	std	r0,16(r1)
 	stdu	r1,-STACKFRAMESIZE(r1)
-	bl	enter_vmx_usercopy
+	bl	CFUNC(enter_vmx_usercopy)
 	cmpwi	cr1,r3,0
 	ld	r0,STACKFRAMESIZE+16(r1)
 	ld	r3,STK_REG(R31)(r1)
@@ -488,7 +488,7 @@ err3;	lbz	r0,0(r4)
 err3;	stb	r0,0(r3)
 
 15:	addi	r1,r1,STACKFRAMESIZE
-	b	exit_vmx_usercopy	/* tail call optimise */
+	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
 
 .Lvmx_unaligned_copy:
 	/* Get the destination 16B aligned */
@@ -691,5 +691,5 @@ err3;	lbz	r0,0(r4)
 err3;	stb	r0,0(r3)
 
 15:	addi	r1,r1,STACKFRAMESIZE
-	b	exit_vmx_usercopy	/* tail call optimise */
+	b	CFUNC(exit_vmx_usercopy)	/* tail call optimise */
 #endif /* CONFIG_ALTIVEC */
diff --git a/arch/powerpc/lib/hweight_64.S b/arch/powerpc/lib/hweight_64.S
index 6effad901ef7..09af29561314 100644
--- a/arch/powerpc/lib/hweight_64.S
+++ b/arch/powerpc/lib/hweight_64.S
@@ -14,7 +14,7 @@
 
 _GLOBAL(__arch_hweight8)
 BEGIN_FTR_SECTION
-	b __sw_hweight8
+	b CFUNC(__sw_hweight8)
 	nop
 	nop
 FTR_SECTION_ELSE
@@ -26,7 +26,7 @@ EXPORT_SYMBOL(__arch_hweight8)
 
 _GLOBAL(__arch_hweight16)
 BEGIN_FTR_SECTION
-	b __sw_hweight16
+	b CFUNC(__sw_hweight16)
 	nop
 	nop
 	nop
@@ -49,7 +49,7 @@ EXPORT_SYMBOL(__arch_hweight16)
 
 _GLOBAL(__arch_hweight32)
 BEGIN_FTR_SECTION
-	b __sw_hweight32
+	b CFUNC(__sw_hweight32)
 	nop
 	nop
 	nop
@@ -75,7 +75,7 @@ EXPORT_SYMBOL(__arch_hweight32)
 
 _GLOBAL(__arch_hweight64)
 BEGIN_FTR_SECTION
-	b __sw_hweight64
+	b CFUNC(__sw_hweight64)
 	nop
 	nop
 	nop
diff --git a/arch/powerpc/lib/memcmp_64.S b/arch/powerpc/lib/memcmp_64.S
index 384218df71ba..0b9b1685a33d 100644
--- a/arch/powerpc/lib/memcmp_64.S
+++ b/arch/powerpc/lib/memcmp_64.S
@@ -44,7 +44,7 @@
 	std     r5,-STACKFRAMESIZE+STK_REG(R29)(r1); \
 	std     r0,16(r1); \
 	stdu    r1,-STACKFRAMESIZE(r1); \
-	bl      enter_vmx_ops; \
+	bl      CFUNC(enter_vmx_ops); \
 	cmpwi   cr1,r3,0; \
 	ld      r0,STACKFRAMESIZE+16(r1); \
 	ld      r3,STK_REG(R31)(r1); \
@@ -60,7 +60,7 @@
 	std     r5,-STACKFRAMESIZE+STK_REG(R29)(r1); \
 	std     r0,16(r1); \
 	stdu    r1,-STACKFRAMESIZE(r1); \
-	bl      exit_vmx_ops; \
+	bl      CFUNC(exit_vmx_ops); \
 	ld      r0,STACKFRAMESIZE+16(r1); \
 	ld      r3,STK_REG(R31)(r1); \
 	ld      r4,STK_REG(R30)(r1); \
diff --git a/arch/powerpc/lib/memcpy_power7.S b/arch/powerpc/lib/memcpy_power7.S
index 54f226333c94..9398b2b746c4 100644
--- a/arch/powerpc/lib/memcpy_power7.S
+++ b/arch/powerpc/lib/memcpy_power7.S
@@ -218,7 +218,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	std	r5,-STACKFRAMESIZE+STK_REG(R29)(r1)
 	std	r0,16(r1)
 	stdu	r1,-STACKFRAMESIZE(r1)
-	bl	enter_vmx_ops
+	bl	CFUNC(enter_vmx_ops)
 	cmpwi	cr1,r3,0
 	ld	r0,STACKFRAMESIZE+16(r1)
 	ld	r3,STK_REG(R31)(r1)
@@ -433,7 +433,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
 15:	addi	r1,r1,STACKFRAMESIZE
 	ld	r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
-	b	exit_vmx_ops		/* tail call optimise */
+	b	CFUNC(exit_vmx_ops)		/* tail call optimise */
 
 .Lvmx_unaligned_copy:
 	/* Get the destination 16B aligned */
@@ -637,5 +637,5 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 
 15:	addi	r1,r1,STACKFRAMESIZE
 	ld	r3,-STACKFRAMESIZE+STK_REG(R31)(r1)
-	b	exit_vmx_ops		/* tail call optimise */
+	b	CFUNC(exit_vmx_ops)		/* tail call optimise */
 #endif /* CONFIG_ALTIVEC */
diff --git a/arch/powerpc/platforms/pseries/hvCall.S b/arch/powerpc/platforms/pseries/hvCall.S
index 783c16ad648b..35254ac7af5e 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -44,7 +44,7 @@ hcall_tracepoint_refcount:
 	std	r0,16(r1);					\
 	addi	r4,r1,STK_PARAM(FIRST_REG);			\
 	stdu	r1,-STACK_FRAME_MIN_SIZE(r1);			\
-	bl	__trace_hcall_entry;				\
+	bl	CFUNC(__trace_hcall_entry);			\
 	ld	r3,STACK_FRAME_MIN_SIZE+STK_PARAM(R3)(r1);	\
 	ld	r4,STACK_FRAME_MIN_SIZE+STK_PARAM(R4)(r1);	\
 	ld	r5,STACK_FRAME_MIN_SIZE+STK_PARAM(R5)(r1);	\
@@ -63,7 +63,7 @@ hcall_tracepoint_refcount:
 	std	r3,STACK_FRAME_MIN_SIZE+STK_PARAM(R3)(r1);	\
 	mr	r4,r3;						\
 	mr	r3,r0;						\
-	bl	__trace_hcall_exit;				\
+	bl	CFUNC(__trace_hcall_exit);			\
 	ld	r0,STACK_FRAME_MIN_SIZE+16(r1);			\
 	addi	r1,r1,STACK_FRAME_MIN_SIZE;			\
 	ld	r3,STK_PARAM(R3)(r1);				\
-- 
2.40.0

