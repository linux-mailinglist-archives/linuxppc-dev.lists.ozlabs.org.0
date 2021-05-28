Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B258C393F92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:10:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzRv5YK5z3by5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:10:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mFAIZcRS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mFAIZcRS; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPB4TLPz304T
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:14 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id y15so2733193pfn.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I89Bmj10OVG1qdTTxC91zsG3YD/LgEw4pkNe4d5UtP4=;
 b=mFAIZcRSgoykY4C/gYxRgEAF1c6M2E9XR32yE8dqe09QlcJIL4PMwdY4DBQDbae+EW
 s8qLyefIf+XP0lVduNWeVwL5x0Yf2noggDfFnuR8xXAmCp5SR1yrHHm7lDiuvm8vDDW/
 xQ291nekJXODaAuYQ1lEdKZctCnQvmTLGBrzdAzZYUmWs+FYJAbvbor1M+WtP3lvuv75
 SqaPNJCSD2DwHPQvQqYcYG4wyfNx/fMyddJosvGwDptOKN7D2db5m36NokG2sj6C2dm+
 arQ7/x7dnAYGcqWadNPL6D2gdHOEOQQJrMSHRhKyz8grBaDNN7Cqw39MSsWvtx8j7lIo
 2m9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I89Bmj10OVG1qdTTxC91zsG3YD/LgEw4pkNe4d5UtP4=;
 b=XWYddjV1Hih7vWTMozKxpdiXSutHPjLdSNcPodbvOwznHMfxZ553VmcwqsjoAK642N
 qQmSNQVWbKXcfuPLcCWEI2x4ExWCO6Y9/37TQwKCQ1MG2LDvNSisBuN46eKexgKJ/F8r
 lV+U+HULhsSgtMT24AscpTui02Sv0yDzWl/xYpPWJqlCcUVJbkJ4Gh52AOftU0JT1jFm
 lygUctGpabo3mxQvlQcz1qL79ApcTZQThg3FkLH6gqfAyd7CIVHZXNGUCEGuxsmjs9Pf
 MWNRw7PYtsKrFAK/ErtWnDywYjwntzUB4vYlI6maHa0Fq3F/vA3ipuExOaf0z3yM2X6L
 45gg==
X-Gm-Message-State: AOAM5337BAXlPrPHsxCXTQxp8BV+isaX4U6At2/JuadvPz66KldCnVHo
 vIPT8xM2c8FB2Zn66w5Yqjg=
X-Google-Smtp-Source: ABdhPJzD04RBWQ5dpACIFH3zU5/FiE1Lm+McY+MBq5MsZc1Cknjs5dEc4x4iRRutvCEU7SH7u7FwXw==
X-Received: by 2002:a65:4887:: with SMTP id n7mr7970730pgs.284.1622192892475; 
 Fri, 28 May 2021 02:08:12 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 05/32] KVM: PPC: Book3S 64: Move interrupt early register
 setup to KVM
Date: Fri, 28 May 2021 19:07:25 +1000
Message-Id: <20210528090752.3542186-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Like the earlier patch for hcalls, KVM interrupt entry requires a
different calling convention than the Linux interrupt handlers
set up. Move the code that converts from one to the other into KVM.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 131 +++++----------------------
 arch/powerpc/kvm/book3s_64_entry.S   |  50 +++++++++-
 2 files changed, 71 insertions(+), 110 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 03e2d65d3d3f..bf377bfeeb1a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -187,7 +187,6 @@ do_define_int n
 	.endif
 .endm
 
-#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 /*
  * All interrupts which set HSRR registers, as well as SRESET and MCE and
  * syscall when invoked with "sc 1" switch to MSR[HV]=1 (HVMODE) to be taken,
@@ -220,54 +219,25 @@ do_define_int n
  * to KVM to handle.
  */
 
-.macro KVMTEST name
+.macro KVMTEST name handler
+#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
 	lbz	r10,HSTATE_IN_GUEST(r13)
 	cmpwi	r10,0
