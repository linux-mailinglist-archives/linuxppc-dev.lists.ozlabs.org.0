Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBD1353AEA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:40:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCzL42L2z3hhR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:40:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kY0kGBFY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kY0kGBFY; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCZN4GNkz3cmx
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:22:36 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id t22so18829pgu.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gtNbRijnhbrDIky97fx0/Aav8opUD86uP1RkTln38AQ=;
 b=kY0kGBFYSuhibVSMJFgTUr2FrO1anThOmp77W5CPdIInYl/2h2aZ5xrtjnqe5gJwt2
 KBPaR/SGhqslgC0t7Aojm3/Fxb0GJeJJRy96hGKIVkTbWm09IlDHtA33U3tLs1//fT+a
 aC4IlYz1kTVlsXkZAVWw3RYRg9GG2rtm9syOG1HctTWEBcyomjnxCAnWha4wD32LKXrR
 J9Z/zrPf07Zl1ZNCZCUcIhkKZiA09TgkjMIeqqdyAeEZXjKLGA2jBgAoG4h9jt+2jDy1
 lu+Gh+grNDhAx524VwPvhF0Pg+CVzrlL/PSnBKyEFbE8u36mgyYEOGEDS1ubT9rKFs5k
 YopQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gtNbRijnhbrDIky97fx0/Aav8opUD86uP1RkTln38AQ=;
 b=sa7z1dSzwiVMbXc/JnSAvIoKLfk7DEs2QkWwo3vBB/bY7bpYPzXUdNoimO8sQp8b64
 eJntik7/aoojoPYgEcWJIJuft7n8sFAHH4t5l6TS8rr6dA5za0XX2y5zROU/IDNc0Um5
 iuiucRshMaFPFLE4WNOvfxndYMo/t47hZ5fFFe0XRdkaPQfPWh8FL0uiKHuQLpmxKnEz
 CpiJLV91NLJrPShhBkXrBhuzNUZIofdD4HMBMt11KhyNvEdIMLUF9ISpTnV498C2bRGs
 F0FMh+/ttZ8l9pBYZjGzUCucTDxMEKTgs5axUzsauCWD9woG20/iVoleOzpkJm5I/RZR
 T01w==
X-Gm-Message-State: AOAM531diQ4y5oMSQgs9ntaeGGaAGH7P+mXyPcupvoh0t9QxLaVU+J+d
 qJeSH4O4HeuEupr4R1LOmEQ=
X-Google-Smtp-Source: ABdhPJyNJ+WTZqNjYZAjVc/BIKuf+0kz99tOix273Qx162uTH3U5yw6ix8l+qU/wdk/wvgBhBmrZEA==
X-Received: by 2002:a63:2507:: with SMTP id l7mr21155678pgl.198.1617585754665; 
 Sun, 04 Apr 2021 18:22:34 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:22:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 46/48] KVM: PPC: Book3S HV P9: implement hash guest support
Date: Mon,  5 Apr 2021 11:19:46 +1000
Message-Id: <20210405011948.675354-47-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guest entry/exit has to restore and save/clear the SLB, plus several
other bits to accommodate hash guests in the P9 path.

Radix host, hash guest support is removed from the P7/8 path.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c            |  20 ++-
 arch/powerpc/kvm/book3s_hv_interrupt.c  | 156 +++++++++++++++++-------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c     |   4 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  14 +--
 4 files changed, 132 insertions(+), 62 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7cd97e6757e5..4d0bb5b31307 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3869,7 +3869,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 		kvmppc_xive_pull_vcpu(vcpu);
 
-		vcpu->arch.slb_max = 0;
+		if (kvm_is_radix(vcpu->kvm))
+			vcpu->arch.slb_max = 0;
 	}
 
 	dec = mfspr(SPRN_DEC);
