Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0EE3ECF6F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 09:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp5VY0fBTz3dKL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 17:33:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=aQNfVaYY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aQNfVaYY; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp5R640Jvz30Lw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 17:30:10 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id c4so3575478plh.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 00:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WdMIcmDur/dEOnJ/wcZTWJ1H/0AhuxtCMQJS6VSmg/w=;
 b=aQNfVaYYWZ9RX0VZVMy9EJzOwrYdNtDBRNuAolXgQiH/3lMPLPPa8K/AS1qbvW4Tn8
 fFuwMEfwmuHV4xhsnGrV/MC7p7P/MBG/GsmgIBa2ny9azBkINlj7VQ8U1uemB8jMKdgF
 BoXgbXZHtDeaf/RM3uaFt2v4MlK8D+qin9KGUy/DP1HLpTLrJauSn5IO4C68LXdMsfyu
 j0KrfDDtSYBodVdBgT2C/50wdrQwGRZ5mcGECLY9DK0WmmGM/veHcuXV5rskdaujssUE
 pQdcCAzN7iILarlUj+5FsgEXV4xjSHGHXhkND/Nlwk4ml6GBK814XO/+HapyYSQz3NEo
 UYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WdMIcmDur/dEOnJ/wcZTWJ1H/0AhuxtCMQJS6VSmg/w=;
 b=aQc3+GchqIYV4M1J2RXpXnq4cfkjI65cf1a3Mu5/KXBKsphaBl4C29Pt/phXE9lkMA
 iBhpabeoPkCGnPqosc2UBHOrh7Ip5pzIMbA5sgnaGUygZnMp+CySkeS/nwvCrPktEMtS
 q/U/EGl+4Dg2VDf7G1Mp//qpEvqPzTIHhvRZQ0l8cqFqG9Qah/hre49Lqmipgt+MRDLs
 3LaOfnR2gSxQzjTj/myaM9Y8I2ZxUlTyc8mN8N06ZQbfE8P4WOjVj9ihm5Hk9Y+L5Ubi
 tQRS7cavANaJxB7INabvG3YTnbZbdaeBpGEBk9MEbnxJL/937twv53gXxtlXRG+2EZwQ
 Y2yw==
X-Gm-Message-State: AOAM532uIk5+NnRpAusOV1c/uyxfoeCN/EAu8jNP8JQdmUPhtdCzdUAu
 n4tjaY7s3/f85AKUe5rUCvOgPDApE4I=
X-Google-Smtp-Source: ABdhPJw3erlt0aXMDlQj3Fn6t0z4yzfPBD9BK3mPr8cX7fGAzvQX526AzsgRT8bl1jaLP8I7toInBA==
X-Received: by 2002:a05:6a00:228d:b0:3e1:aba4:8e3 with SMTP id
 f13-20020a056a00228d00b003e1aba408e3mr5859726pfe.49.1629099008160; 
 Mon, 16 Aug 2021 00:30:08 -0700 (PDT)
Received: from bobo.ibm.com (203-219-120-52.tpgi.com.au. [203.219.120.52])
 by smtp.gmail.com with ESMTPSA id e7sm10543887pfc.145.2021.08.16.00.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 00:30:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 4/4] powerpc/64s/interrupt: avoid saving CFAR in some
 asynchronous interrupts
Date: Mon, 16 Aug 2021 17:29:53 +1000
Message-Id: <20210816072953.1165964-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210816072953.1165964-1-npiggin@gmail.com>
References: <20210816072953.1165964-1-npiggin@gmail.com>
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

Reading the CFAR register is quite costly (~20 cycles on POWER9). It is
a good idea to have for most synchronous interrupts, but for async ones
it is much less important.

Doorbell, external, and decrementer interrupts are the important
asynchronous ones. HV interrupts can't skip CFAR if KVM HV is possible,
because it might be a guest exit that requires CFAR preserved. But for
now the important pseries interrupts can avoid loading CFAR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 69a472c38f62..42badd7beaf0 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -111,6 +111,8 @@ name:
 #define IAREA		.L_IAREA_\name\()	/* PACA save area */
 #define IVIRT		.L_IVIRT_\name\()	/* Has virt mode entry point */
 #define IISIDE		.L_IISIDE_\name\()	/* Uses SRR0/1 not DAR/DSISR */
