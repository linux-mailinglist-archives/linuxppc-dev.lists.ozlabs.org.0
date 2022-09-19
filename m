Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCE35BCDDD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Sep 2022 16:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWRJd33Gtz3bkR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 00:05:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZwRqAcLA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZwRqAcLA;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWRFK6KsPz3brL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 00:02:13 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id bh13so26868007pgb.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Sep 2022 07:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fsV5lhwzOPWR2YjWV/+CM9DAvLWF2wjh3un+c5z19dw=;
        b=ZwRqAcLA9qzxeAKe23VyaSPW9edLq8hd30Q4S4HWlZyyQJ7pKjgZeRFc5VcWEFuu+W
         m2COm4wEk60AgnjnB8HwZA2V9AsnP57XuT1lavc7HjIKrevE3QW0xy0R61YGrbx2Od63
         mZJJ9CT1ji1+akMb8pwt71loTiIm12hqe1YfPuDSOTGYtThO+CXhpqoN1tic2j7xBVDe
         LVT3/ByVDNqNmX6Sk5sQvI69Mi9ioOSnNoyYBfDj89SLn4QVB5GxeaBQTzB/3nrluqVn
         RxEAjgzaprd8bu0RFWxHw8BZl9gK0HBiGGY0MyhaXqcsqnU//RDlEQ5lw3PmRDXhIadf
         cx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fsV5lhwzOPWR2YjWV/+CM9DAvLWF2wjh3un+c5z19dw=;
        b=vDyDX67dgPShb6ummdaxAapog8y0J1N+OTgp5M50S9ktt4Ekxc5WivcsLsoYLmXjJM
         GweZgBxfNF6stZ88+W0+C+/GowZXgTJrDLKBGUBlTBTeeYH9tgGZXFvCuJXA4m2vtTou
         nQrQOjsRGbm6rNo9tvMhbjKO8Hq3UzWEotPJ5Wv4zLep9zZ+n+rtHajxW5NdKTjBdYT+
         lDBfPfsbvfR5MgN5BQPtCaeXMt8+EGh/VnUQ4v06AN2g8z63tddsVMNxhC/zzTMYq5qX
         nZBITtGacQOODE9BJZfvDZ/ZqCYYqGt+1UbC6LiJwxihJ5ef8BTzWrgOPRBmJ0e13NS3
         5lsw==
X-Gm-Message-State: ACrzQf0dNP3+hdQXbi49631C4sN1Chg5VI2lECesIfrKX77nNAjLa9/0
	UE/Ef9faoEBWFQ3QooqGaHJeUSJk8uM=
X-Google-Smtp-Source: AMsMyM7NtGMzzfYshdItDCVg6PUvsVNxDN81FtmjPyU1tUI+qNerD+RFjsMl7xX9+epYGiGwnj6xPg==
X-Received: by 2002:a05:6a00:ad4:b0:547:8ed2:e41e with SMTP id c20-20020a056a000ad400b005478ed2e41emr19307154pfl.3.1663596130597;
        Mon, 19 Sep 2022 07:02:10 -0700 (PDT)
Received: from bobo.ibm.com (118-208-203-28.tpgi.com.au. [118.208.203.28])
        by smtp.gmail.com with ESMTPSA id p8-20020a170902780800b001637529493esm20477931pll.66.2022.09.19.07.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:02:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/7] powerpc: add CFUNC assembly label annotation
