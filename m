Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 890AE3B0272
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:10:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NwL2LL8z3fpR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NVs5KK9Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NVs5KK9Q; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NgY3Ws3z3069
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:05 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id bb20so7683102pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7njMsp5UImsN5WSJrrT2EzB0oLmAbpHkQ/GPns2/xQY=;
 b=NVs5KK9QEBR6WTfvhmMZbQeCsbi/SwujVllCcrCqHxBvMRV54x0kW5CCvLLNqggJLm
 rPY+UtSH36TLDyUou2xEneR+o01nx3wp3XaTsu1qX86lvkbzoGRJWtXlG4ffXelxMyWY
 eNFRxEz9X4A7lmbv/VHDhyUX5AqtmGZcTL9LOxOQv0kdbOgKjPT7BRuFMLLCTuIZHvhD
 3VK1iC42CzIXPv9irDM53U2xsYWCkOmHr4SOylneqFUErJ5HlQuyt5aMZCc3SXftu4RC
 ZLxJGQHxbRR+Mw4x8omll7ZY0b/Ogc8hxnkFWzcz2uDHTKIBDU0W0dVdL/IuxuqADNsY
 TvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7njMsp5UImsN5WSJrrT2EzB0oLmAbpHkQ/GPns2/xQY=;
 b=E6wqbnVTh0MGb5+wTi5ZiD/wF5lkHF9WDrIJMMUqWgjMc4VJtxuuHUeUFj/LR0pr+l
 B36lSdf8WbZ4QwxlgeXWpCkmgIlmIJ843IeHlzT9cna0LcLExtAaxz7w01TqdQYLA6KO
 GiH7BAcg9/yjx1cqp1etej4y/UHPXU78iJzqO9NipN97EPB8wxEUJ6JIppw4ZoEuLEkG
 SFPWDycByYV7Pcyj0iLQeLDoyUvAZFZHBmRd5+b+5sY0syjPiFfmOHOe3xzyJZgaWWYV
 EX5YajciyT9jzXG1v2EWJU2auRNYFi99QApPqhf4U/pu12eS0F+//77Z5uASmNBROSUG
 RrZg==
X-Gm-Message-State: AOAM533nnwI0sPEJn8WxAeZyJyyZVMIcnl0QGaq2z1jgvOi3axwI7JLw
 JPreq46jy5JEj7XOeZzQYRTff9HJgqU=
X-Google-Smtp-Source: ABdhPJyc6tpiF3QUuqLawTfZQG9yFAhBgfAp6SI1Jyr8BVxD2vLyL65KCInjC9MgjyYjz3+aVNgG2g==
X-Received: by 2002:a17:902:c947:b029:125:34d4:249d with SMTP id
 i7-20020a170902c947b029012534d4249dmr8048100pla.3.1624359542527; 
 Tue, 22 Jun 2021 03:59:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 27/43] KVM: PPC: Book3S HV P9: Move host OS save/restore
 functions to built-in
Date: Tue, 22 Jun 2021 20:57:20 +1000
Message-Id: <20210622105736.633352-28-npiggin@gmail.com>
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

Move the P9 guest/host register switching functions to the built-in
P9 entry code, and export it for nested to use as well.

This allows more flexibility in scheduling these supervisor privileged
SPR accesses with the HV privileged and PR SPR accesses in the low level
entry code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 351 +-------------------------
 arch/powerpc/kvm/book3s_hv.h          |  39 +++
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 332 ++++++++++++++++++++++++
 3 files changed, 372 insertions(+), 350 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_hv.h

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 35749b0b663f..a7660af22161 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -79,6 +79,7 @@
 #include <asm/dtl.h>
 
 #include "book3s.h"
+#include "book3s_hv.h"
 
 #define CREATE_TRACE_POINTS
 #include "trace_hv.h"
