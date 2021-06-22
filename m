Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 819763B0240
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:03:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NmQ1bwxz3dnd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:03:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pKc3jKCm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pKc3jKCm; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Nfp4ZFXz3bvM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:26 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id m17so7062221plx.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ExYg3HaSa6NEA2tye6Hf9NRWHYIufYXyPQWVG5gVKAs=;
 b=pKc3jKCm1nmrCd9j+U3DfYamb8eMv2gDY9XlER9uPR7FkXGUxtseEFiyChLsMn/uhj
 JYuI/SDRwrYuw5u/zUP+ul0nTcVc1irSrRz96thfHNuiSX1k4b6ZbPm/2J7rGMV5kHo0
 f/ttR7plf1+1+6CUdZNa3Ga3IdcfaCjIzIICWHKZnW8W5UDCxim7LuyYhjT6o/nV8dsl
 Oe2JiTRLg8YJ/e8BX4qWwejFvIH6ZRe5arfEdj5Z7k5U+OPLJKJRBLQljTqoiMbrMNkO
 iUw2PlidFZiKBOW1l+jBMoJUeUAhZezg8n4N+L072PC7zfY8h2QPnrDeMwZGqrTpbqO9
 sB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ExYg3HaSa6NEA2tye6Hf9NRWHYIufYXyPQWVG5gVKAs=;
 b=hIsPR/MC3YvpKyst0575zlK2GlJkSZeBscHJILH+fkkawX9pVg5EcuYguztW90xo3Z
 Do6OdvYmjpWhHIrVb1iKf5CcGKaHODnhbB8jt4ZS9FGbEPhJ/wMS2HuImQFmZAj16hDl
 BuVrrwwNxVYs4EnADTw2bIipUdxOfEf8jrq5QDlMwO7tg25PFMwYkHP7GUTLyEWl9dz4
 kk+mQ9POXkhJ/FDKOV3rldoVNkXOSXwFRObvU5Cnw5ipI3PvAHmA0+awo5CHjt0QSzmc
 yvGdLacILkZwWgt+7l+0xxcSc2qDGBDmskEwgVJOzDQLXpSynTWTy3QS66/xIgMy04zG
 Hbfw==
X-Gm-Message-State: AOAM533twDO+EF/w4tPFxZ+2CoHVJV8qfCpzLO48gX3PDmnsdz0Y6kFy
 egp/dmkMl9D9yjUT7lNAdmk=
X-Google-Smtp-Source: ABdhPJw8JCxPtWi4Z4NkqAEfJHWyLSnjh2s8Ho1DQotswBflA/J/klnhFFhlqdEhNJrtGCbEsge/pw==
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id
 d14-20020a170902728eb0290101c3b7a47fmr22200728pll.21.1624359503092; 
 Tue, 22 Jun 2021 03:58:23 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 11/43] KVM: PPC: Book3S HV P9: Implement PMU save/restore
 in C
Date: Tue, 22 Jun 2021 20:57:04 +1000
Message-Id: <20210622105736.633352-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

Implement the P9 path PMU save/restore code in C, and remove the
POWER9/10 code from the P7/8 path assembly.

-449 cycles (8533) POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |   5 -
 arch/powerpc/kvm/book3s_hv.c              | 205 ++++++++++++++++++++--
 arch/powerpc/kvm/book3s_hv_interrupts.S   |  13 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   |  43 +----
 4 files changed, 200 insertions(+), 66 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index 02ee6f5ac9fe..928db8ef9a5a 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -136,11 +136,6 @@ static inline void kvmppc_restore_tm_hv(struct kvm_vcpu *vcpu, u64 msr,
 					bool preserve_nv) { }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
-void kvmhv_save_host_pmu(void);
-void kvmhv_load_host_pmu(void);
-void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use);
-void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu);
-
 void kvmppc_p9_enter_guest(struct kvm_vcpu *vcpu);
 
 long kvmppc_h_set_dabr(struct kvm_vcpu *vcpu, unsigned long dabr);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f7349d150828..b1b94b3563b7 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3635,6 +3635,188 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	trace_kvmppc_run_core(vc, 1);
 }
 