Date: Tue, 20 Sep 2022 00:01:46 +1000
Message-Id: <20220919140149.4018927-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220919140149.4018927-1-npiggin@gmail.com>
References: <20220919140149.4018927-1-npiggin@gmail.com>
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
 arch/powerpc/kernel/exceptions-64s.S    | 108 ++++++++++++------------
 arch/powerpc/kernel/head_64.S           |  12 +--
 arch/powerpc/kernel/interrupt_64.S      |  28 +++---
 arch/powerpc/kernel/misc_64.S           |   2 +-
 arch/powerpc/kernel/vdso/gettimeofday.S |   2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  16 ++--
 arch/powerpc/lib/copypage_power7.S      |   4 +-
 arch/powerpc/lib/copyuser_power7.S      |   8 +-
 arch/powerpc/lib/hweight_64.S           |   8 +-
 arch/powerpc/lib/memcmp_64.S            |   4 +-
 arch/powerpc/lib/memcpy_power7.S        |   6 +-
 arch/powerpc/platforms/pseries/hvCall.S |   4 +-
 13 files changed, 106 insertions(+), 101 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index c0848303151c..ab8adf2b833f 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -139,6 +139,11 @@
 
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
index 9a06f2c8e326..08d322ab5980 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -997,7 +997,7 @@ EXC_COMMON_BEGIN(system_reset_common)
 	__GEN_COMMON_BODY system_reset
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	system_reset_exception
+	bl	CFUNC(system_reset_exception)
 
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
 	li	r9,0
@@ -1143,7 +1143,7 @@ BEGIN_FTR_SECTION
 	bl	enable_machine_check
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	machine_check_early
+	bl	CFUNC(machine_check_early)
 	std	r3,RESULT(r1)	/* Save result */
 	ld	r12,_MSR(r1)
 
@@ -1204,7 +1204,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	 * Queue up the MCE event so that we can log it later, while
 	 * returning from kernel or opal call.
 	 */
-	bl	machine_check_queue_event
+	bl	CFUNC(machine_check_queue_event)
 	MACHINE_CHECK_HANDLER_WINDUP
 	RFI_TO_KERNEL
 
@@ -1230,7 +1230,7 @@ EXC_COMMON_BEGIN(machine_check_common)
 	 */
 	GEN_COMMON machine_check
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	machine_check_exception_async
+	bl	CFUNC(machine_check_exception_async)
 	b	interrupt_return_srr
 
 
@@ -1240,7 +1240,7 @@ EXC_COMMON_BEGIN(machine_check_common)
  * done. Queue the event then call the idle code to do the wake up.
  */
 EXC_COMMON_BEGIN(machine_check_idle_common)
-	bl	machine_check_queue_event
+	bl	CFUNC(machine_check_queue_event)
 
 	/*
 	 * GPR-loss wakeups are relatively straightforward, because the
@@ -1279,7 +1279,7 @@ EXC_COMMON_BEGIN(unrecoverable_mce)
 BEGIN_FTR_SECTION
 	li	r10,0 /* clear MSR_RI */
 	mtmsrd	r10,1
-	bl	disable_machine_check
+	bl	CFUNC(disable_machine_check)
 END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	ld	r10,PACAKMSR(r13)
 	li	r3,MSR_ME
@@ -1296,14 +1296,14 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 	 * the early handler which is a true NMI.
 	 */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	machine_check_exception
+	bl	CFUNC(machine_check_exception)
 
 	/*
 	 * We will not reach here. Even if we did, there is no way out.
 	 * Call unrecoverable_exception and die.
 	 */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unrecoverable_exception
+	bl	CFUNC(unrecoverable_exception)
 	b	.
 
 
@@ -1358,16 +1358,16 @@ EXC_COMMON_BEGIN(data_access_common)
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
@@ -1411,7 +1411,7 @@ EXC_COMMON_BEGIN(data_access_slb_common)
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_slb_fault
+	bl	CFUNC(do_slb_fault)
 	cmpdi	r3,0
 	bne-	1f
 	b	fast_interrupt_return_srr
@@ -1425,7 +1425,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 #endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_bad_segment_interrupt
+	bl	CFUNC(do_bad_segment_interrupt)
 	b	interrupt_return_srr
 
 
@@ -1459,12 +1459,12 @@ EXC_COMMON_BEGIN(instruction_access_common)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
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
 
@@ -1499,7 +1499,7 @@ EXC_COMMON_BEGIN(instruction_access_slb_common)
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_slb_fault
+	bl	CFUNC(do_slb_fault)
 	cmpdi	r3,0
 	bne-	1f
 	b	fast_interrupt_return_srr