@@ -3675,356 +3676,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	trace_kvmppc_run_core(vc, 1);
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
-
-	unsigned int pmc1;
-	unsigned int pmc2;
-	unsigned int pmc3;
-	unsigned int pmc4;
-	unsigned int pmc5;
-	unsigned int pmc6;
-	unsigned long mmcr0;
-	unsigned long mmcr1;
-	unsigned long mmcr2;
-	unsigned long mmcr3;
-	unsigned long mmcra;
-	unsigned long siar;
-	unsigned long sier1;
-	unsigned long sier2;
-	unsigned long sier3;
-	unsigned long sdar;
-};
-
-static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
-{
-	if (!(mmcr0 & MMCR0_FC))
-		goto do_freeze;
-	if (mmcra & MMCRA_SAMPLE_ENABLE)
-		goto do_freeze;
-	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		if (!(mmcr0 & MMCR0_PMCCEXT))
-			goto do_freeze;
-		if (!(mmcra & MMCRA_BHRB_DISABLE))
-			goto do_freeze;
-	}
-	return;
-
-do_freeze:
-	mmcr0 = MMCR0_FC;
-	mmcra = 0;
-	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		mmcr0 |= MMCR0_PMCCEXT;
-		mmcra = MMCRA_BHRB_DISABLE;
-	}
-
-	mtspr(SPRN_MMCR0, mmcr0);
-	mtspr(SPRN_MMCRA, mmcra);
-	isync();
-}
-
-static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
-				struct p9_host_os_sprs *host_os_sprs)
-{
-	struct lppaca *lp;
-	int load_pmu = 1;
-
-	lp = vcpu->arch.vpa.pinned_addr;
-	if (lp)
-		load_pmu = lp->pmcregs_in_use;
-
-	if (load_pmu)
-	      vcpu->arch.hfscr |= HFSCR_PM;
-
-	/* Save host */
-	if (ppc_get_pmu_inuse()) {
-		/*
-		 * It might be better to put PMU handling (at least for the
-		 * host) in the perf subsystem because it knows more about what
-		 * is being used.
-		 */
-
-		/* POWER9, POWER10 do not implement HPMC or SPMC */
-
-		host_os_sprs->mmcr0 = mfspr(SPRN_MMCR0);
-		host_os_sprs->mmcra = mfspr(SPRN_MMCRA);
-
-		freeze_pmu(host_os_sprs->mmcr0, host_os_sprs->mmcra);
-
-		host_os_sprs->pmc1 = mfspr(SPRN_PMC1);
-		host_os_sprs->pmc2 = mfspr(SPRN_PMC2);
-		host_os_sprs->pmc3 = mfspr(SPRN_PMC3);
-		host_os_sprs->pmc4 = mfspr(SPRN_PMC4);
-		host_os_sprs->pmc5 = mfspr(SPRN_PMC5);
-		host_os_sprs->pmc6 = mfspr(SPRN_PMC6);
-		host_os_sprs->mmcr1 = mfspr(SPRN_MMCR1);
-		host_os_sprs->mmcr2 = mfspr(SPRN_MMCR2);
-		host_os_sprs->sdar = mfspr(SPRN_SDAR);
-		host_os_sprs->siar = mfspr(SPRN_SIAR);
-		host_os_sprs->sier1 = mfspr(SPRN_SIER);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			host_os_sprs->mmcr3 = mfspr(SPRN_MMCR3);
-			host_os_sprs->sier2 = mfspr(SPRN_SIER2);
-			host_os_sprs->sier3 = mfspr(SPRN_SIER3);
-		}
-	}
-
-#ifdef CONFIG_PPC_PSERIES
-	if (kvmhv_on_pseries()) {
-		if (vcpu->arch.vpa.pinned_addr) {
-			struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-			get_lppaca()->pmcregs_in_use = lp->pmcregs_in_use;
-		} else {
-			get_lppaca()->pmcregs_in_use = 1;
-		}
-	}
-#endif
-
-	/* Load guest */
-	if (vcpu->arch.hfscr & HFSCR_PM) {
-		mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
-		mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
-		mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
-		mtspr(SPRN_PMC4, vcpu->arch.pmc[3]);
-		mtspr(SPRN_PMC5, vcpu->arch.pmc[4]);
-		mtspr(SPRN_PMC6, vcpu->arch.pmc[5]);
-		mtspr(SPRN_MMCR1, vcpu->arch.mmcr[1]);
-		mtspr(SPRN_MMCR2, vcpu->arch.mmcr[2]);
-		mtspr(SPRN_SDAR, vcpu->arch.sdar);
-		mtspr(SPRN_SIAR, vcpu->arch.siar);
-		mtspr(SPRN_SIER, vcpu->arch.sier[0]);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);
-			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
-			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
-		}
-
-		/* Set MMCRA then MMCR0 last */
-		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
-		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
-		/* No isync necessary because we're starting counters */
-	}
-}
-
-static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
-				struct p9_host_os_sprs *host_os_sprs)
-{
-	struct lppaca *lp;
-	int save_pmu = 1;
-
-	lp = vcpu->arch.vpa.pinned_addr;
-	if (lp)
-		save_pmu = lp->pmcregs_in_use;
-
-	if (save_pmu) {
-		vcpu->arch.mmcr[0] = mfspr(SPRN_MMCR0);
-		vcpu->arch.mmcra = mfspr(SPRN_MMCRA);
-
-		freeze_pmu(vcpu->arch.mmcr[0], vcpu->arch.mmcra);
-
-		vcpu->arch.pmc[0] = mfspr(SPRN_PMC1);
-		vcpu->arch.pmc[1] = mfspr(SPRN_PMC2);
-		vcpu->arch.pmc[2] = mfspr(SPRN_PMC3);
-		vcpu->arch.pmc[3] = mfspr(SPRN_PMC4);
-		vcpu->arch.pmc[4] = mfspr(SPRN_PMC5);
-		vcpu->arch.pmc[5] = mfspr(SPRN_PMC6);
-		vcpu->arch.mmcr[1] = mfspr(SPRN_MMCR1);
-		vcpu->arch.mmcr[2] = mfspr(SPRN_MMCR2);
-		vcpu->arch.sdar = mfspr(SPRN_SDAR);
-		vcpu->arch.siar = mfspr(SPRN_SIAR);
-		vcpu->arch.sier[0] = mfspr(SPRN_SIER);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			vcpu->arch.mmcr[3] = mfspr(SPRN_MMCR3);
-			vcpu->arch.sier[1] = mfspr(SPRN_SIER2);
-			vcpu->arch.sier[2] = mfspr(SPRN_SIER3);
-		}
-
-	} else if (vcpu->arch.hfscr & HFSCR_PM) {
-		/*
-		 * The guest accessed PMC SPRs without specifying they should
-		 * be preserved. Stop them from counting if the guest had
-		 * started anything.
-		 */
-		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
-
-		/*
-		 * Demand-fault PMU register access in the guest.
-		 *
-		 * This is used to grab the guest's VPA pmcregs_in_use value
-		 * and reflect it into the host's VPA in the case of a nested
-		 * hypervisor.
-		 *
-		 * It also avoids having to zero-out SPRs after each guest
-		 * exit to avoid side-channels when.
-		 *
-		 * This is cleared here when we exit the guest, so later HFSCR
-		 * interrupt handling can add it back to run the guest with
-		 * PM enabled next time.
-		 */
-		vcpu->arch.hfscr &= ~HFSCR_PM;
-	} /* otherwise the PMU should still be frozen from guest entry */
-
-#ifdef CONFIG_PPC_PSERIES
-	if (kvmhv_on_pseries())
-		get_lppaca()->pmcregs_in_use = ppc_get_pmu_inuse();
-#endif
-
-	if (ppc_get_pmu_inuse()) {
-		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
-		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
-		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
-		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
-		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
-		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
-		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
-		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
-		mtspr(SPRN_SDAR, host_os_sprs->sdar);
-		mtspr(SPRN_SIAR, host_os_sprs->siar);
-		mtspr(SPRN_SIER, host_os_sprs->sier1);
-
-		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
-			mtspr(SPRN_SIER2, host_os_sprs->sier2);
-			mtspr(SPRN_SIER3, host_os_sprs->sier3);
-		}
-
-		/* Set MMCRA then MMCR0 last */
-		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
-		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
-		isync();
-	}
-}
-
-static void load_spr_state(struct kvm_vcpu *vcpu,
-				struct p9_host_os_sprs *host_os_sprs)
-{
-	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
-		mtspr(SPRN_TIDR, vcpu->arch.tid);
-	if (host_os_sprs->iamr != vcpu->arch.iamr)
-		mtspr(SPRN_IAMR, vcpu->arch.iamr);
-	if (host_os_sprs->amr != vcpu->arch.amr)
-		mtspr(SPRN_AMR, vcpu->arch.amr);
-	if (vcpu->arch.uamor != 0)
-		mtspr(SPRN_UAMOR, vcpu->arch.uamor);
-	if (host_os_sprs->fscr != vcpu->arch.fscr)
-		mtspr(SPRN_FSCR, vcpu->arch.fscr);
-	if (host_os_sprs->dscr != vcpu->arch.dscr)
-		mtspr(SPRN_DSCR, vcpu->arch.dscr);
-	if (vcpu->arch.pspb != 0)
-		mtspr(SPRN_PSPB, vcpu->arch.pspb);
-
-	/*
-	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
-	 * clear (or hstate set appropriately to catch those registers
-	 * being clobbered if we take a MCE or SRESET), so those are done
-	 * later.
-	 */
-
-	if (!(vcpu->arch.ctrl & 1))
-		mtspr(SPRN_CTRLT, 0);
-}
-
-static void store_spr_state(struct kvm_vcpu *vcpu)
-{
-	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
-		vcpu->arch.tid = mfspr(SPRN_TIDR);
-	vcpu->arch.iamr = mfspr(SPRN_IAMR);
-	vcpu->arch.amr = mfspr(SPRN_AMR);
-	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
-	vcpu->arch.fscr = mfspr(SPRN_FSCR);
-	vcpu->arch.dscr = mfspr(SPRN_DSCR);
-	vcpu->arch.pspb = mfspr(SPRN_PSPB);
-
-	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
-}
-
-static void load_vcpu_state(struct kvm_vcpu *vcpu,
-			   struct p9_host_os_sprs *host_os_sprs)
-{
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
-
-	load_spr_state(vcpu, host_os_sprs);
-
-	load_fp_state(&vcpu->arch.fp);
-#ifdef CONFIG_ALTIVEC
-	load_vr_state(&vcpu->arch.vr);
-#endif
-	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
-}
-
-static void store_vcpu_state(struct kvm_vcpu *vcpu)
-{
-	store_spr_state(vcpu);
-
-	store_fp_state(&vcpu->arch.fp);
-#ifdef CONFIG_ALTIVEC
-	store_vr_state(&vcpu->arch.vr);
-#endif
-	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
-
-	if (cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
-		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
-}
-
-static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
-{
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
-		host_os_sprs->tidr = mfspr(SPRN_TIDR);
-	host_os_sprs->iamr = mfspr(SPRN_IAMR);
-	host_os_sprs->amr = mfspr(SPRN_AMR);
-	host_os_sprs->fscr = mfspr(SPRN_FSCR);
-	host_os_sprs->dscr = mfspr(SPRN_DSCR);
-}
-
-/* vcpu guest regs must already be saved */
-static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
-				    struct p9_host_os_sprs *host_os_sprs)
-{
-	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_31))
-		mtspr(SPRN_TIDR, host_os_sprs->tidr);
-	if (host_os_sprs->iamr != vcpu->arch.iamr)
-		mtspr(SPRN_IAMR, host_os_sprs->iamr);
-	if (vcpu->arch.uamor != 0)
-		mtspr(SPRN_UAMOR, 0);
-	if (host_os_sprs->amr != vcpu->arch.amr)
-		mtspr(SPRN_AMR, host_os_sprs->amr);
-	if (host_os_sprs->fscr != vcpu->arch.fscr)
-		mtspr(SPRN_FSCR, host_os_sprs->fscr);
-	if (host_os_sprs->dscr != vcpu->arch.dscr)
-		mtspr(SPRN_DSCR, host_os_sprs->dscr);
-	if (vcpu->arch.pspb != 0)
-		mtspr(SPRN_PSPB, 0);
-
-	/* Save guest CTRL register, set runlatch to 1 */
-	if (!(vcpu->arch.ctrl & 1))
-		mtspr(SPRN_CTRLT, 1);
-}
-
 static inline bool hcall_is_xics(unsigned long req)
 {
 	return req == H_EOI || req == H_CPPR || req == H_IPI ||
diff --git a/arch/powerpc/kvm/book3s_hv.h b/arch/powerpc/kvm/book3s_hv.h
new file mode 100644
index 000000000000..72e3a8f4c2cf
--- /dev/null
+++ b/arch/powerpc/kvm/book3s_hv.h
@@ -0,0 +1,39 @@
+
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
+void load_vcpu_state(struct kvm_vcpu *vcpu,
+			   struct p9_host_os_sprs *host_os_sprs);
+void store_vcpu_state(struct kvm_vcpu *vcpu);
+void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs);
+void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
+				    struct p9_host_os_sprs *host_os_sprs);
+void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
+			    struct p9_host_os_sprs *host_os_sprs);
+void switch_pmu_to_host(struct kvm_vcpu *vcpu,
+			    struct p9_host_os_sprs *host_os_sprs);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index afdd7dfa1c08..cc74cd314fcf 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -4,8 +4,340 @@
 #include <asm/asm-prototypes.h>
 #include <asm/dbell.h>
 #include <asm/kvm_ppc.h>
