Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE403B024C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:04:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8Nnw2TLJz3f2Q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:04:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Ny6aZ/+D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ny6aZ/+D; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8Nfy05MXz3bxk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:33 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id k5so11867815pjj.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1UVfyN6S800OVpUfYU6vKNR78o9Xms2uSVHdVhoOtI=;
 b=Ny6aZ/+DdDF2m2z5DW3eHPTZI7U2a4VdP6p9A0kRdI6l5senPDVmgRRZfLXi354NTK
 iRMXCco85Oy3b3PNerqG/rWdxFfXMIVg8R2A5HKvyAR8dxodDLWkqS0uEqMAxaDOmpmB
 Ao8nyxNlfrVPLKEeTXciAQrFWsfH3bmMLEm2pDelo0JLCY8UPeTVlIoPjTxp9EjLNzFD
 NtBBBmRj71CogG5B0xnbn69oEu4UEes0e8sBEUYo92YlxdXHEu6h6LD2hSsEJ2SP0xkS
 T9lDGjJVQ4CTIzZgPL7Smt3bkuWDlIVL6OKcsAwWNkr4KGBWKW+Gp7r6MyUa1nMW1GKo
 Jsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i1UVfyN6S800OVpUfYU6vKNR78o9Xms2uSVHdVhoOtI=;
 b=EmeAj7pEqjPTLvQQekAcMGLrv6TpDYfS34RaoV+N0NFl++hO5v99b8+Xu0NetyKeI7
 +GqxJvGng6Z/S8KiFR97xh0oWcqCvuEcembr6MiGbLoSgiEWucE1BL1t++vMyeWeqjUU
 S1nQeQv0UTlWQgbnaKx9V2DnghLItjYa9D4fGEUmsdjX1o12qToq8ISM2TYcUEgV3ZG9
 dhs3ygUOf9W3AJXxm54NyXC72xDqyQOoUQo7YbGldoA0LJbnoQQn1zaqbWX0qyu0s18j
 2J1foCgheA5jY5w3N2K5b5axBevOJpF8YG9VJM4ace7A5Qn2J2IRuBBsX9apxoL2BSRm
 lcNA==
X-Gm-Message-State: AOAM531ZQFdu5/yqfjpU4G/XCO02nOyCHpTMbM7l26bCoBT7k9Yw73yD
 W4tHLESGlfPDYm45B8fh9yY=
X-Google-Smtp-Source: ABdhPJxWr5mXiXP5ywnx39fmKhSpfgF7Xr9OSj2PGWNx36nxqlz00KZNdkmcU6EDxBIOd/P502ZqYw==
X-Received: by 2002:a17:90b:4b07:: with SMTP id
 lx7mr3319190pjb.158.1624359510657; 
 Tue, 22 Jun 2021 03:58:30 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 14/43] KVM: PPC: Book3S HV P9: Demand fault PMU SPRs when
 marked not inuse
Date: Tue, 22 Jun 2021 20:57:07 +1000
Message-Id: <20210622105736.633352-15-npiggin@gmail.com>
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

The pmcregs_in_use field in the guest VPA can not be trusted to reflect
what the guest is doing with PMU SPRs, so the PMU must always be managed
(stopped) when exiting the guest, and SPR values set when entering the
guest to ensure it can't cause a covert channel or otherwise cause other
guests or the host to misbehave.

So prevent guest access to the PMU with HFSCR[PM] if pmcregs_in_use is
clear, and avoid the PMU SPR access on every partition switch. Guests
that set pmcregs_in_use incorrectly or when first setting it and using
the PMU will take a hypervisor facility unavailable interrupt that will
bring in the PMU SPRs.