@@ -1513,7 +1513,7 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 #endif
 	std	r3,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_bad_segment_interrupt
+	bl	CFUNC(do_bad_segment_interrupt)
 	b	interrupt_return_srr
 
 
@@ -1567,7 +1567,7 @@ EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
 EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_COMMON hardware_interrupt
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_IRQ
+	bl	CFUNC(do_IRQ)
 	BEGIN_FTR_SECTION
 	b	interrupt_return_hsrr
 	FTR_SECTION_ELSE
@@ -1597,7 +1597,7 @@ EXC_VIRT_END(alignment, 0x4600, 0x100)
 EXC_COMMON_BEGIN(alignment_common)
 	GEN_COMMON alignment
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	alignment_exception
+	bl	CFUNC(alignment_exception)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
@@ -1707,7 +1707,7 @@ EXC_COMMON_BEGIN(program_check_common)
 
 .Ldo_program_check:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	program_check_exception
+	bl	CFUNC(program_check_exception)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
@@ -1738,7 +1738,7 @@ EXC_COMMON_BEGIN(fp_unavailable_common)
 	GEN_COMMON fp_unavailable
 	bne	1f			/* if from user, just load it up */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	kernel_fp_unavailable_exception
+	bl	CFUNC(kernel_fp_unavailable_exception)
 0:	trap
 	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
 1:
@@ -1751,12 +1751,12 @@ BEGIN_FTR_SECTION
 	bne-	2f
 END_FTR_SECTION_IFSET(CPU_FTR_TM)
 #endif
-	bl	load_up_fpu
+	bl	CFUNC(load_up_fpu)
 	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	fp_unavailable_tm
+	bl	CFUNC(fp_unavailable_tm)
 	b	interrupt_return_srr
 #endif
 
@@ -1800,7 +1800,7 @@ EXC_VIRT_END(decrementer, 0x4900, 0x80)
 EXC_COMMON_BEGIN(decrementer_common)
 	GEN_COMMON decrementer
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	timer_interrupt
+	bl	CFUNC(timer_interrupt)
 	b	interrupt_return_srr
 
 
@@ -1886,9 +1886,9 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 	GEN_COMMON doorbell_super
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
-	bl	doorbell_exception
+	bl	CFUNC(doorbell_exception)
 #else
-	bl	unknown_async_exception
+	bl	CFUNC(unknown_async_exception)
 #endif
 	b	interrupt_return_srr
 
@@ -2052,7 +2052,7 @@ EXC_VIRT_END(single_step, 0x4d00, 0x100)
 EXC_COMMON_BEGIN(single_step_common)
 	GEN_COMMON single_step
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	single_step_exception
+	bl	CFUNC(single_step_exception)
 	b	interrupt_return_srr
 
 
@@ -2087,9 +2087,9 @@ EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
-	bl      do_bad_page_fault_segv
+	bl	CFUNC(do_bad_page_fault_segv)
 MMU_FTR_SECTION_ELSE
-	bl      unknown_exception
+	bl	CFUNC(unknown_exception)
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 	b       interrupt_return_hsrr
 
@@ -2115,7 +2115,7 @@ EXC_VIRT_END(h_instr_storage, 0x4e20, 0x20)
 EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_COMMON h_instr_storage
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unknown_exception
+	bl	CFUNC(unknown_exception)
 	b	interrupt_return_hsrr
 
 
@@ -2138,7 +2138,7 @@ EXC_VIRT_END(emulation_assist, 0x4e40, 0x20)
 EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_COMMON emulation_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	emulation_assist_interrupt
+	bl	CFUNC(emulation_assist_interrupt)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_hsrr
 
@@ -2198,7 +2198,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	__GEN_COMMON_BODY hmi_exception_early
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	hmi_exception_realmode
+	bl	CFUNC(hmi_exception_realmode)
 	cmpdi	cr0,r3,0
 	bne	1f
 