@@ -4101,7 +4102,6 @@ static void kvmppc_vcore_blocked(struct kvmppc_vcore *vc)
 /*
  * This never fails for a radix guest, as none of the operations it does
  * for a radix guest can fail or have a way to report failure.
- * kvmhv_run_single_vcpu() relies on this fact.
  */
 static int kvmhv_setup_mmu(struct kvm_vcpu *vcpu)
 {
@@ -4280,8 +4280,15 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->runner = vcpu;
 
 	/* See if the MMU is ready to go */
-	if (!kvm->arch.mmu_ready)
-		kvmhv_setup_mmu(vcpu);
+	if (!kvm->arch.mmu_ready) {
+		r = kvmhv_setup_mmu(vcpu);
+		if (r) {
+			run->exit_reason = KVM_EXIT_FAIL_ENTRY;
+			run->fail_entry.hardware_entry_failure_reason = 0;
+			vcpu->arch.ret = r;
+			return r;
+		}
+	}
 
 	if (need_resched())
 		cond_resched();
@@ -4294,7 +4301,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	preempt_disable();
 	pcpu = smp_processor_id();
 	vc->pcpu = pcpu;
-	kvmppc_prepare_radix_vcpu(vcpu, pcpu);
+	if (kvm_is_radix(kvm))
+		kvmppc_prepare_radix_vcpu(vcpu, pcpu);
 
 	local_irq_disable();
 	hard_irq_disable();
@@ -4494,7 +4502,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (kvm_is_radix(kvm))
+		if (radix_enabled())
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index f09b11ea2033..a878cb5ec1b8 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -4,6 +4,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/dbell.h>
 #include <asm/kvm_ppc.h>
+#include <asm/ppc-opcode.h>
 
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 static void __start_timing(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
@@ -55,6 +56,50 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
 #define accumulate_time(vcpu, next) do {} while (0)
 #endif
 
+static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
+{
+	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
+	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
+}
+
+static inline void __mtslb(u64 slbee, u64 slbev)
+{
+	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
+}
+
+static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
+{
+	BUG_ON((slbee & 0xfff) != idx);
+
+	__mtslb(slbee, slbev);
+}
+
+static inline void slb_invalidate(unsigned int ih)
+{
+	asm volatile(PPC_SLBIA(%0) :: "i"(ih));
+}
+
+/*
+ * Malicious or buggy radix guests may have inserted SLB entries
+ * (only 0..3 because radix always runs with UPRT=1), so these must
+ * be cleared here to avoid side-channels. slbmte is used rather
+ * than slbia, as it won't clear cached translations.
+ */
+static void radix_clear_slb(void)
+{
+	u64 slbee, slbev;
+	int i;
+
+	for (i = 0; i < 4; i++) {
+		mfslb(i, &slbee, &slbev);
+		if (unlikely(slbee || slbev)) {
+			slbee = i;
+			slbev = 0;
+			mtslb(i, slbee, slbev);
+		}
+	}
+}
+
 static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
@@ -80,6 +125,31 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
 }
 
+static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
+{
+	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	u32 lpid;
+	int i;
+
+	BUG_ON(nested);
+
+	lpid = kvm->arch.lpid;
+
+	mtspr(SPRN_LPID, lpid);
+	mtspr(SPRN_LPCR, lpcr);
+	mtspr(SPRN_PID, vcpu->arch.pid);
+
+	for (i = 0; i < vcpu->arch.slb_max; i++)
+		__mtslb(vcpu->arch.slb[i].orige, vcpu->arch.slb[i].origv);
+
+	isync();
+
+	/*
+	 * TLBIEL is not virtualised for HPT guests, so check_need_tlb_flush
+	 * is not required here.
+	 */
+}
+
 static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
 {
 	isync();
@@ -91,37 +161,30 @@ static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
 	isync();
 }
 
-static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
-{
-	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
-	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
-}
-
-static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
-{
-	BUG_ON((slbee & 0xfff) != idx);
-
-	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
-}
-
-/*
- * Malicious or buggy radix guests may have inserted SLB entries
- * (only 0..3 because radix always runs with UPRT=1), so these must
- * be cleared here to avoid side-channels. slbmte is used rather
- * than slbia, as it won't clear cached translations.
- */
-static void radix_clear_slb(void)
+static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 {
-	u64 slbee, slbev;
-	int i;
+	if (kvm_is_radix(kvm)) {
+		radix_clear_slb();
+	} else {
+		int i;
+		int nr = 0;
 
-	for (i = 0; i < 4; i++) {
-		mfslb(i, &slbee, &slbev);
-		if (unlikely(slbee || slbev)) {
-			slbee = i;
-			slbev = 0;
-			mtslb(i, slbee, slbev);
+		/*
+		 * This must run before switching to host (radix host can't
+		 * access all SLBs).
+		 */
+		for (i = 0; i < vcpu->arch.slb_nr; i++) {
+			u64 slbee, slbev;
+			mfslb(i, &slbee, &slbev);
+			if (slbee & SLB_ESID_V) {
+				vcpu->arch.slb[nr].orige = slbee | i;
+				vcpu->arch.slb[nr].origv = slbev;
+				nr++;
+			}
 		}
+		vcpu->arch.slb_max = nr;
+		mtslb(0, 0, 0);
+		slb_invalidate(6);
 	}
 }
 
@@ -229,10 +292,18 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_AMOR, ~0UL);
 
-	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
+	if (kvm_is_radix(kvm)) {
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+			__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+		switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
+		if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+			__mtmsrd(0, 1); /* clear RI */
 
-	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
+	} else {
+		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+		switch_mmu_to_guest_hpt(kvm, vcpu, lpcr);
+	}
 
 	/*
 	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
@@ -240,9 +311,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-		__mtmsrd(0, 1); /* clear RI */
-
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
@@ -250,10 +318,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.guest_time);
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_GUEST_HV_FAST;
 	kvmppc_p9_enter_guest(vcpu);
-	// Radix host and guest means host never runs with guest MMU state
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
 	accumulate_time(vcpu, &vcpu->arch.rm_intr);
 
@@ -354,8 +419,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 #endif
 	}
 
