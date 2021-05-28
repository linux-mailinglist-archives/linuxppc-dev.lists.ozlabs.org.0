Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F0393FC9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:22:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frzj25hKDz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:21:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hU0+7MFN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hU0+7MFN; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzQN42w9z3c5F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:09:16 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id y15so2734995pfn.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UGz/HAp1NItotHcRKLsEnmJH5HYG4lZgXTmVtlYQJbk=;
 b=hU0+7MFNAtXEyPvK/pkRuzKMQJLG95d3n80Q9/nRmQiCUDa5gLEaM37i4+9mrxhSax
 7mEPIleoPtTPO10emg9LEwYw6bMPoMTxpEMWNMuXpx0CTt25l1cVJbGMsK9K5TPc1xjE
 8xH/Z2tMT1X4G51TbgabYtkzGF/ACm+UND3sqjuJS9Uup6gUMKImA9FZdIz0p2qxAy96
 yl/cHQDQ0YKJKKQpD4YEcH3NLeqjwK46P3L8P2FKBQyDLF831fqlXDJRSGAmvAdYaHM1
 YNn/B4Sst+6bo+3h2fPc81pSHJCGGfxsOATtnXqoynPXS7S6x6XnZupu4BM+yMSMQb3x
 sZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UGz/HAp1NItotHcRKLsEnmJH5HYG4lZgXTmVtlYQJbk=;
 b=nn/oUIQ9+emIzUCkmObW4Uhkhqj2PtHk6/V+qzCWzRS5DTXCItHOfrsbw7x2h+ItjS
 OJ/F5hWl15iicXYCiLKlJePuXJeIzUkwT4LHkOQ3o/+LlEXvLEMYCUXWTKnMaLClJBgY
 TRmc/heLaCYziwnsCOcxQRU1DC0tkJx2j9rKH9EpXgDWkCU1xRLG9ODNfEch/qekTaw0
 FJ7Upj6qA0oEYG2boIRWgi7Lyt6kZDkk9P1fOgVfIyaXaBp6YEPO6ccoYZWRPJHtCSCW
 zzEsAYYJqBQOeCM2TRmKlIoStpyIEPE4EZlvWSGvJA0cPXpMZwwB69sMPQULW0PQNX9T
 4DdQ==
X-Gm-Message-State: AOAM533vv7+0pNWXlt7T1M11OZVCJFet547klH+E8Mm3Ev1QzaxGy1H+
 iPnxvEgMYtFZk8I3Li1o14xhOK73MME=
X-Google-Smtp-Source: ABdhPJy4MK+tcDHSQWlT04NChwHyViYRH39PKrHsme+04ofOgUFkle99DMQ9VHboDfzfDJIOo2Xd8Q==
X-Received: by 2002:a05:6a00:84f:b029:2be:3b80:e9eb with SMTP id
 q15-20020a056a00084fb02902be3b80e9ebmr2953525pfk.39.1622192954433; 
 Fri, 28 May 2021 02:09:14 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:09:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 30/32] KVM: PPC: Book3S HV P9: implement hash guest support
Date: Fri, 28 May 2021 19:07:50 +1000
Message-Id: <20210528090752.3542186-31-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement hash guest support. Guest entry/exit has to restore and
save/clear the SLB, plus several other bits to accommodate hash guests
in the P9 path. Radix host, hash guest support is removed from the P7/8
path.

The HPT hcalls and faults are not handled in real mode, which is a
performance regression. A worst-case fork/exit microbenchmark takes 3x
longer after this patch. kbuild benchmark performance is in the noise,
but the slowdown is likely to be noticed somewhere.

For now, accept this penalty for the benefit of simplifying the P7/8
paths and unifying P9 hash with the new code, because hash is a less
important configuration than radix on processors that support it. Hash
will benefit from future optimisations to this path, including possibly
a faster path to handle such hcalls and interrupts without doing a full
exit.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_asm.h      |  2 +-
 arch/powerpc/kvm/book3s_64_entry.S      |  2 +-
 arch/powerpc/kvm/book3s_hv.c            | 20 +++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c   | 97 ++++++++++++++++++++-----
 arch/powerpc/kvm/book3s_hv_rm_mmu.c     |  4 +
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 14 +---
 6 files changed, 101 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_asm.h b/arch/powerpc/include/asm/kvm_asm.h
