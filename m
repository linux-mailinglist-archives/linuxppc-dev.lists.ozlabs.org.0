Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED63459FD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:13:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0Mb4szLz3g44
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:13:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aO5pEilO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aO5pEilO; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxD0HCQz3bhl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:52 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso2462737pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rs1gP2bVxyS+HAsX9qTFCD9KR6aw0I7MzITvmqeK/vQ=;
 b=aO5pEilOvyLJVOwCXab7DFUzpXaX9bSS3XBIm2KlaZ4Bh8qj60VEx6f+rw7HOO6lIV
 ocm25YYH7r+vg7uv7OwXNPpKpPyEIbqnfuBGTfY6WbXzYU/8nSzUU/u5dqD5nlJkphSp
 ofx0aBUmP8vnspdKTwHi1dZmRlllKyPsG2lFh8kX5mlhCpEq3ItmKl8R83kwSmgOluYg
 tIGbXyILpThMVU7GfwxO1vWUnNUum4yx9A2U21Ty59MDXGwe5GEPrmbdn2ng63egm5Hg
 O+Rs+pGs3SzxiLl6z4VHCjmqtdIo+Z52fC0Bs/Ht0mRRUC2iiXWsvDuEe6cpq+elboLd
 kAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rs1gP2bVxyS+HAsX9qTFCD9KR6aw0I7MzITvmqeK/vQ=;
 b=0esmOWzWUlId7kPtwHl58WE2HrTNHAcvbQ+1KNqc8j/Vy+9xU6Xxb4FQiy/uIACQJQ
 2j/ucl8p0+c2i+TdCAsJ4BYSoYaQK8b3RmfEfqGxDzLcr98or72Oef29MB1eemSW8ofF
 oWSAiREMENxxU/EJR2LFgNiUmXWci1v/OXhqBNAPl4PrYvmLNbRsVhWFKPSzGt+ggTGH
 LcQd9Skde5OGj/Iz+oDmWG92bzCT7zaMlcDwJ6O7xsJy/KshslcfFjs2ttve/TVo+ddK
 FvRMwuYb+hgu9q+jYew1HYaVR17JRvmbn4LFdFqKTzgK1EIY26cOrz+ioj9pXOBWNyts
 wAtw==
X-Gm-Message-State: AOAM533ncSC6Hcgij4DI7Ybz8zemcKR2OjG0XZWmYBMj016ugcq6xBGN
 3TQxhBKmhdJ7AhFJS6Mapiw3cg+26zDrXw==
X-Google-Smtp-Source: ABdhPJwuBLShFBYWA9bvQnpGj4nVp173UcDgI+eApprmA37REiJtcNBXVCDMQy6FIiJmtG0NvYAzNA==
X-Received: by 2002:a17:90b:4d84:: with SMTP id
 oj4mr1322614pjb.90.1637661230224; 
 Tue, 23 Nov 2021 01:53:50 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 31/53] KVM: PPC: Book3S HV P9: Move remaining SPR and MSR
 access into low level entry
Date: Tue, 23 Nov 2021 19:52:09 +1000
Message-Id: <20211123095231.1036501-32-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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

Move register saving and loading from kvmhv_p9_guest_entry() into the HV
and nested entry handlers.

Accesses are scheduled to reduce mtSPR / mfSPR interleaving which
reduces SPR scoreboard stalls.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 79 ++++++++++------------
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 96 ++++++++++++++++++++-------
 2 files changed, 109 insertions(+), 66 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 69631309b6af..40bee0d61482 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3827,9 +3827,15 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 	unsigned long host_psscr;
+	unsigned long msr;
 	struct hv_guest_state hvregs;
-	int trap;
+	struct p9_host_os_sprs host_os_sprs;
 	s64 dec;
+	int trap;
+
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
+
+	save_p9_host_os_sprs(&host_os_sprs);
 
 	/*
 	 * We need to save and restore the guest visible part of the
@@ -3838,6 +3844,27 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	 * this is done in kvmhv_vcpu_entry_p9() below otherwise.
 	 */
 	host_psscr = mfspr(SPRN_PSSCR_PR);