-	bne	\name\()_kvm
-.endm
-
-.macro GEN_KVM name
-	.balign IFETCH_ALIGN_BYTES
-\name\()_kvm:
-
-BEGIN_FTR_SECTION
-	ld	r10,IAREA+EX_CFAR(r13)
-	std	r10,HSTATE_CFAR(r13)
-END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
-
-	ld	r10,IAREA+EX_CTR(r13)
-	mtctr	r10
-BEGIN_FTR_SECTION
-	ld	r10,IAREA+EX_PPR(r13)
-	std	r10,HSTATE_PPR(r13)
-END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
-	ld	r11,IAREA+EX_R11(r13)
-	ld	r12,IAREA+EX_R12(r13)
-	std	r12,HSTATE_SCRATCH0(r13)
-	sldi	r12,r9,32
-	ld	r9,IAREA+EX_R9(r13)
-	ld	r10,IAREA+EX_R10(r13)
 	/* HSRR variants have the 0x2 bit added to their trap number */
 	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
-	ori	r12,r12,(IVEC + 0x2)
+	li	r10,(IVEC + 0x2)
 	FTR_SECTION_ELSE
-	ori	r12,r12,(IVEC)
+	li	r10,(IVEC)
 	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	.elseif IHSRR
-	ori	r12,r12,(IVEC+ 0x2)
+	li	r10,(IVEC + 0x2)
 	.else
-	ori	r12,r12,(IVEC)
+	li	r10,(IVEC)
 	.endif
-	b	kvmppc_interrupt
-.endm
-
-#else
-.macro KVMTEST name
-.endm
-.macro GEN_KVM name
-.endm
+	bne	\handler
 #endif
+.endm
 
 /*
  * This is the BOOK3S interrupt entry code macro.
@@ -409,7 +379,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 DEFINE_FIXED_SYMBOL(\name\()_common_real)
 \name\()_common_real:
 	.if IKVM_REAL
-		KVMTEST \name
+		KVMTEST \name kvm_interrupt
 	.endif
 
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
@@ -432,7 +402,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
 DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 \name\()_common_virt:
 	.if IKVM_VIRT
-		KVMTEST \name
+		KVMTEST \name kvm_interrupt
 1:
 	.endif
 	.endif /* IVIRT */
@@ -446,7 +416,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_virt)
 DEFINE_FIXED_SYMBOL(\name\()_common_real)
 \name\()_common_real:
 	.if IKVM_REAL
-		KVMTEST \name
+		KVMTEST \name kvm_interrupt
 	.endif
 .endm
 
@@ -948,8 +918,6 @@ EXC_COMMON_BEGIN(system_reset_common)
 	EXCEPTION_RESTORE_REGS
 	RFI_TO_USER_OR_KERNEL
 
-	GEN_KVM system_reset
-
 
 /**
  * Interrupt 0x200 - Machine Check Interrupt (MCE).
@@ -1113,7 +1081,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
 	/*
 	 * Check if we are coming from guest. If yes, then run the normal
 	 * exception handler which will take the
-	 * machine_check_kvm->kvmppc_interrupt branch to deliver the MC event
+	 * machine_check_kvm->kvm_interrupt branch to deliver the MC event
 	 * to guest.
 	 */
 	lbz	r11,HSTATE_IN_GUEST(r13)
@@ -1183,8 +1151,6 @@ EXC_COMMON_BEGIN(machine_check_common)
 	bl	machine_check_exception
 	b	interrupt_return
 