+#define ICFAR		.L_ICFAR_\name\()	/* Uses CFAR */
+#define ICFAR_IF_HVMODE	.L_ICFAR_IF_HVMODE_\name\() /* Uses CFAR if HV */
 #define IDAR		.L_IDAR_\name\()	/* Uses DAR (or SRR0) */
 #define IDSISR		.L_IDSISR_\name\()	/* Uses DSISR (or SRR1) */
 #define IBRANCH_TO_COMMON	.L_IBRANCH_TO_COMMON_\name\() /* ENTRY branch to common */
@@ -150,6 +152,12 @@ do_define_int n
 	.ifndef IISIDE
 		IISIDE=0
 	.endif
+	.ifndef ICFAR
+		ICFAR=1
+	.endif
+	.ifndef ICFAR_IF_HVMODE
+		ICFAR_IF_HVMODE=0
+	.endif
 	.ifndef IDAR
 		IDAR=0
 	.endif
@@ -287,9 +295,21 @@ BEGIN_FTR_SECTION
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	HMT_MEDIUM
 	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
+	.if ICFAR
 BEGIN_FTR_SECTION
 	mfspr	r10,SPRN_CFAR
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
+	.elseif ICFAR_IF_HVMODE
+BEGIN_FTR_SECTION
+  BEGIN_FTR_SECTION_NESTED(69)
+	mfspr	r10,SPRN_CFAR
+  END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 69)
+FTR_SECTION_ELSE
+  BEGIN_FTR_SECTION_NESTED(69)
+	li	r10,0
+  END_FTR_SECTION_NESTED(CPU_FTR_CFAR, CPU_FTR_CFAR, 69)
+ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)
+	.endif
 	.if \ool
 	.if !\virt
 	b	tramp_real_\name
@@ -305,9 +325,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 BEGIN_FTR_SECTION
 	std	r9,IAREA+EX_PPR(r13)
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
+	.if ICFAR || ICFAR_IF_HVMODE
 BEGIN_FTR_SECTION
 	std	r10,IAREA+EX_CFAR(r13)
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
+	.endif
 	INTERRUPT_TO_KERNEL
 	mfctr	r10
 	std	r10,IAREA+EX_CTR(r13)
@@ -559,7 +581,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	.endif
 
 BEGIN_FTR_SECTION
+	.if ICFAR || ICFAR_IF_HVMODE
 	ld	r10,IAREA+EX_CFAR(r13)
+	.else
+	li	r10,0
+	.endif
 	std	r10,ORIG_GPR3(r1)
 END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
 	ld	r10,IAREA+EX_CTR(r13)
@@ -1501,6 +1527,12 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
  *
  * If soft masked, the masked handler will note the pending interrupt for
  * replay, and clear MSR[EE] in the interrupted context.
+ *
+ * CFAR is not required because this is an asynchronous interrupt that in
+ * general won't have much bearing on the state of the CPU, with the possible
+ * exception of crash/debug IPIs, but those are generally moving to use SRESET
+ * IPIs. Unless this is an HV interrupt and KVM HV is possible, in which case
+ * it may be exiting the guest and need CFAR to be saved.
  */
 INT_DEFINE_BEGIN(hardware_interrupt)
 	IVEC=0x500
@@ -1508,6 +1540,10 @@ INT_DEFINE_BEGIN(hardware_interrupt)
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
+	ICFAR=0
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	ICFAR_IF_HVMODE=1
+#endif
 INT_DEFINE_END(hardware_interrupt)
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
@@ -1726,6 +1762,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
  * If PPC_WATCHDOG is configured, the soft masked handler will actually set
  * things back up to run soft_nmi_interrupt as a regular interrupt handler
  * on the emergency stack.
