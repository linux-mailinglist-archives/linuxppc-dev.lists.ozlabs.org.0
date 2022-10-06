Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BCA5F6992
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjtzp3cS6z3dtV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:26:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dD2W0XO3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dD2W0XO3;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjtwd0RpKz3cdY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:24:00 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id u24so1826494plq.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=nV9cjHGnB0/w2Ic6jfOWhZTiS+eYUIs9xvwVeNQBssE=;
        b=dD2W0XO3+UGPAhGfhH7zfQiMgag2ckECC2ofD7JlWs2keUzvXzKJlxUDJbmL4YpmXT
         qznNKPAbZvWZ1Ks/4yMuZBAkbB0EpqAqvKX2wE6CcOgr/8oHsYe/mhdYFrhw0VhsQSst
         I6jfH9UhLbXhLJJByPuQkw/CSNjelDj7LJl6Y4HMQnKf6lRMDH2i8WWcIILRgLyF7BRL
         dsI4iBWgptOOtW1n7IZa4oT4uh5Fxl6YX1K6koFpiI2nOWNkAKvOArdQUjAO9EZISTbT
         ZSaExYJgnQpRvdx8r+2Fh9RVPdY4IJKbLfGc+kPrLnZOSndeNhH43AeQUGS4sGYilzxz
         75ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=nV9cjHGnB0/w2Ic6jfOWhZTiS+eYUIs9xvwVeNQBssE=;
        b=6oQ+lDQIZyPoqmoy/G3vZk4Kdy4LCs34Fubuzim5pTGLOaDuU7QZmmF7i+hO2ByTST
         CGpDnwMn0K7EJJYZzvR9Wy0Qoeq7hGe5Drs2Wz0rD7nCPC/BzhI4/z+YZ8ylnXb3wYno
         gG+KDsBIH9UjVA01zSsIuFVR1mlkan3+pTdX3F7kKMh6BjVi48hq/xDeKI41f09kEouY
         1z9SuWjlX3GKIeahZrzD1M8WR1vJ/QnF6msvwbCwDBewdLSL3NU8k1T86zc/WqZv5QWJ
         0dOIMaTTrHss/og6ZU3Lj8PAN5tcpFlKJdRiIoWJjbw7KVkzc5VPHLbprwPbxL+l9okk
         MKTQ==
X-Gm-Message-State: ACrzQf1OUfRVMB0UkID6H2b1vr7wDVeGJQPuDxrRlp0yezQXTumm0A+T
	0Y6OZF1roF+SSL9Q3dGRZhj3yCoHsJc=
X-Google-Smtp-Source: AMsMyM6TVQ9Su1RNlKNP+eNlkswoc3iDjCsbdUpMcukcbII0LoR9f3ZhoUA59xr/7KgztgpPTb407A==
X-Received: by 2002:a17:902:c209:b0:17f:7da5:b884 with SMTP id 9-20020a170902c20900b0017f7da5b884mr5029662pll.26.1665066238585;
        Thu, 06 Oct 2022 07:23:58 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id w23-20020a1709026f1700b00178acc7ef16sm7496240plk.253.2022.10.06.07.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:23:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH] KVM: PPC: Book3S PR: Fix context tracking
Date: Fri,  7 Oct 2022 00:23:51 +1000
Message-Id: <20221006142352.128349-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The main difficulty with supporting context tracking is exiting
from guest context before taking any host interrupts. That path
is all done in assembly with a clever trampoline and bounce to
interrupt handler then back to exit handler with interrupts enabled.
This patch adds a call out to C in virtual mode to exit guest context
before any host interrupts are taken, and splits the context from
timing management because timing wants to be called after interrupts
are enabled.

This is able to boot a a guest on a 64s host without crashing now.
32s doesn't support context tracking yet so that isn't tested, but
it should work, modulo possible incorrect instruction relocation
address when enabling IR.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/Kconfig             |  2 --
 arch/powerpc/kvm/book3s_exports.c    |  7 +++++++
 arch/powerpc/kvm/book3s_pr.c         | 10 +++++++++-
 arch/powerpc/kvm/book3s_rmhandlers.S |  3 ++-
 arch/powerpc/kvm/book3s_segment.S    | 28 +++++++++++++++++++++++++++-
 arch/powerpc/kvm/powerpc.c           |  3 ++-
 6 files changed, 47 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index a9f57dad6d91..5d580c0f6500 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -51,7 +51,6 @@ config KVM_BOOK3S_HV_POSSIBLE
 config KVM_BOOK3S_32
 	tristate "KVM support for PowerPC book3s_32 processors"
 	depends on PPC_BOOK3S_32 && !SMP && !PTE_64BIT
-	depends on !CONTEXT_TRACKING_USER
 	select KVM
 	select KVM_BOOK3S_32_HANDLER
 	select KVM_BOOK3S_PR_POSSIBLE
@@ -106,7 +105,6 @@ config KVM_BOOK3S_64_HV
 config KVM_BOOK3S_64_PR
 	tristate "KVM support without using hypervisor mode in host"
 	depends on KVM_BOOK3S_64
-	depends on !CONTEXT_TRACKING_USER
 	select KVM_BOOK3S_PR_POSSIBLE
 	help
 	  Support running guest kernels in virtual machines on processors