-	GEN_KVM machine_check
-
 
 #ifdef CONFIG_PPC_P7_NAP
 /*
@@ -1319,8 +1285,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	REST_NVGPRS(r1)
 	b	interrupt_return
 
-	GEN_KVM data_access
-
 
 /**
  * Interrupt 0x380 - Data Segment Interrupt (DSLB).
@@ -1370,8 +1334,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	bl	do_bad_slb_fault
 	b	interrupt_return
 
-	GEN_KVM data_access_slb
-
 
 /**
  * Interrupt 0x400 - Instruction Storage Interrupt (ISI).
@@ -1408,8 +1370,6 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	b	interrupt_return
 
-	GEN_KVM instruction_access
-
 
 /**
  * Interrupt 0x480 - Instruction Segment Interrupt (ISLB).
@@ -1454,8 +1414,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	bl	do_bad_slb_fault
 	b	interrupt_return
 
-	GEN_KVM instruction_access_slb
-
 
 /**
  * Interrupt 0x500 - External Interrupt.
@@ -1500,8 +1458,6 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	bl	do_IRQ
 	b	interrupt_return
 
-	GEN_KVM hardware_interrupt
-
 
 /**
  * Interrupt 0x600 - Alignment Interrupt
@@ -1529,8 +1485,6 @@ EXC_COMMON_BEGIN(alignment_common)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
-	GEN_KVM alignment
-
 
 /**
  * Interrupt 0x700 - Program Interrupt (program check).
@@ -1638,8 +1592,6 @@ EXC_COMMON_BEGIN(program_check_common)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
-	GEN_KVM program_check
-
 
 /*
  * Interrupt 0x800 - Floating-Point Unavailable Interrupt.
@@ -1689,8 +1641,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	b	interrupt_return
 #endif
 
-	GEN_KVM fp_unavailable
-
 
 /**
  * Interrupt 0x900 - Decrementer Interrupt.
@@ -1729,8 +1679,6 @@ EXC_COMMON_BEGIN(decrementer_common)
 	bl	timer_interrupt
 	b	interrupt_return
 
-	GEN_KVM decrementer
-
 
 /**
  * Interrupt 0x980 - Hypervisor Decrementer Interrupt.
@@ -1776,8 +1724,6 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 	ld	r13,PACA_EXGEN+EX_R13(r13)
 	HRFI_TO_KERNEL
 
-	GEN_KVM hdecrementer
-
 
 /**
  * Interrupt 0xa00 - Directed Privileged Doorbell Interrupt.
@@ -1817,8 +1763,6 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 #endif
 	b	interrupt_return
 
-	GEN_KVM doorbell_super
-
 
 EXC_REAL_NONE(0xb00, 0x100)
 EXC_VIRT_NONE(0x4b00, 0x100)
@@ -1868,7 +1812,7 @@ INT_DEFINE_END(system_call)
 	GET_PACA(r13)
 	std	r10,PACA_EXGEN+EX_R10(r13)
 	INTERRUPT_TO_KERNEL
-	KVMTEST system_call /* uses r10, branch to system_call_kvm */
+	KVMTEST system_call kvm_hcall /* uses r10, branch to kvm_hcall */
 	mfctr	r9
 #else
 	mr	r9,r13
@@ -1924,7 +1868,7 @@ EXC_VIRT_BEGIN(system_call, 0x4c00, 0x100)
 EXC_VIRT_END(system_call, 0x4c00, 0x100)
 
 #ifdef CONFIG_KVM_BOOK3S_64_HANDLER
-TRAMP_REAL_BEGIN(system_call_kvm)
+TRAMP_REAL_BEGIN(kvm_hcall)
 	mfctr	r10
 	SET_SCRATCH0(r10) /* Save r13 in SCRATCH0 */
 #ifdef CONFIG_RELOCATABLE
@@ -1964,8 +1908,6 @@ EXC_COMMON_BEGIN(single_step_common)
 	bl	single_step_exception
 	b	interrupt_return
 
