Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BA8A8339
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:52:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NkHc73WhzDqtt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:52:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uVlFNQNe"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj3Y1CBLzDqcS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:57 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id x127so407488pfb.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPiYcPEfW5iDrGKQ8D4NBXDtbbHjVa8ocsAVVgXVwao=;
 b=uVlFNQNeRsqlYr3mJ5+5MuMssmTF/w5JcYc9ZUC0KOY5Y+2U0kaIRQf2eM83U0qvFR
 8ZybsP4c5RRR81bivwnBRUBK7m08JXj0Mv4NMinkWv3grk5i/rd6WjdatHfX3fkUvA/v
 FM4YfimOXvSEyqK4xADTedqyW7TQ2e9/2K6NBVNFOIuKVRet4EijmFr8Dw/QW1H2pc/n
 ga25hTwvYdfZuqrHptiEusgoBK8+9nK1yuE/kz/iJ0MaQ6HO66Kx2qmOUnVAGc2Za0D6
 Lomf8o8+xIWV3lEr98efkv7GNxvx+WyleYPYJcca9oi87EYRhHMDwVtiNWAPZ0h+7hsJ
 2SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPiYcPEfW5iDrGKQ8D4NBXDtbbHjVa8ocsAVVgXVwao=;
 b=LSnwiUsmPatKEN686uC5CQhXW276xIDEDSMJ+b029Ip5c4kca4ycZSYe3ZT0Ty7T9T
 aJ966QVJejp9jTESBzWOHFZvOPzaAmvkuwIfVitsPezFmIaA6gFkNcXbaRumvDHEAZAm
 WONRB6CQ6i6DDKdxIN/t4VzzNwRf/PpkeJpS6M2D7jdxuQb9J/1RMXd3/fiR0uXlvI4t
 uUrGKAI1AmWfLe1+q068Va+eMxsbtgHkb1t2KMOpPrlpa6i01cV+1fW34M6Ehti8HXAh
 IU2xuPecZ24IIv58K5sV58CIPV4kyxz+qjUj909iVDCQ3AhzJQFc9YpN75MA89guyiBe
 CYoA==
X-Gm-Message-State: APjAAAWpLaagSBQxG9ITHZW1a+NKqj/pKiDerZ+Is4INtdp768MmN/4T
 t1Cr83X8YfQdc2yRRitI+l1a6deK
X-Google-Smtp-Source: APXvYqyxIrgWEcWrWUcv6DkkbeUytzwMocWTY3ZYhyvnDyvhVCpTPxMlkNR3v75Etfrqxjhw/dkB1Q==
X-Received: by 2002:a17:90a:890c:: with SMTP id
 u12mr4536334pjn.124.1567598214637; 
 Wed, 04 Sep 2019 04:56:54 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 19/20] powerpc/64s/exception: add more comments for
 interrupt handlers
Date: Wed,  4 Sep 2019 21:55:34 +1000
Message-Id: <20190904115535.18559-20-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904115535.18559-1-npiggin@gmail.com>
References: <20190904115535.18559-1-npiggin@gmail.com>
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

A few of the non-standard handlers are left uncommented. Some more
description could be added to some.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 391 ++++++++++++++++++++++++---
 1 file changed, 353 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 413876293659..5171ed0e5f68 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -121,26 +121,26 @@ name:
 /*
  * Interrupt code generation macros
  */