+#include <asm/pmc.h>
 #include <asm/ppc-opcode.h>
 
+#include "book3s_hv.h"
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
+void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
+{
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
+
+#ifdef CONFIG_PPC_PSERIES
+	if (kvmhv_on_pseries()) {
+		if (vcpu->arch.vpa.pinned_addr) {
+			struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
+			get_lppaca()->pmcregs_in_use = lp->pmcregs_in_use;
+		} else {
+			get_lppaca()->pmcregs_in_use = 1;
+		}
+	}
+#endif
+
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
+
+		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
+			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[4]);
+			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
+			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
+		}
+
+		/* Set MMCRA then MMCR0 last */
+		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
+		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
+		/* No isync necessary because we're starting counters */
+	}
+}
+EXPORT_SYMBOL_GPL(switch_pmu_to_guest);
+
+void switch_pmu_to_host(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
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
+
+	} else if (vcpu->arch.hfscr & HFSCR_PM) {
+		/*
+		 * The guest accessed PMC SPRs without specifying they should
+		 * be preserved. Stop them from counting if the guest had
+		 * started anything.
+		 */
+		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
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
+
+
+#ifdef CONFIG_PPC_PSERIES
+	if (kvmhv_on_pseries())
+		get_lppaca()->pmcregs_in_use = ppc_get_pmu_inuse();
+#endif
+
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
+EXPORT_SYMBOL_GPL(switch_pmu_to_host);
+
+static void load_spr_state(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
+{
+	mtspr(SPRN_TAR, vcpu->arch.tar);
+	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		mtspr(SPRN_TIDR, vcpu->arch.tid);
+	if (host_os_sprs->iamr != vcpu->arch.iamr)
+		mtspr(SPRN_IAMR, vcpu->arch.iamr);
+	if (host_os_sprs->amr != vcpu->arch.amr)
+		mtspr(SPRN_AMR, vcpu->arch.amr);
+	if (vcpu->arch.uamor != 0)
+		mtspr(SPRN_UAMOR, vcpu->arch.uamor);
+	if (host_os_sprs->fscr != vcpu->arch.fscr)
+		mtspr(SPRN_FSCR, vcpu->arch.fscr);
+	if (host_os_sprs->dscr != vcpu->arch.dscr)
+		mtspr(SPRN_DSCR, vcpu->arch.dscr);
+	if (vcpu->arch.pspb != 0)
+		mtspr(SPRN_PSPB, vcpu->arch.pspb);
+
+	/*
+	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
+	 * clear (or hstate set appropriately to catch those registers
+	 * being clobbered if we take a MCE or SRESET), so those are done
+	 * later.
+	 */
+
+	if (!(vcpu->arch.ctrl & 1))
+		mtspr(SPRN_CTRLT, 0);
+}
+
+static void store_spr_state(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.tar = mfspr(SPRN_TAR);
+	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
+	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
+	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		vcpu->arch.tid = mfspr(SPRN_TIDR);
+	vcpu->arch.iamr = mfspr(SPRN_IAMR);
+	vcpu->arch.amr = mfspr(SPRN_AMR);
+	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
+	vcpu->arch.fscr = mfspr(SPRN_FSCR);
+	vcpu->arch.dscr = mfspr(SPRN_DSCR);
+	vcpu->arch.pspb = mfspr(SPRN_PSPB);
+
+	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
+}
+
+void load_vcpu_state(struct kvm_vcpu *vcpu,
+			   struct p9_host_os_sprs *host_os_sprs)
+{
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+
+	load_spr_state(vcpu, host_os_sprs);
+
+	load_fp_state(&vcpu->arch.fp);
+#ifdef CONFIG_ALTIVEC
+	load_vr_state(&vcpu->arch.vr);
+#endif
+	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
+}
+EXPORT_SYMBOL_GPL(load_vcpu_state);
+
+void store_vcpu_state(struct kvm_vcpu *vcpu)
+{
+	store_spr_state(vcpu);
+
+	store_fp_state(&vcpu->arch.fp);
+#ifdef CONFIG_ALTIVEC
+	store_vr_state(&vcpu->arch.vr);
+#endif
+	vcpu->arch.vrsave = mfspr(SPRN_VRSAVE);
+
+	if (cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		kvmppc_save_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
+}
+EXPORT_SYMBOL_GPL(store_vcpu_state);
+
+void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		host_os_sprs->tidr = mfspr(SPRN_TIDR);
+	host_os_sprs->iamr = mfspr(SPRN_IAMR);
+	host_os_sprs->amr = mfspr(SPRN_AMR);
+	host_os_sprs->fscr = mfspr(SPRN_FSCR);
+	host_os_sprs->dscr = mfspr(SPRN_DSCR);
+}
+EXPORT_SYMBOL_GPL(save_p9_host_os_sprs);
+
+/* vcpu guest regs must already be saved */
+void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
+				    struct p9_host_os_sprs *host_os_sprs)
+{
+	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_31))
+		mtspr(SPRN_TIDR, host_os_sprs->tidr);
+	if (host_os_sprs->iamr != vcpu->arch.iamr)
+		mtspr(SPRN_IAMR, host_os_sprs->iamr);
+	if (vcpu->arch.uamor != 0)
+		mtspr(SPRN_UAMOR, 0);
+	if (host_os_sprs->amr != vcpu->arch.amr)
+		mtspr(SPRN_AMR, host_os_sprs->amr);
+	if (host_os_sprs->fscr != vcpu->arch.fscr)
+		mtspr(SPRN_FSCR, host_os_sprs->fscr);
+	if (host_os_sprs->dscr != vcpu->arch.dscr)
+		mtspr(SPRN_DSCR, host_os_sprs->dscr);
+	if (vcpu->arch.pspb != 0)
+		mtspr(SPRN_PSPB, 0);
+
+	/* Save guest CTRL register, set runlatch to 1 */
+	if (!(vcpu->arch.ctrl & 1))
+		mtspr(SPRN_CTRLT, 1);
+}
+EXPORT_SYMBOL_GPL(restore_p9_host_os_sprs);
+
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
 static void __start_timing(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator *next)
 {
-- 
2.23.0