-	GEN_KVM single_step
-
 
 /**
  * Interrupt 0xe00 - Hypervisor Data Storage Interrupt (HDSI).
@@ -2004,8 +1946,6 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 	b       interrupt_return
 
-	GEN_KVM h_data_storage
-
 
 /**
  * Interrupt 0xe20 - Hypervisor Instruction Storage Interrupt (HISI).
@@ -2031,8 +1971,6 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 	bl	unknown_exception
 	b	interrupt_return
 
-	GEN_KVM h_instr_storage
-
 
 /**
  * Interrupt 0xe40 - Hypervisor Emulation Assistance Interrupt.
@@ -2057,8 +1995,6 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
-	GEN_KVM emulation_assist
-
 
 /**
  * Interrupt 0xe60 - Hypervisor Maintenance Interrupt (HMI).
@@ -2130,16 +2066,12 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
 	EXCEPTION_RESTORE_REGS hsrr=1
 	GEN_INT_ENTRY hmi_exception, virt=0
 
-	GEN_KVM hmi_exception_early
-
 EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_COMMON hmi_exception
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	handle_hmi_exception
 	b	interrupt_return
 
-	GEN_KVM hmi_exception
-
 
 /**
  * Interrupt 0xe80 - Directed Hypervisor Doorbell Interrupt.
@@ -2170,8 +2102,6 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 #endif
 	b	interrupt_return
 
-	GEN_KVM h_doorbell
-
 
 /**
  * Interrupt 0xea0 - Hypervisor Virtualization Interrupt.
@@ -2198,8 +2128,6 @@ EXC_COMMON_BEGIN(h_virt_irq_common)
 	bl	do_IRQ
 	b	interrupt_return
 
-	GEN_KVM h_virt_irq
-
 
 EXC_REAL_NONE(0xec0, 0x20)
 EXC_VIRT_NONE(0x4ec0, 0x20)
@@ -2243,8 +2171,6 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	bl	performance_monitor_exception
 	b	interrupt_return
 
-	GEN_KVM performance_monitor
-
 
 /**
  * Interrupt 0xf20 - Vector Unavailable Interrupt.
@@ -2294,8 +2220,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	bl	altivec_unavailable_exception
 	b	interrupt_return
 
-	GEN_KVM altivec_unavailable
-
 
 /**
  * Interrupt 0xf40 - VSX Unavailable Interrupt.
@@ -2344,8 +2268,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	bl	vsx_unavailable_exception
 	b	interrupt_return
 
-	GEN_KVM vsx_unavailable
-
 
 /**
  * Interrupt 0xf60 - Facility Unavailable Interrupt.
@@ -2374,8 +2296,6 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
 	b	interrupt_return
 
-	GEN_KVM facility_unavailable
-
 
 /**
  * Interrupt 0xf60 - Hypervisor Facility Unavailable Interrupt.
@@ -2404,8 +2324,6 @@ EXC_COMMON_BEGIN(h_facility_unavailable_common)
 	REST_NVGPRS(r1) /* XXX Shouldn't be necessary in practice */
 	b	interrupt_return
 
-	GEN_KVM h_facility_unavailable
-
 
 EXC_REAL_NONE(0xfa0, 0x20)
 EXC_VIRT_NONE(0x4fa0, 0x20)
@@ -2435,8 +2353,6 @@ EXC_COMMON_BEGIN(cbe_system_error_common)
 	bl	cbe_system_error_exception
 	b	interrupt_return
 
-	GEN_KVM cbe_system_error
-
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1200, 0x100)
 EXC_VIRT_NONE(0x5200, 0x100)
@@ -2468,8 +2384,6 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
 	bl	instruction_breakpoint_exception
 	b	interrupt_return
 
-	GEN_KVM instruction_breakpoint
-
 
 EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
@@ -2590,8 +2504,6 @@ EXC_COMMON_BEGIN(denorm_exception_common)
 	bl	unknown_exception
 	b	interrupt_return
 
-	GEN_KVM denorm_exception
-
 
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_maintenance)
@@ -2609,8 +2521,6 @@ EXC_COMMON_BEGIN(cbe_maintenance_common)
 	bl	cbe_maintenance_exception
 	b	interrupt_return
 