-#define IVEC		.L_IVEC_\name\()
-#define IHSRR		.L_IHSRR_\name\()
-#define IHSRR_IF_HVMODE	.L_IHSRR_IF_HVMODE_\name\()
-#define IAREA		.L_IAREA_\name\()
-#define IVIRT		.L_IVIRT_\name\()
-#define IISIDE		.L_IISIDE_\name\()
-#define IDAR		.L_IDAR_\name\()
-#define IDSISR		.L_IDSISR_\name\()
-#define ISET_RI		.L_ISET_RI_\name\()
-#define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\()
-#define IREALMODE_COMMON	.L_IREALMODE_COMMON_\name\()
-#define IMASK		.L_IMASK_\name\()
-#define IKVM_SKIP	.L_IKVM_SKIP_\name\()
-#define IKVM_REAL	.L_IKVM_REAL_\name\()
+#define IVEC		.L_IVEC_\name\()	/* Interrupt vector address */
+#define IHSRR		.L_IHSRR_\name\()	/* Sets SRR or HSRR registers */
+#define IHSRR_IF_HVMODE	.L_IHSRR_IF_HVMODE_\name\() /* HSRR if HV else SRR */
+#define IAREA		.L_IAREA_\name\()	/* PACA save area */
+#define IVIRT		.L_IVIRT_\name\()	/* Has virt mode entry point */
+#define IISIDE		.L_IISIDE_\name\()	/* Uses SRR0/1 not DAR/DSISR */
+#define IDAR		.L_IDAR_\name\()	/* Uses DAR (or SRR0) */
+#define IDSISR		.L_IDSISR_\name\()	/* Uses DSISR (or SRR1) */
+#define ISET_RI		.L_ISET_RI_\name\()	/* Run common code w/ MSR[RI]=1 */
+#define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\() /* ENTRY branch to common */
+#define IREALMODE_COMMON	.L_IREALMODE_COMMON_\name\() /* Common runs in realmode */
+#define IMASK		.L_IMASK_\name\()	/* IRQ soft-mask bit */
+#define IKVM_SKIP	.L_IKVM_SKIP_\name\()	/* Generate KVM skip handler */
+#define IKVM_REAL	.L_IKVM_REAL_\name\()	/* Real entry tests KVM */
 #define __IKVM_REAL(name)	.L_IKVM_REAL_ ## name
-#define IKVM_VIRT	.L_IKVM_VIRT_\name\()
-#define ISTACK		.L_ISTACK_\name\()
+#define IKVM_VIRT	.L_IKVM_VIRT_\name\()	/* Virt entry tests KVM */
+#define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
 #define __ISTACK(name)	.L_ISTACK_ ## name
-#define IRECONCILE	.L_IRECONCILE_\name\()
-#define IKUAP		.L_IKUAP_\name\()
+#define IRECONCILE	.L_IRECONCILE_\name\()	/* Do RECONCILE_IRQ_STATE */
+#define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
 
 #define INT_DEFINE_BEGIN(n)						\
 .macro int_define_ ## n name
@@ -751,6 +751,39 @@ __start_interrupts:
 EXC_VIRT_NONE(0x4000, 0x100)
 
 
+/**
+ * Interrupt 0x100 - System Reset Interrupt (SRESET aka NMI).
+ * This is a non-maskable, asynchronous interrupt always taken in real-mode.
+ * It is caused by:
+ * - Wake from power-saving state, on powernv.
+ * - An NMI from another CPU, triggered by firmware or hypercall.
+ * - As crash/debug signal injected from BMC, firmware or hypervisor.
+ *
+ * Handling:
+ * Power-save wakeup is the only performance critical path, so this is
+ * determined quickly as possible first. In this case volatile registers
+ * can be discarded and SPRs like CFAR don't need to be read.
+ *
+ * If not a powersave wakeup, then it's run as a regular interrupt, however
+ * it uses its own stack and PACA save area to preserve the regular kernel
+ * environment for debugging.
+ *
+ * This interrupt is not maskable, so triggering it when MSR[RI] is clear,
+ * or SCRATCH0 is in use, etc. may cause a crash. It's also not entirely
+ * correct to switch to virtual mode to run the regular interrupt handler
+ * because it might be interrupted when the MMU is in a bad state (e.g., SLB
+ * is clear).
+ *
+ * FWNMI:
+ * PAPR specifies a "fwnmi" facility which sends the sreset to a different
+ * entry point with a different register set up. Some hypervisors will
+ * send the sreset to 0x100 in the guest if it is not fwnmi capable.
+ *
+ * KVM:
+ * Unlike most SRR interrupts, this may be taken by the host while executing
+ * in a guest, so a KVM test is required. KVM will pull the CPU out of guest
+ * mode and then raise the sreset.
+ */
 INT_DEFINE_BEGIN(system_reset)
 	IVEC=0x100
 	IAREA=PACA_EXNMI
@@ -826,6 +859,7 @@ TRAMP_REAL_BEGIN(system_reset_idle_wake)
  * Vectors for the FWNMI option.  Share common code.
  */
 TRAMP_REAL_BEGIN(system_reset_fwnmi)
+	/* XXX: fwnmi guest could run a nested/PR guest, so why no test?  */
 	__IKVM_REAL(system_reset)=0
 	GEN_INT_ENTRY system_reset, virt=0
 
