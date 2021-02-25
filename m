Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1E632511D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 15:02:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZGx0v5yz3h0t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 01:02:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=uXLoBGpA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uXLoBGpA; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYzh0gF4z3cnl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:49:03 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id b8so402232plh.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SmX0ilCm5r3iBQEzRqeBZLJnlYFu+crfS8nmIsYYJDw=;
 b=uXLoBGpAjTZqt/CpNZhcU6GsLIjcp2bzhYjOrLoYXtjXKQcRTlyTr+w8Eq1b5pTVMj
 UvWvysgRHvEkykZlxUTfZOGa1Vc3UjA7lXSCe3/+MJyOUzbpnKW1eLLSfzy3sR1D3pNY
 uQ5kin9p8mMvpD2P/hmfe75Z/VGi35xVJhkUxHcKdHrw/ojuXX0wlqgttBubDl51Np5j
 CKzp4te1i00CLLzaaEAGCNOenW0xtg4F8AomBI/cKBqUDq0AmYgsSvUWIHooLy0Ore4K
 aDXvtcro2rwKDC0c+xxRWUD8Vy4uYZH+zgkvmmqeJ18WtpVGlH6ofYBVFdG4nXetit4D
 5sXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SmX0ilCm5r3iBQEzRqeBZLJnlYFu+crfS8nmIsYYJDw=;
 b=kpLHGBtN5hUF32gIh7CyuMQa+ViNXTgUNO+z8R9UiCut7FOQueFbgdKVvwk7g/H2MR
 3JS6Ngb/JYZRrMzwJZ77WgiAR/BijG/XDns7S646/rOhdZdF+CU42SS61oZWJVGeCaO9
 /t7JXHmOLYyeYlKd3ZbQvbqq8DzS6v7MPdMqk0YBBpAfQT3V2kDfDJWGoL4N3S5DhbwL
 JnskESMu8CMtadWIcfocTfdJfp8nsyOvZfB/CiJ4qzZWA5P8njiADnVBB8aViRRKO6/T
 sUZUM0/KdYaBZdTtRiRF+dHhRJYC39aClPiC2BTJV80FS7RdBNISfOmD5VOiYv7gTlaU
 IvMw==
X-Gm-Message-State: AOAM530xbFDf1kdNw2L8uUqZUOtXOdjwi6mMaebR5ZzTpPazuzjkectG
 pwHbADfYRVEK+NbhtomIsd9Rj0T8t6A=
X-Google-Smtp-Source: ABdhPJyL9Qt8ekL1P4yo2LZl0CmhKG7RFIglDLdC29J9K0z/Z/LexWTEXyBoxE8XlpI1qqSANzEyKA==
X-Received: by 2002:a17:90a:5501:: with SMTP id
 b1mr3435726pji.57.1614260941681; 
 Thu, 25 Feb 2021 05:49:01 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:49:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 35/37] KVM: PPC: Book3S HV P9: implement hash guest support
Date: Thu, 25 Feb 2021 23:46:50 +1000
Message-Id: <20210225134652.2127648-36-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c            |  20 ++--
 arch/powerpc/kvm/book3s_hv_interrupt.c  | 123 +++++++++++++++++-------
 arch/powerpc/kvm/book3s_hv_rm_mmu.c     |   4 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S |  14 +--
 4 files changed, 109 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 1bbc46f2cfbf..97320531f37c 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3765,7 +3765,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 		kvmppc_xive_pull_vcpu(vcpu);
 
-		vcpu->arch.slb_max = 0;
+		if (kvm_is_radix(vcpu->kvm))
+			vcpu->arch.slb_max = 0;
 	}
 
 	dec = mfspr(SPRN_DEC);