index f4ae37810aa9..e479487488f4 100644
--- a/arch/powerpc/include/asm/kvm_asm.h
+++ b/arch/powerpc/include/asm/kvm_asm.h
@@ -147,7 +147,7 @@
 #define KVM_GUEST_MODE_SKIP	2
 #define KVM_GUEST_MODE_GUEST_HV	3
 #define KVM_GUEST_MODE_HOST_HV	4
-#define KVM_GUEST_MODE_HV_FAST	5 /* ISA >= v3.0 host+guest radix */
+#define KVM_GUEST_MODE_HV_FAST	5 /* ISA >= v3.0 host radix */
 
 #define KVM_INST_FETCH_FAILED	-1
 
diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
index bac664c1a9f7..7322fea971e4 100644
--- a/arch/powerpc/kvm/book3s_64_entry.S
+++ b/arch/powerpc/kvm/book3s_64_entry.S
@@ -184,7 +184,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
  * void kvmppc_p9_enter_guest(struct vcpu *vcpu);
  *
  * Enter the guest on a ISAv3.0 or later system where we have exactly
- * one vcpu per vcore, and both the host and guest are radix.
+ * one vcpu per vcore, and the host is radix.
  */
 .balign	IFETCH_ALIGN_BYTES
 _GLOBAL(kvmppc_p9_enter_guest)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 493f67f27d06..662f599bdc0e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3875,7 +3875,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 		kvmppc_xive_pull_vcpu(vcpu);
 
-		vcpu->arch.slb_max = 0;
+		if (kvm_is_radix(vcpu->kvm))
+			vcpu->arch.slb_max = 0;
 	}
 
 	dec = mfspr(SPRN_DEC);
@@ -4110,7 +4111,6 @@ static void kvmppc_vcore_blocked(struct kvmppc_vcore *vc)
 /*
  * This never fails for a radix guest, as none of the operations it does
  * for a radix guest can fail or have a way to report failure.
- * kvmhv_run_single_vcpu() relies on this fact.
  */
 static int kvmhv_setup_mmu(struct kvm_vcpu *vcpu)
 {
@@ -4289,8 +4289,15 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4303,7 +4310,8 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 	preempt_disable();
 	pcpu = smp_processor_id();
 	vc->pcpu = pcpu;
-	kvmppc_prepare_radix_vcpu(vcpu, pcpu);
+	if (kvm_is_radix(kvm))
+		kvmppc_prepare_radix_vcpu(vcpu, pcpu);
 
 	local_irq_disable();
 	hard_irq_disable();
@@ -4503,7 +4511,7 @@ static int kvmppc_vcpu_run_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.state = KVMPPC_VCPU_BUSY_IN_HOST;
 
 	do {
-		if (kvm_is_radix(kvm))
+		if (radix_enabled())
 			r = kvmhv_run_single_vcpu(vcpu, ~(u64)0,
 						  vcpu->arch.vcore->lpcr);
 		else
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 178f771e299c..4460f1c23a9d 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -4,6 +4,7 @@
 #include <asm/asm-prototypes.h>
 #include <asm/dbell.h>
 #include <asm/kvm_ppc.h>
+#include <asm/ppc-opcode.h>
 
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 static void __start_timing(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
@@ -55,6 +56,12 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
 #define accumulate_time(vcpu, next) do {} while (0)
 #endif
 
+static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
+{
+	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
+	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
+}
+
 static inline void mtslb(u64 slbee, u64 slbev)
 {
 	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
@@ -65,6 +72,12 @@ static inline void clear_slb_entry(unsigned int idx)
 	mtslb(idx, 0);
 }
 
+static inline void slb_clear_invalidate_partition(void)
+{
+	clear_slb_entry(0);
+	asm volatile(PPC_SLBIA(6));
+}
+
 /*
  * Malicious or buggy radix guests may have inserted SLB entries
  * (only 0..3 because radix always runs with UPRT=1), so these must
@@ -81,7 +94,6 @@ static void radix_clear_slb(void)
 
 static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
 {
-	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	u32 lpid;
 
@@ -99,9 +111,23 @@ static void switch_mmu_to_guest_radix(struct kvm *kvm, struct kvm_vcpu *vcpu, u6
 	isync();
 	mtspr(SPRN_PID, vcpu->arch.pid);
 	isync();
+}
 
-	/* TLBIEL must have LPIDR set, so set guest LPID before flushing. */
-	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
+static void switch_mmu_to_guest_hpt(struct kvm *kvm, struct kvm_vcpu *vcpu, u64 lpcr)
+{
+	u32 lpid;
+	int i;
+
+	lpid = kvm->arch.lpid;
+
+	mtspr(SPRN_LPID, lpid);
+	mtspr(SPRN_LPCR, lpcr);
+	mtspr(SPRN_PID, vcpu->arch.pid);
+
+	for (i = 0; i < vcpu->arch.slb_max; i++)
+		mtslb(vcpu->arch.slb[i].orige, vcpu->arch.slb[i].origv);
+
+	isync();
 }
 
 static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
@@ -115,9 +141,36 @@ static void switch_mmu_to_host_radix(struct kvm *kvm, u32 pid)
 	isync();
 }
 
+static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
+{
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
+		slb_clear_invalidate_partition();
+	}
+}
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr)
 {
 	struct kvm *kvm = vcpu->kvm;
+	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	s64 hdec;
 	u64 tb, purr, spurr;
@@ -218,10 +271,21 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_AMOR, ~0UL);
 