@@ -2216,7 +2216,7 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	handle_hmi_exception
+	bl	CFUNC(handle_hmi_exception)
 	b	interrupt_return_hsrr
 
 
@@ -2251,9 +2251,9 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_COMMON h_doorbell
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_PPC_DOORBELL
-	bl	doorbell_exception
+	bl	CFUNC(doorbell_exception)
 #else
-	bl	unknown_async_exception
+	bl	CFUNC(unknown_async_exception)
 #endif
 	b	interrupt_return_hsrr
 
@@ -2286,7 +2286,7 @@ EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
 EXC_COMMON_BEGIN(h_virt_irq_common)
 	GEN_COMMON h_virt_irq
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_IRQ
+	bl	CFUNC(do_IRQ)
 	b	interrupt_return_hsrr
 
 
@@ -2332,7 +2332,7 @@ EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
 EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_COMMON performance_monitor
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	performance_monitor_exception
+	bl	CFUNC(performance_monitor_exception)
 	b	interrupt_return_srr
 
 
@@ -2369,19 +2369,19 @@ BEGIN_FTR_SECTION
 	bne-	2f
   END_FTR_SECTION_NESTED(CPU_FTR_TM, CPU_FTR_TM, 69)
 #endif
-	bl	load_up_altivec
+	bl	CFUNC(load_up_altivec)
 	b	fast_interrupt_return_srr
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	altivec_unavailable_tm
+	bl	CFUNC(altivec_unavailable_tm)
 	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 #endif
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	altivec_unavailable_exception
+	bl	CFUNC(altivec_unavailable_exception)
 	b	interrupt_return_srr
 
 
@@ -2422,14 +2422,14 @@ BEGIN_FTR_SECTION
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 2:	/* User process was in a transaction */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	vsx_unavailable_tm
+	bl	CFUNC(vsx_unavailable_tm)
 	b	interrupt_return_srr
 #endif
 1:
 END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 #endif
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	vsx_unavailable_exception
+	bl	CFUNC(vsx_unavailable_exception)
 	b	interrupt_return_srr
 
 
@@ -2456,7 +2456,7 @@ EXC_VIRT_END(facility_unavailable, 0x4f60, 0x20)
 EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_COMMON facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	facility_unavailable_exception
+	bl	CFUNC(facility_unavailable_exception)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return_srr
 
@@ -2484,7 +2484,7 @@ EXC_VIRT_END(h_facility_unavailable, 0x4f80, 0x20)
 EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	GEN_COMMON h_facility_unavailable
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	facility_unavailable_exception
+	bl	CFUNC(facility_unavailable_exception)
 	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
 	b	interrupt_return_hsrr
 
@@ -2514,7 +2514,7 @@ EXC_VIRT_NONE(0x5200, 0x100)
 EXC_COMMON_BEGIN(cbe_system_error_common)
 	GEN_COMMON cbe_system_error
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	cbe_system_error_exception
+	bl	CFUNC(cbe_system_error_exception)
 	b	interrupt_return_hsrr
 
 #else /* CONFIG_CBE_RAS */
@@ -2545,7 +2545,7 @@ EXC_VIRT_END(instruction_breakpoint, 0x5300, 0x100)
 EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	GEN_COMMON instruction_breakpoint
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	instruction_breakpoint_exception
+	bl	CFUNC(instruction_breakpoint_exception)
 	b	interrupt_return_srr
 
 
@@ -2667,7 +2667,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 EXC_COMMON_BEGIN(denorm_exception_common)
 	GEN_COMMON denorm_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unknown_exception
+	bl	CFUNC(unknown_exception)
 	b	interrupt_return_hsrr
 
 
@@ -2684,7 +2684,7 @@ EXC_VIRT_NONE(0x5600, 0x100)
 EXC_COMMON_BEGIN(cbe_maintenance_common)
 	GEN_COMMON cbe_maintenance
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	cbe_maintenance_exception
+	bl	CFUNC(cbe_maintenance_exception)
 	b	interrupt_return_hsrr
 
 #else /* CONFIG_CBE_RAS */