@@ -892,6 +926,44 @@ EXC_COMMON_BEGIN(system_reset_common)
 	GEN_KVM system_reset
 
 
+/**
+ * Interrupt 0x200 - Machine Check Interrupt (MCE).
+ * This is a non-maskable interrupt always taken in real-mode. It can be
+ * synchronous or asynchronous, caused by hardware or software, and it may be
+ * taken in a power-saving state.
+ *
+ * Handling:
+ * Similarly to system reset, this uses its own stack and PACA save area,
+ * the difference is re-entrancy is allowed on the machine check stack.
+ *
+ * machine_check_early is run in real mode, and carefully decodes the
+ * machine check and tries to handle it (e.g., flush the SLB if there was an
+ * error detected there), determines if it was recoverable and logs the
+ * event.
+ *
+ * Then, depending on the execution context when the interrupt is taken, there
+ * are 3 main actions:
+ * - Executing in kernel mode. The event is queued with irq_work, which means
+ *   it is handled when it is next safe to do so (i.e., the kernel has enabled
+ *   interrupts), which could be immediately when the interrupt returns. This
+ *   avoids nasty issues like switching to virtual mode when the MMU is in a
+ *   bad state, or when executing OPAL code. (SRESET is exposed to such issues,
+ *   but it has different priorities). Check to see if the CPU was in power
+ *   save, and return via the wake up code if it was.
+ *
+ * - Executing in user mode. machine_check_exception is run like a normal
+ *   interrupt handler, which processes the data generated by the early handler.
+ *
+ * - Executing in guest mode. The interrupt is run with its KVM test, and
+ *   branches to KVM to deal with. KVM may queue the event for the host
+ *   to report later.
+ *
+ * This interrupt is not maskable, so if it triggers when MSR[RI] is clear,
+ * or SCRATCH0 is in use, it may cause a crash.
+ *
+ * KVM:
+ * See SRESET.
+ */
 INT_DEFINE_BEGIN(machine_check_early)
 	IVEC=0x200
 	IAREA=PACA_EXMC
@@ -1151,19 +1223,28 @@ END_FTR_SECTION_IFSET(CPU_FTR_HVMODE)
 
 
 /**
- * 0x300 - Data Storage Interrupt (DSI)
- * This interrupt is generated due to a data access which does not have a valid
- * page table entry with permissions to allow the data access to be performed.
- * DAWR matches also fault here, as do RC updates, and minor misc errors e.g.,
- * copy/paste, AMO, certain invalid CI accesses, etc.
+ * Interrupt 0x300 - Data Storage Interrupt (DSI).
+ * This is a synchronous interrupt generated due to a data access exception,
+ * e.g., a load orstore which does not have a valid page table entry with
+ * permissions. DAWR matches also fault here, as do RC updates, and minor misc
+ * errors e.g., copy/paste, AMO, certain invalid CI accesses, etc.
+ *
+ * Handling:
+ * - Hash MMU
+ *   Go to do_hash_page first to see if the HPT can be filled from an entry in
+ *   the Linux page table. Hash faults can hit in kernel mode in a fairly
+ *   arbitrary state (e.g., interrupts disabled, locks held) when accessing
+ *   "non-bolted" regions, e.g., vmalloc space. However these should always be
+ *   backed by Linux page tables.
  *
- * This interrupt is delivered to the guest (HV bit unchanged).
+ *   If none is found, do a Linux page fault. Linux page faults can happen in
+ *   kernel mode due to user copy operations of course.
  *
- * Linux HPT responds by first attempting to refill the hash table from the
- * Linux page table, then going to a full page fault if the Linux page table
- * entry was insufficient. RPT goes straight to full page fault.
+ * - Radix MMU
+ *   The hardware loads from the Linux page table directly, so a fault goes
+ *   immediately to Linux page fault.
  *
- * PR KVM ...?
+ * Conditions like DAWR match are handled on the way in to Linux page fault.
  */
 INT_DEFINE_BEGIN(data_access)
 	IVEC=0x300