-	if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_FAST;
+	if (kvm_is_radix(kvm)) {
+		if (cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+			__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+		switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
+		if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
+			__mtmsrd(0, 1); /* clear RI */
+
+	} else {
 		__mtmsrd(msr & ~(MSR_IR|MSR_DR|MSR_RI), 0);
+		switch_mmu_to_guest_hpt(kvm, vcpu, lpcr);
+	}
 
-	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
+	/* TLBIEL uses LPID=LPIDR, so run this after setting guest LPID */
+	kvmppc_check_need_tlb_flush(kvm, vc->pcpu, nested);
 
 	/*
 	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
@@ -229,9 +293,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	if (!cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG))
-		__mtmsrd(0, 1); /* clear RI */
-
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
 	mtspr(SPRN_DSISR, vcpu->arch.shregs.dsisr);
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
@@ -239,10 +300,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.guest_time);
 
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_FAST;
 	kvmppc_p9_enter_guest(vcpu);
-	// Radix host and guest means host never runs with guest MMU state
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
 	accumulate_time(vcpu, &vcpu->arch.rm_intr);
 
@@ -343,8 +401,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 #endif
 	}
 
-	radix_clear_slb();
-
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
 	/* Advance host PURR/SPURR by the amount used by guest */
@@ -378,11 +434,14 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -408,7 +467,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_HDEC, 0x7fffffff);
 
+	save_clear_guest_mmu(kvm, vcpu);
 	switch_mmu_to_host_radix(kvm, host_pidr);
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
 
 	/*
 	 * If we are in real mode, only switch MMU on after the MMU is
diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
index 9b8c2c41fa5f..7b23fe6e9ca0 100644
--- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
+++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
@@ -46,6 +46,10 @@ static int global_invalidates(struct kvm *kvm)
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
index 33aa0ef496e5..f7b45c3bff64 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -888,14 +888,11 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_ARCH_300)
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
@@ -1373,9 +1370,6 @@ guest_exit_cont:		/* r9 = vcpu, r12 = trap, r13 = paca */
 	stw	r5,VCPU_SLB_MAX(r9)
 
 	/* load host SLB entries */
-BEGIN_MMU_FTR_SECTION
-	b	guest_bypass
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 	ld	r8,PACA_SLBSHADOWPTR(r13)
 
 	.rept	SLB_NUM_BOLTED
@@ -3131,10 +3125,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_DAWR1)
 	PPC_SLBIA(6)
 	ptesync
 
-BEGIN_MMU_FTR_SECTION
-	b	4f
-END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
-
 	/* load host SLB entries */
 	ld	r8, PACA_SLBSHADOWPTR(r13)
 	.rept	SLB_NUM_BOLTED
@@ -3148,7 +3138,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_RADIX)
 3:	addi	r8, r8, 16
 	.endr
 
-4:	lwz	r7, KVM_HOST_LPID(r10)
+	lwz	r7, KVM_HOST_LPID(r10)
 	mtspr	SPRN_LPID, r7
 	mtspr	SPRN_PID, r0
 	ld	r8, KVM_HOST_LPCR(r10)
-- 
2.23.0