@@ -2710,10 +2710,10 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 	GEN_COMMON altivec_assist
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 #ifdef CONFIG_ALTIVEC
-	bl	altivec_assist_exception
+	bl	CFUNC(altivec_assist_exception)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 #else
-	bl	unknown_exception
+	bl	CFUNC(unknown_exception)
 #endif
 	b	interrupt_return_srr
 
@@ -2731,7 +2731,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 EXC_COMMON_BEGIN(cbe_thermal_common)
 	GEN_COMMON cbe_thermal
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	cbe_thermal_exception
+	bl	CFUNC(cbe_thermal_exception)
 	b	interrupt_return_hsrr
 
 #else /* CONFIG_CBE_RAS */
@@ -2764,7 +2764,7 @@ EXC_COMMON_BEGIN(soft_nmi_common)
 	__GEN_COMMON_BODY soft_nmi
 
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	soft_nmi_interrupt
+	bl	CFUNC(soft_nmi_interrupt)
 
 	/* Clear MSR_RI before setting SRR0 and SRR1. */
 	li	r9,0
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 80106aaf0b7a..6b04f327263e 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -567,7 +567,7 @@ __boot_from_prom:
 
 	/* Do all of the interaction with OF client interface */
 	mr	r8,r26
-	bl	prom_init
+	bl	CFUNC(prom_init)
 #endif /* #CONFIG_PPC_OF_BOOT_TRAMPOLINE */
 
 	/* We never return. We also hit that trap if trying to boot
@@ -805,7 +805,7 @@ __secondary_start:
 	 * can turn it on below. This is a call to C, which is OK, we're still
 	 * running on the emergency stack.
 	 */
-	bl	early_setup_secondary
+	bl	CFUNC(early_setup_secondary)
 
 	/*
 	 * The primary has initialized our kernel stack for us in the paca, grab
@@ -844,7 +844,7 @@ start_secondary_prolog:
 	LOAD_PACA_TOC()
 	li	r3,0
 	std	r3,0(r1)		/* Zero the stack frame pointer	*/
-	bl	start_secondary
+	bl	CFUNC(start_secondary)
 	b	.
 /*
  * Reset stack pointer and call start_secondary
@@ -855,7 +855,7 @@ _GLOBAL(start_secondary_resume)
 	ld	r1,PACAKSAVE(r13)	/* Reload kernel stack pointer */
 	li	r3,0
 	std	r3,0(r1)		/* Zero the stack frame pointer	*/
-	bl	start_secondary
+	bl	CFUNC(start_secondary)
 	b	.
 #endif
 
@@ -959,7 +959,7 @@ start_here_multiplatform:
 	 */
 
 #ifdef CONFIG_KASAN
-	bl	kasan_early_init
+	bl	CFUNC(kasan_early_init)
 #endif
 	/* Restore parameters passed from prom_init/kexec */
 	mr	r3,r31
@@ -992,7 +992,7 @@ start_here_common:
 	stb	r0,PACAIRQHAPPENED(r13)
 
 	/* Generic kernel entry */
-	bl	start_kernel
+	bl	CFUNC(start_kernel)
 
 	/* Not reached */
 0:	trap
diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 6d5c105457dd..202fce2a9271 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -100,12 +100,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	mr	r9,r0
-	bl	system_call_exception
+	bl	CFUNC(system_call_exception)
 
 .Lsyscall_vectored_\name\()_exit:
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r5,1 /* scv */
-	bl	syscall_exit_prepare
+	bl	CFUNC(syscall_exit_prepare)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 .Lsyscall_vectored_\name\()_rst_start:
 	lbz	r11,PACAIRQHAPPENED(r13)