+
+	hard_irq_disable();
+	if (lazy_irq_pending())
+		return 0;
+
+	/* MSR bits may have been cleared by context switch */
+	msr = 0;
+	if (IS_ENABLED(CONFIG_PPC_FPU))
+		msr |= MSR_FP;
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		msr |= MSR_VEC;
+	if (cpu_has_feature(CPU_FTR_VSX))
+		msr |= MSR_VSX;
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		msr |= MSR_TM;
+	msr = msr_check_and_set(msr);
+
+	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
+		msr = mfmsr(); /* TM restore can update msr */
+
 	mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
 	kvmhv_save_hv_regs(vcpu, &hvregs);
 	hvregs.lpcr = lpcr;
@@ -3879,12 +3906,20 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
 	mtspr(SPRN_PSSCR_PR, host_psscr);
 
+	store_vcpu_state(vcpu);
+
 	dec = mfspr(SPRN_DEC);
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 		dec = (s32) dec;
 	*tb = mftb();
 	vcpu->arch.dec_expires = dec + (*tb + vc->tb_offset);
 
+	timer_rearm_host_dec(*tb);
+
+	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
+
+	switch_pmu_to_host(vcpu, &host_os_sprs);
+
 	return trap;
 }
 
@@ -3895,9 +3930,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			 unsigned long lpcr, u64 *tb)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	struct p9_host_os_sprs host_os_sprs;
 	u64 next_timer;
-	unsigned long msr;
 	int trap;
 
 	next_timer = timer_get_next_tb();
@@ -3908,33 +3941,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->arch.ceded = 0;
 
-	save_p9_host_os_sprs(&host_os_sprs);
-
-	/*
-	 * This could be combined with MSR[RI] clearing, but that expands
-	 * the unrecoverable window. It would be better to cover unrecoverable
-	 * with KVM bad interrupt handling rather than use MSR[RI] at all.
-	 *
-	 * Much more difficult and less worthwhile to combine with IR/DR
-	 * disable.
-	 */
-	hard_irq_disable();
-	if (lazy_irq_pending())
-		return 0;
-
-	/* MSR bits may have been cleared by context switch */
-	msr = 0;
-	if (IS_ENABLED(CONFIG_PPC_FPU))
-		msr |= MSR_FP;
-	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		msr |= MSR_VEC;
-	if (cpu_has_feature(CPU_FTR_VSX))
-		msr |= MSR_VSX;
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-		msr |= MSR_TM;
-	msr = msr_check_and_set(msr);
-
 	kvmppc_subcore_enter_guest();
 
 	vc->entry_exit_map = 1;
@@ -3942,11 +3948,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
-		msr = mfmsr(); /* MSR may have been updated */
-
-	switch_pmu_to_guest(vcpu, &host_os_sprs);
-
 	if (kvmhv_on_pseries()) {
 		trap = kvmhv_vcpu_entry_p9_nested(vcpu, time_limit, lpcr, tb);
 
@@ -3989,16 +3990,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			vcpu->arch.slb_max = 0;
 	}
 
-	switch_pmu_to_host(vcpu, &host_os_sprs);
-
-	store_vcpu_state(vcpu);
-
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	timer_rearm_host_dec(*tb);
-
-	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
-
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 784ff5429ebc..fa080533bd8d 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -538,6 +538,7 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
+	struct p9_host_os_sprs host_os_sprs;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_nested_guest *nested = vcpu->arch.nested;
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
@@ -567,9 +568,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.ceded = 0;
 
-	/* Could avoid mfmsr by passing around, but probably no big deal */
-	msr = mfmsr();
-
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
 	host_dawr0 = mfspr(SPRN_DAWR0);
