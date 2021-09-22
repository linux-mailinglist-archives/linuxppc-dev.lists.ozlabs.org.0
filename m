Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C47B414C9A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:59:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1fd1VJlz3cX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:59:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JaW2/Aog;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JaW2/Aog; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1YW6q2xz305M
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:55:11 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id r7so1692281pjo.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcNURO4sGK+0OAkeHw99lam9wbubgwsvXc+0FuJf5vk=;
 b=JaW2/AogxBYB3D4yapdiLBFXoKfSE9CfdZQ3rQ5OlhXM2qMAmWZDB5UAsMqrVDZ+Sd
 OHqwce+NKMttVHB/Lm2fKfYuBJVA2J6sPEdNxrHyvoV0g5TGM6ppiDmQ4Qz37HUAM+P4
 mVCalUkjJGUMI8ufdKt7OFZK7feZLyL6HckbX1Y8Yau/T+EI81BRg5jBQKOIS4hgMYp/
 V2QeiTe6+1cc4TfBGZ3kl0dvfu0QO+gtzsLpjQ+7l8kyjE7+VM4Kv8JAqvOu+kPDASkN
 IGa6gKwLH8U3vINpZqhTFR3ZoWx+/E3xoWuh+HLm3joE9cZcZJnsVfpOKihd2GKldpkj
 pSOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcNURO4sGK+0OAkeHw99lam9wbubgwsvXc+0FuJf5vk=;
 b=UgnCnlm8wXtq9YeRJVM0aQXKYzidmdbnao0zSJiOfu4/69N/28/L0OR4GnlwzDQDBJ
 +IDEHxzJh5uQ96Ij5Kf83qkx7tI+ucrU8UkVqHgr3TDnx8gK7nYKqJxEKxBTd+obFxXf
 gBp8H5bJ2zgyTmRzUCLaH0M1iBQjbRUh1wuUAUUgyFq4/DCfZn4uYANa6sX9NtTgmlh0
 Ws0IAdpGCVz8nanRVQdjeD5SvND7i7M3AKnA66G7BtayDXsHsgGcYnZWKdcqt/GrApEB
 m3xQ+oY1njp5YlFQtp7vWHJ9O1I5xmLxXW8iDOqeQPkCi0ByJQ1PIpfr2Q3ylVrkLRIQ
 AjMw==
X-Gm-Message-State: AOAM530ebfjfbknhSFvgCDRa07/QbkzaY3LL3Zi1/VQJeZw03u7upnDC
 4Oa2wpc40ntXi/wCLCd1beSBVkadMow=
X-Google-Smtp-Source: ABdhPJzvrQuVqzuyBtEu+wwLnZFZP3XyfiBJiVzI0kCaIyovJYBzuV51xNPsHxD3X9CBYJQUZkro8w==
X-Received: by 2002:a17:902:ea11:b0:13a:db38:cfcf with SMTP id
 s17-20020a170902ea1100b0013adb38cfcfmr260231plg.3.1632322509391; 
 Wed, 22 Sep 2021 07:55:09 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id o14sm2856211pfh.145.2021.09.22.07.55.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:55:09 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 6/6] powerpc/64s/interrupt: avoid saving CFAR in some
 asynchronous interrupts
Date: Thu, 23 Sep 2021 00:54:52 +1000
Message-Id: <20210922145452.352571-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210922145452.352571-1-npiggin@gmail.com>
References: <20210922145452.352571-1-npiggin@gmail.com>
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
because it might be a guest exit that requires CFAR preserved. But the
important pseries interrupts can avoid loading CFAR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 63 ++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 4dcc76206f8e..eb3af5abdd37 100644
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
@@ -1502,6 +1528,12 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
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
@@ -1509,6 +1541,10 @@ INT_DEFINE_BEGIN(hardware_interrupt)
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
+	ICFAR=0
+#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	ICFAR_IF_HVMODE=1
+#endif
 INT_DEFINE_END(hardware_interrupt)
 
 EXC_REAL_BEGIN(hardware_interrupt, 0x500, 0x100)