@@ -1194,6 +1275,24 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	GEN_KVM data_access
 
 
+/**
+ * Interrupt 0x380 - Data Segment Interrupt (DSLB).
+ * This is a synchronous interrupt in response to an MMU fault missing SLB
+ * entry for HPT, or an address outside RPT translation range.
+ *
+ * Handling:
+ * - HPT:
+ *   This refills the SLB, or reports an access fault similarly to a bad page
+ *   fault. When coming from user-mode, the SLB handler may access any kernel
+ *   data, though it may itself take a DSLB. When coming from kernel mode,
+ *   recursive faults must be avoided so access is restricted to the kernel
+ *   image text/data, kernel stack, and any data allocated below
+ *   ppc64_bolted_size (first segment). The kernel handler must avoid stomping
+ *   on user-handler data structures.
+ *
+ * A dedicated save area EXSLB is used (XXX: but it actually need not be
+ * these days, we could use EXGEN).
+ */
 INT_DEFINE_BEGIN(data_access_slb)
 	IVEC=0x380
 	IAREA=PACA_EXSLB
@@ -1236,6 +1335,15 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	GEN_KVM data_access_slb
 
 
+/**
+ * Interrupt 0x400 - Instruction Storage Interrupt (ISI).
+ * This is a synchronous interrupt in response to an MMU fault due to an
+ * instruction fetch.
+ *
+ * Handling:
+ * Similar to DSI, though in response to fetch. The faulting address is found
+ * in SRR0 (rather than DAR), and status in SRR1 (rather than DSISR).
+ */
 INT_DEFINE_BEGIN(instruction_access)
 	IVEC=0x400
 	IISIDE=1
@@ -1265,6 +1373,15 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	GEN_KVM instruction_access
 
 
+/**
+ * Interrupt 0x480 - Instruction Segment Interrupt (ISLB).
+ * This is a synchronous interrupt in response to an MMU fault due to an
+ * instruction fetch.
+ *
+ * Handling:
+ * Similar to DSLB, though in response to fetch. The faulting address is found
+ * in SRR0 (rather than DAR).
+ */
 INT_DEFINE_BEGIN(instruction_access_slb)
 	IVEC=0x480
 	IAREA=PACA_EXSLB
@@ -1307,6 +1424,29 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	GEN_KVM instruction_access_slb
 
 
+/**
+ * Interrupt 0x500 - External Interrupt.
+ * This is an asynchronous maskable interrupt in response to an "external
+ * exception" from the interrupt controller or hypervisor (e.g., device
+ * interrupt). It is maskable in hardware by clearing MSR[EE], and
+ * soft-maskable with IRQS_DISABLED mask (i.e., local_irq_disable()).
+ *
+ * When running in HV mode, Linux sets up the LPCR[LPES] bit such that
+ * interrupts are delivered with HSRR registers, guests use SRRs, which
+ * reqiures IHSRR_IF_HVMODE.
+ *
+ * On bare metal POWER9 and later, Linux sets the LPCR[HVICE] bit such that
+ * external interrupts are delivered as Hypervisor Virtualization Interrupts
+ * rather than External Interrupts.
+ *
+ * Handling:
+ * This calls into Linux IRQ handler. NVGPRs are not saved to reduce overhead,
+ * because registers at the time of the interrupt are not so important as it is
+ * asynchronous.
+ *
+ * If soft masked, the masked handler will note the pending interrupt for
+ * replay, and clear MSR[EE] in the interrupted context.
+ */
 INT_DEFINE_BEGIN(hardware_interrupt)
 	IVEC=0x500
 	IHSRR_IF_HVMODE=1
@@ -1332,6 +1472,10 @@ EXC_COMMON_BEGIN(hardware_interrupt_common)
 	GEN_KVM hardware_interrupt
 
 
+/**
+ * Interrupt 0x600 - Alignment Interrupt
+ * This is a synchronous interrupt in response to data alignment fault.
+ */
 INT_DEFINE_BEGIN(alignment)
 	IVEC=0x600
 	IDAR=1
@@ -1355,6 +1499,15 @@ EXC_COMMON_BEGIN(alignment_common)
 	GEN_KVM alignment
 
 
+/**
+ * Interrupt 0x700 - Program Interrupt (program check).
+ * This is a synchronous interrupt in response to various instruction faults:
+ * traps, privilege errors, TM errors, floating point exceptions.
+ *
+ * Handling:
+ * This interrupt may use the "emergency stack" in some cases when being taken
+ * from kernel context, which complicates handling.
+ */
 INT_DEFINE_BEGIN(program_check)
 	IVEC=0x700
 	IKVM_REAL=1
@@ -1408,6 +1561,15 @@ EXC_COMMON_BEGIN(program_check_common)
 	GEN_KVM program_check
 
 