@@ -190,7 +190,7 @@ _ASM_NOKPROBE_SYMBOL(syscall_vectored_\name\()_restart)
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	syscall_exit_restart
+	bl	CFUNC(syscall_exit_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_vectored_\name\()_rst_start
 1:
@@ -290,12 +290,12 @@ END_BTB_FLUSH_SECTION
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	mr	r9,r0
-	bl	system_call_exception
+	bl	CFUNC(system_call_exception)
 
 .Lsyscall_exit:
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r5,0 /* !scv */
-	bl	syscall_exit_prepare
+	bl	CFUNC(syscall_exit_prepare)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 #ifdef CONFIG_PPC_BOOK3S
 .Lsyscall_rst_start:
@@ -383,7 +383,7 @@ _ASM_NOKPROBE_SYMBOL(syscall_restart)
 	addi	r4,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	syscall_exit_restart
+	bl	CFUNC(syscall_exit_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Lsyscall_rst_start
 1:
@@ -412,7 +412,7 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return_srr)
 	li	r3,0 /* 0 return value, no EMULATE_STACK_STORE */
 	bne+	.Lfast_kernel_interrupt_return_srr
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	unrecoverable_exception
+	bl	CFUNC(unrecoverable_exception)
 	b	. /* should not get here */
 #else
 	bne	.Lfast_user_interrupt_return_srr
@@ -430,7 +430,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
 interrupt_return_\srr\()_user: /* make backtraces match the _kernel variant */
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	interrupt_exit_user_prepare
+	bl	CFUNC(interrupt_exit_user_prepare)
 	cmpdi	r3,0
 	bne-	.Lrestore_nvgprs_\srr
 .Lrestore_nvgprs_\srr\()_cont:
@@ -529,7 +529,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_user_restart)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	interrupt_exit_user_restart
+	bl	CFUNC(interrupt_exit_user_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Linterrupt_return_\srr\()_user_rst_start
 1:
@@ -542,7 +542,7 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
 interrupt_return_\srr\()_kernel:
 _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	interrupt_exit_kernel_prepare
+	bl	CFUNC(interrupt_exit_kernel_prepare)
 
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 .Linterrupt_return_\srr\()_kernel_rst_start:
@@ -662,7 +662,7 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\()_kernel_restart)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	li	r11,IRQS_ALL_DISABLED
 	stb	r11,PACAIRQSOFTMASK(r13)
-	bl	interrupt_exit_kernel_restart
+	bl	CFUNC(interrupt_exit_kernel_restart)
 	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
 	b	.Linterrupt_return_\srr\()_kernel_rst_start
 1:
@@ -684,20 +684,20 @@ DEFINE_FIXED_SYMBOL(__end_soft_masked, text)
 
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
index fd6d8d3a548e..677464d387d9 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -430,7 +430,7 @@ _GLOBAL(kexec_sequence)
 1:
 	/* copy dest pages, flush whole dest image */
 	mr	r3,r29
-	bl	kexec_copy_flush	/* (image) */
+	bl	CFUNC(kexec_copy_flush)	/* (image) */
 
 	/* turn off mmu now if not done earlier */
 	cmpdi	r26,0
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 0c4ecc8fec5a..fd2ee40ce438 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -38,7 +38,7 @@
 	.else
 	addi		r4, r5, VDSO_DATA_OFFSET
 	.endif
-	bl		DOTSYM(\funct)
+	bl		DOTSYM(\funct)CFUNC()
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
 #ifdef __powerpc64__
 	PPC_LL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 7ded202bf995..6663540e53d0 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -379,7 +379,7 @@ kvm_secondary_got_guest:
 	bne	kvm_no_guest
 
 	li	r3,0			/* NULL argument */
-	bl	hmi_exception_realmode
+	bl	CFUNC(hmi_exception_realmode)
 /*
  * At this point we have finished executing in the guest.
  * We need to wait for hwthread_req to become zero, since
@@ -456,7 +456,7 @@ kvm_unsplit_nap:
 	cmpwi	r12, BOOK3S_INTERRUPT_HMI
 	bne	55f
 	li	r3, 0			/* NULL argument */