@@ -1727,6 +1763,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
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
@@ -1734,6 +1774,7 @@ INT_DEFINE_BEGIN(decrementer)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	ICFAR=0
 INT_DEFINE_END(decrementer)
 
 EXC_REAL_BEGIN(decrementer, 0x900, 0x80)
@@ -1809,6 +1850,8 @@ EXC_COMMON_BEGIN(hdecrementer_common)
  * If soft masked, the masked handler will note the pending interrupt for
  * replay, leaving MSR[EE] enabled in the interrupted context because the
  * doorbells are edge triggered.
+ *
+ * CFAR is not required, similarly to hardware_interrupt.
  */
 INT_DEFINE_BEGIN(doorbell_super)
 	IVEC=0xa00
@@ -1816,6 +1859,7 @@ INT_DEFINE_BEGIN(doorbell_super)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	ICFAR=0
 INT_DEFINE_END(doorbell_super)
 
 EXC_REAL_BEGIN(doorbell_super, 0xa00, 0x100)
@@ -1867,6 +1911,7 @@ INT_DEFINE_BEGIN(system_call)
 	IVEC=0xc00
 	IKVM_REAL=1
 	IKVM_VIRT=1
+	ICFAR=0
 INT_DEFINE_END(system_call)
 
 .macro SYSTEM_CALL virt
@@ -2165,6 +2210,11 @@ EXC_COMMON_BEGIN(hmi_exception_common)
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
@@ -2172,6 +2222,9 @@ INT_DEFINE_BEGIN(h_doorbell)
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	ICFAR=0
+#endif
 INT_DEFINE_END(h_doorbell)
 
 EXC_REAL_BEGIN(h_doorbell, 0xe80, 0x20)
@@ -2195,6 +2248,9 @@ EXC_COMMON_BEGIN(h_doorbell_common)
  * Interrupt 0xea0 - Hypervisor Virtualization Interrupt.
  * This is an asynchronous interrupt in response to an "external exception".
  * Similar to 0x500 but for host only.
+ *
+ * Like h_doorbell, CFAR is only required for KVM HV because this can be
+ * a guest exit.
  */
 INT_DEFINE_BEGIN(h_virt_irq)
 	IVEC=0xea0
@@ -2202,6 +2258,9 @@ INT_DEFINE_BEGIN(h_virt_irq)
 	IMASK=IRQS_DISABLED
 	IKVM_REAL=1
 	IKVM_VIRT=1
+#ifndef CONFIG_KVM_BOOK3S_HV_POSSIBLE
+	ICFAR=0
+#endif
 INT_DEFINE_END(h_virt_irq)
 
 EXC_REAL_BEGIN(h_virt_irq, 0xea0, 0x20)
@@ -2238,6 +2297,8 @@ EXC_VIRT_NONE(0x4ee0, 0x20)
  *
  * If soft masked, the masked handler will note the pending interrupt for
  * replay, and clear MSR[EE] in the interrupted context.
+ *
+ * CFAR is not used by perf interrupts so not required.
  */
 INT_DEFINE_BEGIN(performance_monitor)
 	IVEC=0xf00
@@ -2245,6 +2306,7 @@ INT_DEFINE_BEGIN(performance_monitor)
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 	IKVM_REAL=1
 #endif
+	ICFAR=0
 INT_DEFINE_END(performance_monitor)
 
 EXC_REAL_BEGIN(performance_monitor, 0xf00, 0x20)
@@ -2669,6 +2731,7 @@ EXC_VIRT_NONE(0x5800, 0x100)
 INT_DEFINE_BEGIN(soft_nmi)
 	IVEC=0x900
 	ISTACK=0
+	ICFAR=0
 INT_DEFINE_END(soft_nmi)
 
 /*
-- 
2.23.0