+ *
+ * CFAR is not required because this is asynchronous (see hardware_interrupt).
+ * A watchdog interrupt may like to have CFAR, but usually the interesting
+ * branch is long gone by that point (e.g., infinite loop).
  */
 INT_DEFINE_BEGIN(decrementer)
 	IVEC=0x900
@@ -1733,6 +1773,7 @@ INT_DEFINE_BEGIN(decrementer)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	ICFAR=0
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
@@ -1808,6 +1849,8 @@ EXC_COMMON_BEGIN(hdecrementer_common)
  * If soft masked, the masked handler will note the pending interrupt for
  * replay, leaving MSR[EE] enabled in the interrupted context because the
  * doorbells are edge triggered.
+ *
+ * CFAR is not required, similarly to hardware_interrupt.
  */
 INT_DEFINE_BEGIN(doorbell_super)
 	IVEC=0xa00
@@ -1815,6 +1858,7 @@ INT_DEFINE_BEGIN(doorbell_super)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	ICFAR=0
 INT_DEFINE_END(doorbell_super)
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1866,6 +1910,7 @@ INT_DEFINE_BEGIN(system_call)
 	IVEC=0xc00
 	IKVM_REAL=1
 	IKVM_VIRT=1
+	ICFAR=0
 INT_DEFINE_END(system_call)
 
 .macro SYSTEM_CALL virt
@@ -2164,6 +2209,11 @@ EXC_COMMON_BEGIN(hmi_exception_common)
  * Interrupt 0xe80 - Directed Hypervisor Doorbell Interrupt.
  * This is an asynchronous interrupt in response to a msgsnd doorbell.
  * Similar to the 0xa00 doorbell but for host rather than guest.
+ *
+ * CFAR is not required (similar to doorbell_interrupt), unless KVM HV
+ * is enabled, in which case it may be a guest exit. Most PowerNV kernels
+ * include KVM support so it would be nice if this could be dynamically
+ * patched out if KVM was not currently running any guests.
  */
 INT_DEFINE_BEGIN(h_doorbell)
 	IVEC=0xe80
@@ -2171,6 +2221,9 @@ INT_DEFINE_BEGIN(h_doorbell)
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	ICFAR=0
+#endif
 INT_DEFINE_END(h_doorbell)
 
 EXC_REAL_BEGIN(h_doorbell, 0xe80, 0x20)
@@ -2194,6 +2247,9 @@ EXC_COMMON_BEGIN(h_doorbell_common)
  * Interrupt 0xea0 - Hypervisor Virtualization Interrupt.
  * This is an asynchronous interrupt in response to an "external exception".
  * Similar to 0x500 but for host only.
+ *
+ * Like h_doorbell, CFAR is only required for KVM HV because this can be
+ * a guest exit.
  */
 INT_DEFINE_BEGIN(h_virt_irq)
 	IVEC=0xea0
@@ -2201,6 +2257,9 @@ INT_DEFINE_BEGIN(h_virt_irq)
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	ICFAR=0
+#endif
 INT_DEFINE_END(h_virt_irq)
 
 EXC_REAL_BEGIN(h_virt_irq, 0xea0, 0x20)
@@ -2237,6 +2296,8 @@ EXC_VIRT_NONE(0x4ee0, 0x20)
  *
  * If soft masked, the masked handler will note the pending interrupt for
  * replay, and clear MSR[EE] in the interrupted context.
+ *
+ * CFAR is not used by perf interrupts so not required.
  */
 INT_DEFINE_BEGIN(performance_monitor)
 	IVEC=0xf00
@@ -2244,6 +2305,7 @@ INT_DEFINE_BEGIN(performance_monitor)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	ICFAR=0
 INT_DEFINE_END(performance_monitor)
 
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
@@ -2668,6 +2730,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 INT_DEFINE_BEGIN(soft_nmi)
 	IVEC=0x900
 	ISTACK=0
+	ICFAR=0
 INT_DEFINE_END(soft_nmi)
 
 /*
-- 
2.23.0