+/*
+ * Privileged (non-hypervisor) host registers to save.
+ */
+struct p9_host_os_sprs {
+	unsigned long dscr;
+	unsigned long tidr;
+	unsigned long iamr;
+	unsigned long amr;
+	unsigned long fscr;
+
+	unsigned int pmc1;
+	unsigned int pmc2;
+	unsigned int pmc3;
+	unsigned int pmc4;
+	unsigned int pmc5;
+	unsigned int pmc6;
+	unsigned long mmcr0;
+	unsigned long mmcr1;
+	unsigned long mmcr2;
+	unsigned long mmcr3;
+	unsigned long mmcra;
+	unsigned long siar;
+	unsigned long sier1;
+	unsigned long sier2;
+	unsigned long sier3;
+	unsigned long sdar;
+};
+
+static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
+{
+	if (!(mmcr0 & MMCR0_FC))
+		goto do_freeze;
+	if (mmcra & MMCRA_SAMPLE_ENABLE)
+		goto do_freeze;
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		if (!(mmcr0 & MMCR0_PMCCEXT))
+			goto do_freeze;
+		if (!(mmcra & MMCRA_BHRB_DISABLE))
+			goto do_freeze;
+	}
+	return;
+
+do_freeze:
+	mmcr0 = MMCR0_FC;
+	mmcra = 0;
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		mmcr0 |= MMCR0_PMCCEXT;
+		mmcra = MMCRA_BHRB_DISABLE;
+	}
+
+	mtspr(SPRN_MMCR0, mmcr0);
+	mtspr(SPRN_MMCRA, mmcra);
+	isync();
+}
+
+static void save_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
+{
+	if (ppc_get_pmu_inuse()) {
+		/*
+		 * It might be better to put PMU handling (at least for the
+		 * host) in the perf subsystem because it knows more about what
+		 * is being used.
+		 */
+
+		/* POWER9, POWER10 do not implement HPMC or SPMC */
+
+		host_os_sprs->mmcr0 = mfspr(SPRN_MMCR0);
+		host_os_sprs->mmcra = mfspr(SPRN_MMCRA);
+
+		freeze_pmu(host_os_sprs->mmcr0, host_os_sprs->mmcra);
+
+		host_os_sprs->pmc1 = mfspr(SPRN_PMC1);
+		host_os_sprs->pmc2 = mfspr(SPRN_PMC2);
+		host_os_sprs->pmc3 = mfspr(SPRN_PMC3);
+		host_os_sprs->pmc4 = mfspr(SPRN_PMC4);
+		host_os_sprs->pmc5 = mfspr(SPRN_PMC5);
+		host_os_sprs->pmc6 = mfspr(SPRN_PMC6);
+		host_os_sprs->mmcr1 = mfspr(SPRN_MMCR1);
+		host_os_sprs->mmcr2 = mfspr(SPRN_MMCR2);
+		host_os_sprs->sdar = mfspr(SPRN_SDAR);
+		host_os_sprs->siar = mfspr(SPRN_SIAR);
+		host_os_sprs->sier1 = mfspr(SPRN_SIER);
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			host_os_sprs->mmcr3 = mfspr(SPRN_MMCR3);
+			host_os_sprs->sier2 = mfspr(SPRN_SIER2);
+			host_os_sprs->sier3 = mfspr(SPRN_SIER3);
+		}
+	}
+}
+
+static void load_p9_guest_pmu(struct kvm_vcpu *vcpu)
+{
+	mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
+	mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
+	mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
+	mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
+	mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
+	mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
+	mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
+	mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
+	mtspr(SPRN_SDAR, vcpu->arch.sdar);
+	mtspr(SPRN_SIAR, vcpu->arch.siar);
+	mtspr(SPRN_SIER, vcpu->arch.sier[0]);
+
+	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+		mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);
+		mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
+		mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
+	}
+
+	/* Set MMCRA then MMCR0 last */
+	mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
+	mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
+	/* No isync necessary because we're starting counters */
+}
+
+static void save_p9_guest_pmu(struct kvm_vcpu *vcpu)
+{
+	struct lppaca *lp;
+	int save_pmu = 1;
+
+	lp = vcpu->arch.vpa.pinned_addr;
+	if (lp)
+		save_pmu = lp->pmcregs_in_use;
+
+	if (save_pmu) {
+		vcpu->arch.mmcr[0] = mfspr(SPRN_MMCR0);
+		vcpu->arch.mmcra = mfspr(SPRN_MMCRA);
+
+		freeze_pmu(vcpu->arch.mmcr[0], vcpu->arch.mmcra);
+
+		vcpu->arch.pmc[0] = mfspr(SPRN_PMC1);
+		vcpu->arch.pmc[1] = mfspr(SPRN_PMC2);
+		vcpu->arch.pmc[2] = mfspr(SPRN_PMC3);
+		vcpu->arch.pmc[3] = mfspr(SPRN_PMC4);
+		vcpu->arch.pmc[4] = mfspr(SPRN_PMC5);
+		vcpu->arch.pmc[5] = mfspr(SPRN_PMC6);
+		vcpu->arch.mmcr[1] = mfspr(SPRN_MMCR1);
+		vcpu->arch.mmcr[2] = mfspr(SPRN_MMCR2);
+		vcpu->arch.sdar = mfspr(SPRN_SDAR);
+		vcpu->arch.siar = mfspr(SPRN_SIAR);
+		vcpu->arch.sier[0] = mfspr(SPRN_SIER);
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			vcpu->arch.mmcr[3] = mfspr(SPRN_MMCR3);
+			vcpu->arch.sier[1] = mfspr(SPRN_SIER2);
+			vcpu->arch.sier[2] = mfspr(SPRN_SIER3);
+		}
+	} else {
+		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
+	}
+}
+
+static void load_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
+{
+	if (ppc_get_pmu_inuse()) {
+		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
+		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
+		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
+		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
+		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
+		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
+		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
+		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
+		mtspr(SPRN_SDAR, host_os_sprs->sdar);
+		mtspr(SPRN_SIAR, host_os_sprs->siar);
+		mtspr(SPRN_SIER, host_os_sprs->sier1);
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
+			mtspr(SPRN_SIER2, host_os_sprs->sier2);
+			mtspr(SPRN_SIER3, host_os_sprs->sier3);
+		}
+
+		/* Set MMCRA then MMCR0 last */
+		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
+		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
+		isync();
+	}
+}
+
 static void load_spr_state(struct kvm_vcpu *vcpu)
 {
 	mtspr(SPRN_DSCR, vcpu->arch.dscr);
@@ -3677,17 +3859,6 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.dscr = mfspr(SPRN_DSCR);
 }
 