-774 cycles (7759) cycles POWER9 virt-mode NULL hcall

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h |   1 +
 arch/powerpc/kvm/book3s_hv.c        | 122 ++++++++++++++++++++++------
 arch/powerpc/kvm/book3s_hv_nested.c |  12 ++-
 3 files changed, 105 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 7e4c3a741951..5c003a5ff854 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -819,6 +819,7 @@ struct kvm_vcpu_arch {
 	/* For support of nested guests */
 	struct kvm_nested_guest *nested;
 	u32 nested_vcpu_id;
+	u64 nested_hfscr;
 	gpa_t nested_io_gpr;
 #endif
 
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 13b8389b0479..0733bb95f439 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1349,6 +1349,20 @@ static int kvmppc_emulate_doorbell_instr(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
+/*
+ * If the lppaca had pmcregs_in_use clear when we exited the guest, then
+ * HFSCR_PM is cleared for next entry. If the guest then tries to access
+ * the PMU SPRs, we get this facility unavailable interrupt. Putting HFSCR_PM
+ * back in the guest HFSCR will cause the next entry to load the PMU SPRs and
+ * allow the guest access to continue.
+ */
+static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.hfscr |= HFSCR_PM;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1618,16 +1632,22 @@ XXX benchmark guest exits
 	 * to emulate.
 	 * Otherwise, we just generate a program interrupt to the guest.
 	 */
-	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
 		r = EMULATE_FAIL;
-		if (((vcpu->arch.hfscr >> 56) == FSCR_MSGP_LG) &&
-		    cpu_has_feature(CPU_FTR_ARCH_300))
-			r = kvmppc_emulate_doorbell_instr(vcpu);
+		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
+			unsigned long cause = vcpu->arch.hfscr >> 56;
+
+			if (cause == FSCR_MSGP_LG)
+				r = kvmppc_emulate_doorbell_instr(vcpu);
+			if (cause == FSCR_PM_LG)
+				r = kvmppc_pmu_unavailable(vcpu);
+		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
 			r = RESUME_GUEST;
 		}
 		break;
+	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	case BOOK3S_INTERRUPT_HV_SOFTPATCH:
@@ -1734,6 +1754,19 @@ static int kvmppc_handle_nested_exit(struct kvm_vcpu *vcpu)
 		srcu_read_unlock(&vcpu->kvm->srcu, srcu_idx);
 		break;
 
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
+		unsigned long cause = vcpu->arch.hfscr >> 56;
+
+		r = EMULATE_FAIL;
+		if (cause == FSCR_PM_LG && (vcpu->arch.nested_hfscr & HFSCR_PM))
+			r = kvmppc_pmu_unavailable(vcpu);
+
+		if (r == EMULATE_FAIL)
+			r = RESUME_HOST;
+
+		break;
+	}
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	case BOOK3S_INTERRUPT_HV_SOFTPATCH:
 		/*
@@ -3693,6 +3726,17 @@ static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
 static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
 				struct p9_host_os_sprs *host_os_sprs)
 {
+	struct lppaca *lp;
+	int load_pmu = 1;
+
+	lp = vcpu->arch.vpa.pinned_addr;
+	if (lp)
+		load_pmu = lp->pmcregs_in_use;
+
+	if (load_pmu)
+	      vcpu->arch.hfscr |= HFSCR_PM;
+
+	/* Save host */
 	if (ppc_get_pmu_inuse()) {
 		/*
 		 * It might be better to put PMU handling (at least for the
@@ -3737,29 +3781,31 @@ static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
 	}
 #endif
 
-	/* load guest */
-	mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
-	mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
-	mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
-	mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
-	mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
-	mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
-	mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
-	mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
-	mtspr(SPRN_SDAR, vcpu->arch.sdar);
-	mtspr(SPRN_SIAR, vcpu->arch.siar);
-	mtspr(SPRN_SIER, vcpu->arch.sier[0]);
+	/* Load guest */
+	if (vcpu->arch.hfscr & HFSCR_PM) {
+		mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
+		mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
+		mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
+		mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
+		mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
+		mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
+		mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
+		mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
+		mtspr(SPRN_SDAR, vcpu->arch.sdar);
+		mtspr(SPRN_SIAR, vcpu->arch.siar);
+		mtspr(SPRN_SIER, vcpu->arch.sier[0]);
 
-	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);
-		mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
-		mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
-	}
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);
+			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
+			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
+		}
 