diff --git a/arch/powerpc/kvm/book3s_exports.c b/arch/powerpc/kvm/book3s_exports.c
index f08565885ddf..cd40a46215cb 100644
--- a/arch/powerpc/kvm/book3s_exports.c
+++ b/arch/powerpc/kvm/book3s_exports.c
@@ -6,6 +6,7 @@
  * Authors: Alexander Graf <agraf@suse.de>
  */
 
+#include <linux/context_tracking.h>
 #include <linux/export.h>
 #include <asm/kvm_ppc.h>
 #include <asm/kvm_book3s.h>
@@ -15,5 +16,11 @@ EXPORT_SYMBOL_GPL(kvmppc_hv_entry_trampoline);
 #endif
 #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
 EXPORT_SYMBOL_GPL(kvmppc_entry_trampoline);
+
+void kvmppc_guest_state_exit_irqoff(void)
+{
+	guest_state_exit_irqoff();
+}
+EXPORT_SYMBOL_GPL(kvmppc_guest_state_exit_irqoff);
 #endif
 
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index d6abed6e51e6..60d7a11a7cbc 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -1144,6 +1144,12 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	int r = RESUME_HOST;
 	int s;
 
+#ifdef CONFIG_CONTEXT_TRACKING_USER
+	local_irq_disable();
+	guest_timing_exit_irqoff();
+	local_irq_enable();
+#endif
+
 	vcpu->stat.sum_exits++;
 
 	run->exit_reason = KVM_EXIT_UNKNOWN;
@@ -1152,7 +1158,6 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 	/* We get here with MSR.EE=1 */
 
 	trace_kvm_exit(exit_nr, vcpu);
-	guest_exit();
 
 	switch (exit_nr) {
 	case BOOK3S_INTERRUPT_INST_STORAGE:
@@ -1448,6 +1453,7 @@ int kvmppc_handle_exit_pr(struct kvm_vcpu *vcpu, unsigned int exit_nr)
 		else {
 			/* interrupts now hard-disabled */
 			kvmppc_fix_ee_before_entry();
+			guest_state_enter_irqoff();
 		}
 
 		kvmppc_handle_lost_ext(vcpu);
@@ -1844,6 +1850,8 @@ static int kvmppc_vcpu_run_pr(struct kvm_vcpu *vcpu)
 
 	kvmppc_fix_ee_before_entry();
 
+	guest_state_enter_irqoff();
+
 	ret = __kvmppc_vcpu_run(vcpu);
 
 	kvmppc_clear_debug(vcpu);
diff --git a/arch/powerpc/kvm/book3s_rmhandlers.S b/arch/powerpc/kvm/book3s_rmhandlers.S
index 03886ca24498..d3558a7509e7 100644
--- a/arch/powerpc/kvm/book3s_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_rmhandlers.S
@@ -152,7 +152,8 @@ _GLOBAL_TOC(kvmppc_entry_trampoline)
 	andc	r6, r5, r6	/* Clear DR and IR in MSR value */
 	/*
 	 * Set EE in HOST_MSR so that it's enabled when we get into our
-	 * C exit handler function.
+	 * C exit handler function. If we are tracking context then must
+	 * not take host interrupts before switching out of guest context.
 	 */
 	ori	r5, r5, MSR_EE
 	mtsrr0	r7
diff --git a/arch/powerpc/kvm/book3s_segment.S b/arch/powerpc/kvm/book3s_segment.S
index 202046a83fc1..04f479d07ca8 100644
--- a/arch/powerpc/kvm/book3s_segment.S
+++ b/arch/powerpc/kvm/book3s_segment.S
@@ -363,12 +363,38 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	 *
 	 * R1       = host R1
 	 * R2       = host R2
-	 * R10      = raw exit handler id
+	 * R10      = raw exit handler id (XXX doesn't seem to be there)
 	 * R12      = exit handler id
 	 * R13      = shadow vcpu (32-bit) or PACA (64-bit)
 	 * SVCPU.*  = guest *
 	 *
 	 */
+#ifdef CONFIG_CONTEXT_TRACKING_USER
+#ifdef CONFIG_PPC64
+	LOAD_REG_ADDR(r11, 1f)
+	mtctr	r11
+	bctr
+1:
+#endif
+	/* XXX: does 32s need any address change to enable IR? */
+	mfmsr	r11
+	ori	r11, r11, MSR_IR|MSR_DR
+	mtmsr	r11
+	sync
+	PPC_STL	r12, HSTATE_SCRATCH0(r13)
+	mfcr	r9
+	stw	r9, HSTATE_SCRATCH1(r13)
+	bl	FUNC(kvmppc_guest_state_exit_irqoff)
+	nop
+	PPC_LL	r12, HSTATE_SCRATCH0(r13)
+	lwz	r9, HSTATE_SCRATCH1(r13)
+	mtcr	r9
+	mfmsr	r11
+	li	r9, MSR_IR|MSR_DR
+	andc	r11, r11, r9
+	mtmsr	r11
+	sync
+#endif
 
 	PPC_LL	r6, HSTATE_HOST_MSR(r13)
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 757491dd6b7b..3a3c5ad759e4 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -129,7 +129,8 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
 			continue;
 		}
 
-		guest_enter_irqoff();
+		guest_timing_enter_irqoff();
+
 		return 1;
 	}
 
-- 
2.37.2