-/*
- * Privileged (non-hypervisor) host registers to save.
- */
-struct p9_host_os_sprs {
-	unsigned long dscr;
-	unsigned long tidr;
-	unsigned long iamr;
-	unsigned long amr;
-	unsigned long fscr;
-};
-
 static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
 	host_os_sprs->dscr = mfspr(SPRN_DSCR);
@@ -3735,7 +3906,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	struct p9_host_os_sprs host_os_sprs;
 	s64 dec;
 	u64 tb, next_timer;
-	int trap, save_pmu;
+	int trap;
 
 	WARN_ON_ONCE(vcpu->arch.ceded);
 
@@ -3748,7 +3919,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
-	kvmhv_save_host_pmu();		/* saves it to PACA kvm_hstate */
+	save_p9_host_pmu(&host_os_sprs);
 
 	kvmppc_subcore_enter_guest();
 
@@ -3776,7 +3947,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		}
 	}
 #endif
-	kvmhv_load_guest_pmu(vcpu);
+	load_p9_guest_pmu(vcpu);
 
 	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
 	load_fp_state(&vcpu->arch.fp);
@@ -3898,16 +4069,14 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
 		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
 
-	save_pmu = 1;
 	if (vcpu->arch.vpa.pinned_addr) {
 		struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
 		u32 yield_count = be32_to_cpu(lp->yield_count) + 1;
 		lp->yield_count = cpu_to_be32(yield_count);
 		vcpu->arch.vpa.dirty = 1;
-		save_pmu = lp->pmcregs_in_use;
 	}
 