@@ -3998,7 +3999,6 @@ static void kvmppc_vcore_blocked(struct kvmppc_vcore *vc)
 /*
  * This never fails for a radix guest, as none of the operations it does
  * for a radix guest can fail or have a way to report failure.
- * kvmhv_run_single_vcpu() relies on this fact.
  */
 static int kvmhv_setup_mmu(struct kvm_vcpu *vcpu)
 {
@@ -4177,8 +4177,15 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4191,7 +4198,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	preempt_disable();
 	pcpu = smp_processor_id();
 	vc->pcpu = pcpu;
-	kvmppc_prepare_radix_vcpu(vcpu, pcpu);
+	if (kvm_is_radix(kvm))
+		kvmppc_prepare_radix_vcpu(vcpu, pcpu);
 
 	local_irq_disable();
 	hard_irq_disable();
@@ -4395,7 +4403,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 		 * The TLB prefetch bug fixup is only in the kvmppc_run_vcpu
 		 * path, which also handles hash and dependent threads mode.
 		 */
-		if (kvm_is_radix(kvm))
+		if (radix_enabled())
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index 9784da3f8565..d79c6f4f330c 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -55,44 +55,25 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
 #define accumulate_time(vcpu, next) do {} while (0)
 #endif
 
-static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
-{
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	struct kvm_nested_guest *nested = vcpu->arch.nested;
-	u32 lpid;
-
-	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
-
-	mtspr(SPRN_LPID, lpid);
-	mtspr(SPRN_LPCR, lpcr);
-	mtspr(SPRN_PID, vcpu->arch.pid);
-	isync();
-
-	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
-	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
-}
-
-static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
-{
-	mtspr(SPRN_PID, pid);
-	mtspr(SPRN_LPID, kvm->arch.host_lpid);
-	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
-	isync();
-}
-
 static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
 {
 	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
 	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
 }
 
+static inline void __mtslb(u64 slbee, u64 slbev)
+{
+	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
+}
+
 static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
 {
 	BUG_ON((slbee & 0xfff) != idx);
 
-	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
+	__mtslb(slbee, slbev);
 }
 
+
 static inline void slb_invalidate(unsigned int ih)
 {
 	asm volatile("slbia %0" :: "i"(ih));
@@ -119,6 +100,54 @@ static void radix_clear_slb(void)
 	}
 }
 
+static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
+{
+	struct kvmppc_vcore *vc = vcpu->arch.vcore;
+	struct kvm_nested_guest *nested = vcpu->arch.nested;
+	u32 lpid;
+
+	lpid = nested ? nested->shadow_lpid : kvm->arch.lpid;
+
+	mtspr(SPRN_LPID, lpid);
+	mtspr(SPRN_LPCR, lpcr);
+	mtspr(SPRN_PID, vcpu->arch.pid);
+	isync();
+
+	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
+	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
+}
+
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
+	/* XXX: TLBIEL not virtualised for HPT guests */
+}
+
+
+static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
+{
+	mtspr(SPRN_PID, pid);
+	mtspr(SPRN_LPID, kvm->arch.host_lpid);
+	mtspr(SPRN_LPCR, kvm->arch.host_lpcr);
+	isync();
+}
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
 {
 	struct kvm *kvm = vcpu->kvm;
@@ -223,10 +252,17 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_AMOR, ~0UL);
 
-	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
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
@@ -234,9 +270,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-		__mtmsrd(0, 1); /* clear RI */
-
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
@@ -340,8 +373,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 #endif
 	}
 
-	radix_clear_slb();
-
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
 	/* Advance host PURR/SPURR by the amount used by guest */
@@ -406,6 +437,30 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	/* HDEC must be at least as large as DEC, so decrementer_max fits */
 	mtspr(SPRN_HDEC, decrementer_max);
 
+	if (kvm_is_radix(kvm)) {
+		radix_clear_slb();
+	} else {
+		int i;
+		int nr = 0;
+
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
+		}
+		vcpu->arch.slb_max = nr;
+		mtslb(0, 0, 0);
+		slb_invalidate(6);
+	}
+
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
 	/*
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 7af7c70f1468..b5532b85c7fd 100644
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
index a8ce68eed13e..be5742640780 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -899,14 +899,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
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
@@ -1408,9 +1405,6 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	stw	r5,VCPU_SLB_MAX(r9)
 
 	/* load host SLB entries */
-BEGIN_MMU_FTR_SECTION
-	b	guest_bypass
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 	ld	r8,PACA_SLBSHADOWPTR(r13)
 
 	.rept	SLB_NUM_BOLTED
@@ -3162,10 +3156,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 	PPC_SLBIA(6)
 	ptesync
 
-BEGIN_MMU_FTR_SECTION
-	b	4f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
-
 	/* load host SLB entries */
 	ld	r8, PACA_SLBSHADOWPTR(r13)
 	.rept	SLB_NUM_BOLTED
@@ -3179,7 +3169,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 3:	addi	r8, r8, 16
 	.endr
 
-4:	lwz	r7, KVM_HOST_LPID(r10)
+	lwz	r7, KVM_HOST_LPID(r10)
 	mtspr	SPRN_LPID, r7
 	mtspr	SPRN_PID, r0
 	ld	r8, KVM_HOST_LPCR(r10)
-- 
2.23.0