-	/* Set MMCRA then MMCR0 last */
-	mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
-	mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
-	/* No isync necessary because we're starting counters */
+		/* Set MMCRA then MMCR0 last */
+		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
+		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
+		/* No isync necessary because we're starting counters */
+	}
 }
 
 static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
@@ -3795,9 +3841,31 @@ static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
 			vcpu->arch.sier[1] = mfspr(SPRN_SIER2);
 			vcpu->arch.sier[2] = mfspr(SPRN_SIER3);
 		}
-	} else {
+
+	} else if (vcpu->arch.hfscr & HFSCR_PM) {
+		/*
+		 * The guest accessed PMC SPRs without specifying they should
+		 * be preserved. Stop them from counting if the guest had
+		 * started anything.
+		 */
 		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
-	}
+
+		/*
+		 * Demand-fault PMU register access in the guest.
+		 *
+		 * This is used to grab the guest's VPA pmcregs_in_use value
+		 * and reflect it into the host's VPA in the case of a nested
+		 * hypervisor.
+		 *
+		 * It also avoids having to zero-out SPRs after each guest
+		 * exit to avoid side-channels when.
+		 *
+		 * This is cleared here when we exit the guest, so later HFSCR
+		 * interrupt handling can add it back to run the guest with
+		 * PM enabled next time.
+		 */
+		vcpu->arch.hfscr &= ~HFSCR_PM;
+	} /* otherwise the PMU should still be frozen from guest entry */
 
 #ifdef CONFIG_PPC_PSERIES
 	if (kvmhv_on_pseries())
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 60724f674421..6add13a22f56 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -103,7 +103,7 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
 
 	hr->dpdes = vc->dpdes;
-	hr->hfscr = vcpu->arch.hfscr;
+	hr->hfscr = vcpu->arch.nested_hfscr;
 	hr->purr = vcpu->arch.purr;
 	hr->spurr = vcpu->arch.spurr;
 	hr->ic = vcpu->arch.ic;
@@ -126,6 +126,10 @@ static void save_hv_return_state(struct kvm_vcpu *vcpu, int trap,
 	case BOOK3S_INTERRUPT_H_INST_STORAGE:
 		hr->asdr = vcpu->arch.fault_gpa;
 		break;
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+		hr->hfscr &= ~HFSCR_INTR_CAUSE;
+		hr->hfscr |= vcpu->arch.hfscr & HFSCR_INTR_CAUSE;
+		break;
 	case BOOK3S_INTERRUPT_H_EMUL_ASSIST:
 		hr->heir = vcpu->arch.emul_inst;
 		break;
@@ -161,9 +165,10 @@ static void sanitise_hv_regs(struct kvm_vcpu *vcpu, struct hv_guest_state *hr)
 
 	/*
 	 * Don't let L1 enable features for L2 which we've disabled for L1,
-	 * but preserve the interrupt cause field.
+	 * but preserve the interrupt cause field and facilities that might
+	 * be disabled for demand faulting in the L1.
 	 */
-	hr->hfscr &= (HFSCR_INTR_CAUSE | vcpu->arch.hfscr);
+	hr->hfscr &= (HFSCR_INTR_CAUSE | HFSCR_PM | vcpu->arch.hfscr);
 
 	/* Don't let data address watchpoint match in hypervisor state */
 	hr->dawrx0 &= ~DAWRX_HYP;
@@ -342,6 +347,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	/* set L1 state to L2 state */
 	vcpu->arch.nested = l2;
 	vcpu->arch.nested_vcpu_id = l2_hv.vcpu_token;
+	vcpu->arch.nested_hfscr = l2_hv.hfscr;
 	vcpu->arch.regs = l2_regs;
 
 	/* Guest must always run with ME enabled, HV disabled. */
-- 
2.23.0