-	kvmhv_save_guest_pmu(vcpu, save_pmu);
+	save_p9_guest_pmu(vcpu);
 #ifdef CONFIG_PPC_PSERIES
 	if (kvmhv_on_pseries())
 		get_lppaca()->pmcregs_in_use = ppc_get_pmu_inuse();
@@ -3920,7 +4089,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
-	kvmhv_load_host_pmu();
+	load_p9_host_pmu(&host_os_sprs);
 
 	kvmppc_subcore_exit_guest();
 
diff --git a/arch/powerpc/kvm/book3s_hv_interrupts.S b/arch/powerpc/kvm/book3s_hv_interrupts.S
index 4444f83cb133..59d89e4b154a 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupts.S
+++ b/arch/powerpc/kvm/book3s_hv_interrupts.S
@@ -104,7 +104,10 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
 	mtlr	r0
 	blr
 
-_GLOBAL(kvmhv_save_host_pmu)
+/*
+ * void kvmhv_save_host_pmu(void)
+ */
+kvmhv_save_host_pmu:
 BEGIN_FTR_SECTION
 	/* Work around P8 PMAE bug */
 	li	r3, -1
@@ -138,14 +141,6 @@ BEGIN_FTR_SECTION
 	std	r8, HSTATE_MMCR2(r13)
 	std	r9, HSTATE_SIER(r13)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
-BEGIN_FTR_SECTION
-	mfspr	r5, SPRN_MMCR3
-	mfspr	r6, SPRN_SIER2
-	mfspr	r7, SPRN_SIER3
-	std	r5, HSTATE_MMCR3(r13)
-	std	r6, HSTATE_SIER2(r13)
-	std	r7, HSTATE_SIER3(r13)
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	mfspr	r3, SPRN_PMC1
 	mfspr	r5, SPRN_PMC2
 	mfspr	r6, SPRN_PMC3
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index 007f87b97184..0eb06734bc26 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -2780,10 +2780,11 @@ kvmppc_msr_interrupt:
 	blr
 
 /*
+ * void kvmhv_load_guest_pmu(struct kvm_vcpu *vcpu)
+ *
  * Load up guest PMU state.  R3 points to the vcpu struct.
  */
-_GLOBAL(kvmhv_load_guest_pmu)
-EXPORT_SYMBOL_GPL(kvmhv_load_guest_pmu)
+kvmhv_load_guest_pmu:
 	mr	r4, r3
 	mflr	r0
 	li	r3, 1
@@ -2817,27 +2818,17 @@ END_FTR_SECTION_IFSET(CPU_FTR_PMAO_BUG)
 	mtspr	SPRN_MMCRA, r6
 	mtspr	SPRN_SIAR, r7
 	mtspr	SPRN_SDAR, r8
-BEGIN_FTR_SECTION
-	ld      r5, VCPU_MMCR + 24(r4)
-	ld      r6, VCPU_SIER + 8(r4)
-	ld      r7, VCPU_SIER + 16(r4)
-	mtspr   SPRN_MMCR3, r5
-	mtspr   SPRN_SIER2, r6
-	mtspr   SPRN_SIER3, r7
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 BEGIN_FTR_SECTION
 	ld	r5, VCPU_MMCR + 16(r4)
 	ld	r6, VCPU_SIER(r4)
 	mtspr	SPRN_MMCR2, r5
 	mtspr	SPRN_SIER, r6