-	bl	hmi_exception_realmode
+	bl	CFUNC(hmi_exception_realmode)
 55:
 	/*
 	 * Ensure that secondary doesn't nap when it has
@@ -857,7 +857,7 @@ deliver_guest_interrupt:	/* r4 = vcpu, r13 = paca */
 	cmpdi	r0, 0
 	beq	71f
 	mr	r3, r4
-	bl	kvmppc_guest_entry_inject_int
+	bl	CFUNC(kvmppc_guest_entry_inject_int)
 	ld	r4, HSTATE_KVM_VCPU(r13)
 71:
 	ld	r6, VCPU_SRR0(r4)
@@ -1540,7 +1540,7 @@ kvmppc_guest_external:
 	/* External interrupt, first check for host_ipi. If this is
 	 * set, we know the host wants us out so let's do it now
 	 */
-	bl	kvmppc_read_intr
+	bl	CFUNC(kvmppc_read_intr)
 
 	/*
 	 * Restore the active volatile registers after returning from
@@ -1622,7 +1622,7 @@ kvmppc_hdsi:
 	/* Search the hash table. */
 	mr	r3, r9			/* vcpu pointer */
 	li	r7, 1			/* data fault */
-	bl	kvmppc_hpte_hv_fault
+	bl	CFUNC(kvmppc_hpte_hv_fault)
 	ld	r9, HSTATE_KVM_VCPU(r13)
 	ld	r10, VCPU_PC(r9)
 	ld	r11, VCPU_MSR(r9)
@@ -1698,7 +1698,7 @@ kvmppc_hisi:
 	mr	r4, r10
 	mr	r6, r11
 	li	r7, 0			/* instruction fault */
-	bl	kvmppc_hpte_hv_fault
+	bl	CFUNC(kvmppc_hpte_hv_fault)
 	ld	r9, HSTATE_KVM_VCPU(r13)
 	ld	r10, VCPU_PC(r9)
 	ld	r11, VCPU_MSR(r9)
@@ -2338,7 +2338,7 @@ hmi_realmode:
 	lbz	r0, HSTATE_PTID(r13)
 	cmpwi	r0, 0
 	bne	guest_exit_cont
-	bl	kvmppc_realmode_hmi_handler
+	bl	CFUNC(kvmppc_realmode_hmi_handler)
 	ld	r9, HSTATE_KVM_VCPU(r13)
 	li	r12, BOOK3S_INTERRUPT_HMI
 	b	guest_exit_cont
@@ -2409,7 +2409,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
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
index 0a42e1e7a577..6ec0baa88709 100644
--- a/arch/powerpc/platforms/pseries/hvCall.S
+++ b/arch/powerpc/platforms/pseries/hvCall.S
@@ -38,7 +38,7 @@ declare_var_end
 	std	r0,16(r1);					\
 	addi	r4,r1,STK_PARAM(FIRST_REG);			\
 	stdu	r1,-STACK_FRAME_OVERHEAD(r1);			\
-	bl	__trace_hcall_entry;				\
+	bl	CFUNC(__trace_hcall_entry);			\
 	ld	r3,STACK_FRAME_OVERHEAD+STK_PARAM(R3)(r1);	\
 	ld	r4,STACK_FRAME_OVERHEAD+STK_PARAM(R4)(r1);	\
 	ld	r5,STACK_FRAME_OVERHEAD+STK_PARAM(R5)(r1);	\
@@ -57,7 +57,7 @@ declare_var_end
 	std	r3,STACK_FRAME_OVERHEAD+STK_PARAM(R3)(r1);	\
 	mr	r4,r3;						\
 	mr	r3,r0;						\
-	bl	__trace_hcall_exit;				\
+	bl	CFUNC(__trace_hcall_exit);			\
 	ld	r0,STACK_FRAME_OVERHEAD+16(r1);			\
 	addi	r1,r1,STACK_FRAME_OVERHEAD;			\
 	ld	r3,STK_PARAM(R3)(r1);				\
-- 
2.37.2