-	GEN_KVM cbe_maintenance
-
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1600, 0x100)
 EXC_VIRT_NONE(0x5600, 0x100)
@@ -2641,8 +2551,6 @@ EXC_COMMON_BEGIN(altivec_assist_common)
 #endif
 	b	interrupt_return
 
-	GEN_KVM altivec_assist
-
 
 #ifdef CONFIG_CBE_RAS
 INT_DEFINE_BEGIN(cbe_thermal)
@@ -2660,8 +2568,6 @@ EXC_COMMON_BEGIN(cbe_thermal_common)
 	bl	cbe_thermal_exception
 	b	interrupt_return
 
-	GEN_KVM cbe_thermal
-
 #else /* CONFIG_CBE_RAS */
 EXC_REAL_NONE(0x1800, 0x100)
 EXC_VIRT_NONE(0x5800, 0x100)
@@ -2914,6 +2820,15 @@ TRAMP_REAL_BEGIN(rfscv_flush_fallback)
 
 USE_TEXT_SECTION()
 
+#ifdef CONFIG_KVM_BOOK3S_64_HANDLER
+kvm_interrupt:
+	/*
+	 * The conditional branch in KVMTEST can't reach all the way,
+	 * make a stub.
+	 */
+	b	kvmppc_interrupt
+#endif
+
 _GLOBAL(do_uaccess_flush)
 	UACCESS_FLUSH_FIXUP_SECTION
 	nop
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index f527e16707db..2c9d106145e8 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -44,15 +44,61 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	sldi	r12,r10,32
 	ori	r12,r12,0xc00
 	ld	r10,PACA_EXGEN+EX_R10(r13)
+	b	do_kvm_interrupt
 
+/*
+ * KVM interrupt entry occurs after GEN_INT_ENTRY runs, and follows that
+ * call convention:
+ *
+ * guest R9-R13, CTR, CFAR, PPR saved in PACA EX_xxx save area
+ * guest (H)DAR, (H)DSISR are also in the save area for relevant interrupts
+ * guest R13 also saved in SCRATCH0
+ * R13		= PACA
+ * R11		= (H)SRR0
+ * R12		= (H)SRR1
+ * R9		= guest CR
+ * PPR is set to medium
+ *
+ * With the addition for KVM:
+ * R10		= trap vector
+ */
 .global	kvmppc_interrupt
 .balign IFETCH_ALIGN_BYTES
 kvmppc_interrupt:
+	li	r11,PACA_EXGEN
+	cmpdi	r10,0x200
+	bgt+	1f
+	li	r11,PACA_EXMC
+	beq	1f
+	li	r11,PACA_EXNMI
+1:	add	r11,r11,r13
+
+BEGIN_FTR_SECTION
+	ld	r12,EX_CFAR(r11)
+	std	r12,HSTATE_CFAR(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
+	ld	r12,EX_CTR(r11)
+	mtctr	r12
+BEGIN_FTR_SECTION
+	ld	r12,EX_PPR(r11)
+	std	r12,HSTATE_PPR(r13)
+END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	ld	r12,EX_R12(r11)
+	std	r12,HSTATE_SCRATCH0(r13)
+	sldi	r12,r9,32
+	or	r12,r12,r10
+	ld	r9,EX_R9(r11)
+	ld	r10,EX_R10(r11)
+	ld	r11,EX_R11(r11)
+
+do_kvm_interrupt:
 	/*
-	 * Register contents:
+	 * Hcalls and other interrupts come here after normalising register
+	 * contents and save locations:
+	 *
 	 * R12		= (guest CR << 32) | interrupt vector
 	 * R13		= PACA
-	 * guest R12 saved in shadow VCPU SCRATCH0
+	 * guest R12 saved in shadow HSTATE_SCRATCH0
 	 * guest R13 saved in SPRN_SCRATCH0
 	 */
 	std	r9,HSTATE_SCRATCH2(r13)
-- 
2.23.0