+/*
+ * Interrupt 0x800 - Floating-Point Unavailable Interrupt.
+ * This is a synchronous interrupt in response to executing an fp instruction
+ * with MSR[FP]=0.
+ *
+ * Handling:
+ * This will load FP registers and enable the FP bit if coming from userspace,
+ * otherwise report a bad kernel use of FP.
+ */
 INT_DEFINE_BEGIN(fp_unavailable)
 	IVEC=0x800
 	IRECONCILE=0
@@ -1453,6 +1615,23 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
 	GEN_KVM fp_unavailable
 
 
+/**
+ * Interrupt 0x900 - Decrementer Interrupt.
+ * This is an asynchronous interrupt in response to a decrementer exception
+ * (e.g., DEC has wrapped below zero). It is maskable in hardware by clearing
+ * MSR[EE], and soft-maskable with IRQS_DISABLED mask (i.e.,
+ * local_irq_disable()).
+ *
+ * Handling:
+ * This calls into Linux timer handler. NVGPRs are not saved (see 0x500).
+ *
+ * If soft masked, the masked handler will note the pending interrupt for
+ * replay, and bump the decrementer to a high value, leaving MSR[EE] enabled
+ * in the interrupted context.
+ * If PPC_WATCHDOG is configured, the soft masked handler will actually set
+ * things back up to run soft_nmi_interrupt as a regular interrupt handler
+ * on the emergency stack.
+ */
 INT_DEFINE_BEGIN(decrementer)
 	IVEC=0x900
 	IMASK=IRQS_DISABLED
@@ -1476,6 +1655,16 @@ EXC_COMMON_BEGIN(decrementer_common)
 	GEN_KVM decrementer
 
 
+/**
+ * Interrupt 0x980 - Hypervisor Decrementer Interrupt.
+ * This is an asynchronous interrupt, similar to 0x900 but for the HDEC
+ * register.
+ *
+ * Handling:
+ * Linux does not use this outside KVM where it's used to keep a host timer
+ * while the guest is given control of DEC. It should normally be caught by
+ * the KVM test and routed there.
+ */
 INT_DEFINE_BEGIN(hdecrementer)
 	IVEC=0x980
 	IHSRR=1
@@ -1514,6 +1703,20 @@ EXC_COMMON_BEGIN(hdecrementer_common)
 	GEN_KVM hdecrementer
 
 
+/**
+ * Interrupt 0xa00 - Directed Privileged Doorbell Interrupt.
+ * This is an asynchronous interrupt in response to a msgsndp doorbell.
+ * It is maskable in hardware by clearing MSR[EE], and soft-maskable with
+ * IRQS_DISABLED mask (i.e., local_irq_disable()).
+ *
+ * Handling:
+ * Guests may use this for IPIs between threads in a core if the
+ * hypervisor supports it. NVGPRS are not saved (see 0x500).
+ *
+ * If soft masked, the masked handler will note the pending interrupt for
+ * replay, leaving MSR[EE] enabled in the interrupted context because the
+ * doorbells are edge triggered.
+ */
 INT_DEFINE_BEGIN(doorbell_super)
 	IVEC=0xa00
 	IMASK=IRQS_DISABLED
@@ -1544,16 +1747,20 @@ EXC_COMMON_BEGIN(doorbell_super_common)
 EXC_REAL_NONE(0xb00, 0x100)
 EXC_VIRT_NONE(0x4b00, 0x100)
 
-/*
- * system call / hypercall (0xc00, 0x4c00)
- *
- * The system call exception is invoked with "sc 0" and does not alter HV bit.
- *
- * The hypercall is invoked with "sc 1" and sets HV=1.
+/**
+ * Interrupt 0xc00 - System Call Interrupt (syscall, hcall).
+ * This is a synchronous interrupt invoked with the "sc" instruction. The
+ * system call is invoked with "sc 0" and does not alter the HV bit, so it
+ * is directed to the currently running OS. The hypercall is invoked with
+ * "sc 1" and it sets HV=1, so it elevates to hypervisor.
  *
  * In HPT, sc 1 always goes to 0xc00 real mode. In RADIX, sc 1 can go to
  * 0x4c00 virtual mode.
  *
+ * Handling:
+ * If the KVM test fires then it was due to a hypercall and is accordingly
+ * routed to KVM. Otherwise this executes a normal Linux system call.
+ *
  * Call convention:
  *
  * syscall register convention is in Documentation/powerpc/syscall64-abi.rst
@@ -1697,6 +1904,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 #endif
 
 
+/**
+ * Interrupt 0xd00 - Trace Interrupt.
+ * This is a synchronous interrupt in response to instruction step or
+ * breakpoint faults.
+ */
 INT_DEFINE_BEGIN(single_step)
 	IVEC=0xd00
 	IKVM_REAL=1