@@ -584,6 +582,41 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
 	local_paca->kvm_hstate.host_spurr = mfspr(SPRN_SPURR);
 
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
+
+	save_p9_host_os_sprs(&host_os_sprs);
+
+	/*
+	 * This could be combined with MSR[RI] clearing, but that expands
+	 * the unrecoverable window. It would be better to cover unrecoverable
+	 * with KVM bad interrupt handling rather than use MSR[RI] at all.
+	 *
+	 * Much more difficult and less worthwhile to combine with IR/DR
+	 * disable.
+	 */
+	hard_irq_disable();
+	if (lazy_irq_pending()) {
+		trap = 0;
+		goto out;
+	}
+
+	/* MSR bits may have been cleared by context switch */
+	msr = 0;
+	if (IS_ENABLED(CONFIG_PPC_FPU))
+		msr |= MSR_FP;
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		msr |= MSR_VEC;
+	if (cpu_has_feature(CPU_FTR_VSX))
+		msr |= MSR_VSX;
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		msr |= MSR_TM;
+	msr = msr_check_and_set(msr);
+	/* Save MSR for restore. This is after hard disable, so EE is clear. */
+
+	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
+		msr = mfmsr(); /* MSR may have been updated */
+
 	if (vc->tb_offset) {
 		u64 new_tb = *tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -642,6 +675,14 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
 	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
 
+	/*
+	 * It might be preferable to load_vcpu_state here, in order to get the
+	 * GPR/FP register loads executing in parallel with the previous mtSPR
+	 * instructions, but for now that can't be done because the TM handling
+	 * in load_vcpu_state can change some SPRs and vcpu state (nip, msr).
+	 * But TM could be split out if this would be a significant benefit.
+	 */
+
 	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_HV_P9;
 
 	/*
@@ -819,6 +860,20 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vc->dpdes = mfspr(SPRN_DPDES);
 	vc->vtb = mfspr(SPRN_VTB);
 
+	save_clear_guest_mmu(kvm, vcpu);
+	switch_mmu_to_host(kvm, host_pidr);
+
+	/*
+	 * If we are in real mode, only switch MMU on after the MMU is
+	 * switched to host, to avoid the P9_RADIX_PREFETCH_BUG.
+	 */
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
+			vcpu->arch.shregs.msr & MSR_TS_MASK)
+		msr |= MSR_TS_S;
+	__mtmsrd(msr, 0);
+
+	store_vcpu_state(vcpu);
+
 	dec = mfspr(SPRN_DEC);
 	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
 		dec = (s32) dec;
@@ -851,6 +906,19 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		mtspr(SPRN_DAWRX1, host_dawrx1);
 	}
 
+	mtspr(SPRN_DPDES, 0);
+	if (vc->pcr)
+		mtspr(SPRN_PCR, PCR_MASK);
+
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
+
+	timer_rearm_host_dec(*tb);
+
+	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
+
+	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
+
 	if (kvm_is_radix(kvm)) {
 		/*
 		 * Since this is radix, do a eieio; tlbsync; ptesync sequence
@@ -867,26 +935,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		asm volatile(PPC_CP_ABORT);
 
-	mtspr(SPRN_DPDES, 0);
-	if (vc->pcr)
-		mtspr(SPRN_PCR, PCR_MASK);
-
-	/* HDEC must be at least as large as DEC, so decrementer_max fits */
-	mtspr(SPRN_HDEC, decrementer_max);
-
-	save_clear_guest_mmu(kvm, vcpu);
-	switch_mmu_to_host(kvm, host_pidr);
-	local_paca->kvm_hstate.in_guest = KVM_GUEST_MODE_NONE;
-
-	/*
-	 * If we are in real mode, only switch MMU on after the MMU is
-	 * switched to host, to avoid the P9_RADIX_PREFETCH_BUG.
-	 */
-	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
-	    vcpu->arch.shregs.msr & MSR_TS_MASK)
-		msr |= MSR_TS_S;
-
-	__mtmsrd(msr, 0);
+out:
+	switch_pmu_to_host(vcpu, &host_os_sprs);
 
 	end_timing(vcpu);
 
-- 
2.23.0