-	radix_clear_slb();
-
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
 	/* Advance host PURR/SPURR by the amount used by guest */
@@ -389,11 +452,14 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		mtspr(SPRN_DAWRX1, host_dawrx1);
 	}
 
-	/*
-	 * Since this is radix, do a eieio; tlbsync; ptesync sequence in
-	 * case we interrupted the guest between a tlbie and a ptesync.
-	 */
-	asm volatile("eieio; tlbsync; ptesync");
+	if (kvm_is_radix(kvm)) {
+		/*
+		 * Since this is radix, do a eieio; tlbsync; ptesync sequence
+		 * in case we interrupted the guest between a tlbie and a
+		 * ptesync.
+		 */
+		asm volatile("eieio; tlbsync; ptesync");
+	}
 
 	/*
 	 * cp_abort is required if the processor supports local copy-paste
@@ -420,7 +486,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	/* HDEC must be at least as large as DEC, so decrementer_max fits */
 	mtspr(SPRN_HDEC, decrementer_max);
 
+	save_clear_guest_mmu(kvm, vcpu);
 	switch_mmu_to_host_radix(kvm, host_pidr);
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
 	/*
 	 * If we are in real mode, only switch MMU on after the MMU is
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 8cc73abbf42b..f487ebb3a70a 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -57,6 +57,10 @@ static int global_invalidates(struct kvm *kvm)
 	else
 		global = 1;
 
+	/* LPID has been switched to host if in virt mode so can't do local */
+	if (!global && (mfmsr() & (MSR_IR|MSR_DR)))
+		global = 1;
+
 	if (!global) {
 		/* any other core might now have stale TLB entries... */
 		smp_wmb();
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 1bc5a3805a26..8a2efe2118a5 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -885,14 +885,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
 	cmpdi	r3, 512		/* 1 microsecond */
 	blt	hdec_soon
 
-	/* For hash guest, clear out and reload the SLB */
-BEGIN_MMU_FTR_SECTION
-	/* Radix host won't have populated the SLB, so no need to clear */
+	/* Clear out and reload the SLB */
 	li	r6, 0
 	slbmte	r6, r6
 	PPC_SLBIA(6)
 	ptesync
-END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_RADIX)
 
 	/* Load up guest SLB entries (N.B. slb_max will be 0 for radix) */
 	lwz	r5,VCPU_SLB_MAX(r4)
@@ -1370,9 +1367,6 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	stw	r5,VCPU_SLB_MAX(r9)
 
 	/* load host SLB entries */
-BEGIN_MMU_FTR_SECTION
-	b	guest_bypass
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 	ld	r8,PACA_SLBSHADOWPTR(r13)
 
 	.rept	SLB_NUM_BOLTED
@@ -3124,10 +3118,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 	PPC_SLBIA(6)
 	ptesync
 
-BEGIN_MMU_FTR_SECTION
-	b	4f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
-
 	/* load host SLB entries */
 	ld	r8, PACA_SLBSHADOWPTR(r13)
 	.rept	SLB_NUM_BOLTED
@@ -3141,7 +3131,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 3:	addi	r8, r8, 16
 	.endr
 
-4:	lwz	r7, KVM_HOST_LPID(r10)
+	lwz	r7, KVM_HOST_LPID(r10)
 	mtspr	SPRN_LPID, r7
 	mtspr	SPRN_PID, r0
 	ld	r8, KVM_HOST_LPCR(r10)
-- 
2.23.0