@@ -1718,6 +1930,18 @@ EXC_COMMON_BEGIN(single_step_common)
 	GEN_KVM single_step
 
 
+/**
+ * Interrupt 0xe00 - Hypervisor Data Storage Interrupt (HDSI).
+ * This is a synchronous interrupt in response to an MMU fault caused by a
+ * guest data access.
+ *
+ * Handling:
+ * This should always get routed to KVM. In radix MMU mode, this is caused
+ * by a guest nested radix access that can't be performed due to the
+ * partition scope page table. In hash mode, this can be caused by guests
+ * running with translation disabled (virtual real mode) or with VPM enabled.
+ * KVM will update the page table structures or disallow the access.
+ */
 INT_DEFINE_BEGIN(h_data_storage)
 	IVEC=0xe00
 	IHSRR=1
@@ -1750,6 +1974,11 @@ ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
 	GEN_KVM h_data_storage
 
 
+/**
+ * Interrupt 0xe20 - Hypervisor Instruction Storage Interrupt (HISI).
+ * This is a synchronous interrupt in response to an MMU fault caused by a
+ * guest instruction fetch, similar to HDSI.
+ */
 INT_DEFINE_BEGIN(h_instr_storage)
 	IVEC=0xe20
 	IHSRR=1
@@ -1773,6 +2002,9 @@ EXC_COMMON_BEGIN(h_instr_storage_common)
 	GEN_KVM h_instr_storage
 
 
+/**
+ * Interrupt 0xe40 - Hypervisor Emulation Assistance Interrupt.
+ */
 INT_DEFINE_BEGIN(emulation_assist)
 	IVEC=0xe40
 	IHSRR=1
@@ -1796,10 +2028,29 @@ EXC_COMMON_BEGIN(emulation_assist_common)
 	GEN_KVM emulation_assist
 
 
-/*
- * hmi_exception trampoline is a special case. It jumps to hmi_exception_early
- * first, and then eventaully from there to the trampoline to get into virtual
- * mode.
+/**
+ * Interrupt 0xe60 - Hypervisor Maintenance Interrupt (HMI).
+ * This is an asynchronous interrupt caused by a Hypervisor Maintenance
+ * Exception. It is always taken in real mode but uses HSRR registers
+ * unlike SRESET and MCE.
+ *
+ * It is maskable in hardware by clearing MSR[EE], and partially soft-maskable
+ * with IRQS_DISABLED mask (i.e., local_irq_disable()).
+ *
+ * Handling:
+ * This is a special case, this is handled similarly to machine checks, with an
+ * initial real mode handler that is not soft-masked, which attempts to fix the
+ * problem. Then a regular handler which is soft-maskable and reports the
+ * problem.
+ *
+ * The emergency stack is used for the early real mode handler.
+ *
+ * XXX: unclear why MCE and HMI schemes could not be made common, e.g.,
+ * either use soft-masking for the MCE, or use irq_work for the HMI.
+ *
+ * KVM:
+ * Unlike MCE, this calls into KVM without calling the real mode handler
+ * first.
  */
 INT_DEFINE_BEGIN(hmi_exception_early)
 	IVEC=0xe60
@@ -1860,6 +2111,11 @@ EXC_COMMON_BEGIN(hmi_exception_common)
 	GEN_KVM hmi_exception
 
 
+/**
+ * Interrupt 0xe80 - Directed Hypervisor Doorbell Interrupt.
+ * This is an asynchronous interrupt in response to a msgsnd doorbell.
+ * Similar to the 0xa00 doorbell but for host rather than guest.
+ */
 INT_DEFINE_BEGIN(h_doorbell)
 	IVEC=0xe80
 	IHSRR=1
@@ -1889,6 +2145,11 @@ EXC_COMMON_BEGIN(h_doorbell_common)
 	GEN_KVM h_doorbell
 
 