-BEGIN_FTR_SECTION_NESTED(96)
 	lwz	r7, VCPU_PMC + 24(r4)
 	lwz	r8, VCPU_PMC + 28(r4)
 	ld	r9, VCPU_MMCRS(r4)
 	mtspr	SPRN_SPMC1, r7
 	mtspr	SPRN_SPMC2, r8
 	mtspr	SPRN_MMCRS, r9
-END_FTR_SECTION_NESTED(CPU_FTR_ARCH_300, 0, 96)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	mtspr	SPRN_MMCR0, r3
 	isync
@@ -2845,10 +2836,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 	blr
 
 /*
+ * void kvmhv_load_host_pmu(void)
+ *
  * Reload host PMU state saved in the PACA by kvmhv_save_host_pmu.
  */
-_GLOBAL(kvmhv_load_host_pmu)
-EXPORT_SYMBOL_GPL(kvmhv_load_host_pmu)
+kvmhv_load_host_pmu:
 	mflr	r0
 	lbz	r4, PACA_PMCINUSE(r13) /* is the host using the PMU? */
 	cmpwi	r4, 0
@@ -2886,25 +2878,18 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_MMCR2, r8
 	mtspr	SPRN_SIER, r9
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
-BEGIN_FTR_SECTION
-	ld      r5, HSTATE_MMCR3(r13)
-	ld      r6, HSTATE_SIER2(r13)
-	ld      r7, HSTATE_SIER3(r13)
-	mtspr   SPRN_MMCR3, r5
-	mtspr   SPRN_SIER2, r6
-	mtspr   SPRN_SIER3, r7
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	mtspr	SPRN_MMCR0, r3
 	isync
 	mtlr	r0
 23:	blr
 
 /*
+ * void kvmhv_save_guest_pmu(struct kvm_vcpu *vcpu, bool pmu_in_use)
+ *
  * Save guest PMU state into the vcpu struct.
  * r3 = vcpu, r4 = full save flag (PMU in use flag set in VPA)
  */
-_GLOBAL(kvmhv_save_guest_pmu)
-EXPORT_SYMBOL_GPL(kvmhv_save_guest_pmu)
+kvmhv_save_guest_pmu:
 	mr	r9, r3
 	mr	r8, r4
 BEGIN_FTR_SECTION
@@ -2953,14 +2938,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 BEGIN_FTR_SECTION
 	std	r10, VCPU_MMCR + 16(r9)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
-BEGIN_FTR_SECTION
-	mfspr   r5, SPRN_MMCR3
-	mfspr   r6, SPRN_SIER2
-	mfspr   r7, SPRN_SIER3
-	std     r5, VCPU_MMCR + 24(r9)
-	std     r6, VCPU_SIER + 8(r9)
-	std     r7, VCPU_SIER + 16(r9)
-END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 	std	r7, VCPU_SIAR(r9)
 	std	r8, VCPU_SDAR(r9)
 	mfspr	r3, SPRN_PMC1
@@ -2978,7 +2955,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_31)
 BEGIN_FTR_SECTION
 	mfspr	r5, SPRN_SIER
 	std	r5, VCPU_SIER(r9)
-BEGIN_FTR_SECTION_NESTED(96)
 	mfspr	r6, SPRN_SPMC1
 	mfspr	r7, SPRN_SPMC2
 	mfspr	r8, SPRN_MMCRS
@@ -2987,7 +2963,6 @@ BEGIN_FTR_SECTION_NESTED(96)
 	std	r8, VCPU_MMCRS(r9)
 	lis	r4, 0x8000
 	mtspr	SPRN_MMCRS, r4
-END_FTR_SECTION_NESTED(CPU_FTR_ARCH_300, 0, 96)
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
 22:	blr
 
-- 
2.23.0