+/**
+ * Interrupt 0xea0 - Hypervisor Virtualization Interrupt.
+ * This is an asynchronous interrupt in response to an "external exception".
+ * Similar to 0x500 but for host only.
+ */
 INT_DEFINE_BEGIN(h_virt_irq)
 	IVEC=0xea0
 	IHSRR=1
@@ -1920,6 +2181,22 @@ EXC_REAL_NONE(0xee0, 0x20)
 EXC_VIRT_NONE(0x4ee0, 0x20)
 
 
+/*
+ * Interrupt 0xf00 - Performance Monitor Interrupt (PMI, PMU).
+ * This is an asynchronous interrupt in response to a PMU exception.
+ * It is maskable in hardware by clearing MSR[EE], and soft-maskable with
+ * IRQS_PMI_DISABLED mask (NOTE: NOT local_irq_disable()).
+ *
+ * Handling:
+ * This calls into the perf subsystem.
+ *
+ * Like the watchdog soft-nmi, it appears an NMI interrupt to Linux, in that it
+ * runs under local_irq_disable. However it may be soft-masked in
+ * powerpc-specific code.
+ *
+ * If soft masked, the masked handler will note the pending interrupt for
+ * replay, and clear MSR[EE] in the interrupted context.
+ */
 INT_DEFINE_BEGIN(performance_monitor)
 	IVEC=0xf00
 	IMASK=IRQS_PMI_DISABLED
@@ -1943,6 +2220,12 @@ EXC_COMMON_BEGIN(performance_monitor_common)
 	GEN_KVM performance_monitor
 
 
+/**
+ * Interrupt 0xf20 - Vector Unavailable Interrupt.
+ * This is a synchronous interrupt in response to
+ * executing a vector (or altivec) instruction with MSR[VEC]=0.
+ * Similar to FP unavailable.
+ */
 INT_DEFINE_BEGIN(altivec_unavailable)
 	IVEC=0xf20
 	IRECONCILE=0
@@ -1991,6 +2274,12 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
 	GEN_KVM altivec_unavailable
 
 
+/**
+ * Interrupt 0xf40 - VSX Unavailable Interrupt.
+ * This is a synchronous interrupt in response to
+ * executing a VSX instruction with MSR[VSX]=0.
+ * Similar to FP unavailable.
+ */
 INT_DEFINE_BEGIN(vsx_unavailable)
 	IVEC=0xf40
 	IRECONCILE=0
@@ -2038,6 +2327,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	GEN_KVM vsx_unavailable
 
 
+/**
+ * Interrupt 0xf60 - Facility Unavailable Interrupt.
+ * This is a synchronous interrupt in response to
+ * executing an instruction without access to the facility that can be
+ * resolved by the OS (e.g., FSCR, MSR).
+ * Similar to FP unavailable.
+ */
 INT_DEFINE_BEGIN(facility_unavailable)
 	IVEC=0xf60
 	IKVM_REAL=1
@@ -2059,6 +2355,13 @@ EXC_COMMON_BEGIN(facility_unavailable_common)
 	GEN_KVM facility_unavailable
 
 
+/**
+ * Interrupt 0xf60 - Hypervisor Facility Unavailable Interrupt.
+ * This is a synchronous interrupt in response to
+ * executing an instruction without access to the facility that can only
+ * be resolved in HV mode (e.g., HFSCR).
+ * Similar to FP unavailable.
+ */
 INT_DEFINE_BEGIN(h_facility_unavailable)
 	IVEC=0xf80
 	IHSRR=1
@@ -2146,6 +2449,18 @@ EXC_COMMON_BEGIN(instruction_breakpoint_common)
 EXC_REAL_NONE(0x1400, 0x100)
 EXC_VIRT_NONE(0x5400, 0x100)
 
+/**
+ * Interrupt 0x1500 - Soft Patch Interrupt
+ *
+ * Handling:
+ * This is an implementation specific interrupt which can be used for a
+ * range of exceptions.
+ *
+ * This interrupt handler is unique in that it runs the denormal assist
+ * code even for guests (and even in guest context) without going to KVM,
+ * for speed. POWER9 does not raise denorm exceptions, so this special case
+ * could be phased out in future to reduce special cases.
+ */
 INT_DEFINE_BEGIN(denorm_exception)
 	IVEC=0x1500
 	IHSRR=1
-- 
2.22.0

