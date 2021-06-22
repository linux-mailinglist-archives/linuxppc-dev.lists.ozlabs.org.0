Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C13B0296
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:16:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8P3v3qJ0z3h8Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:16:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Lhg/o+s4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lhg/o+s4; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NhD0kmNz3bxZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:59:40 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id c8so2261385pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oJfDm6Y3ZPAslMSBisrJT5Iqf9wNMMKF18akDZTJ06A=;
 b=Lhg/o+s40YMvqVyJiWzAeZ5738F0vtgmSrp6oCGK3QdwEOIIhjg0e7v9uYEIC4kw1D
 rlBTUWTavq/rUgeGzFoYDd6qRCKY3mHlOOCXVOGjC1NgTOaS/Jc7Rpmqhmm0nfrAWpmE
 PBwPdI5+iBxblXRDrOrh2GiH6DkAhlnYUOuMp2BSWUdL2M8HPEuRVSSdqDM5nSvxMBc5
 M4qQ2tLOu0FPxJvmuf7j7JclSKM4b4h2lxJ1jmo8gw+vC08LMTKhaxnlW/Oau5+TeMSQ
 +C9/m7GVE3Kfy8O6PosG95S8uIshid4LgYLFyPCg/939aemLUkTyexK1PERTDT3Dtcfn
 uBoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oJfDm6Y3ZPAslMSBisrJT5Iqf9wNMMKF18akDZTJ06A=;
 b=MwT6ZCZ15F0abZ/zSaKC1cI+eGnaVnxfb6hSqdCjB85k03zClohSbfkLt5NE6qQmpi
 DCl2wbRDEu1PPSb6iKNyfyckn+lAXK/7+fbdtObKE7QdjX8vXljHK3cVzzJC3ZqMShxB
 vcn8rz3KdVVugBBKaCB4Q8T7aSAOVaG8g3/Ze2BYIwTrOQ9fTYqh8rh7CztetKZeZzi2
 9VE1ZKqlluJfpX1okyDyPyzGbQGNK9OLR1/YuvnV4bdpzPMpB7r1srKwfVZ4InDlEHJZ
 iq4O7kAD5DjMPcuw2IhgtMdpa6iexQeBEriCtuOC5+4oOm2N/dwVwoP/l4PGnDEICqRg
 b5zg==
X-Gm-Message-State: AOAM532kteVIxHamXMHH11dVb6GjTTcersEWyWKc0nrk2fC9ujrcwbks
 I2ucEdVW51Q0/mnjMapZg2rftUeK+4o=
X-Google-Smtp-Source: ABdhPJzd41YiUBgnaLHoC77otoONT3b85XeNk2m6Jbvr1kpNjlC66QLldpOoD3LatB9ZNsnCMuU4lQ==
X-Received: by 2002:a63:4915:: with SMTP id w21mr3199293pga.363.1624359577182; 
 Tue, 22 Jun 2021 03:59:37 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:59:36 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 42/43] KVM: PPC: Book3S HV P9: Improve mfmsr performance
 on entry
Date: Tue, 22 Jun 2021 20:57:35 +1000
Message-Id: <20210622105736.633352-43-npiggin@gmail.com>
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

Rearrange the MSR saving on entry so it does not follow the mtmsrd to
disable interrupts, avoiding a possible RAW scoreboard stall.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_book3s_64.h |  2 +
 arch/powerpc/kvm/book3s_hv.c             | 18 ++-----
 arch/powerpc/kvm/book3s_hv_p9_entry.c    | 66 +++++++++++++++---------
 3 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
index f8a0ed90b853..20ca9b1a2d41 100644
--- a/arch/powerpc/include/asm/kvm_book3s_64.h
+++ b/arch/powerpc/include/asm/kvm_book3s_64.h
@@ -153,6 +153,8 @@ static inline bool kvmhv_vcpu_is_radix(struct kvm_vcpu *vcpu)
 	return radix;
 }
 
+unsigned long kvmppc_msr_hard_disable_set_facilities(struct kvm_vcpu *vcpu, unsigned long msr);
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb);
 
 #define KVM_DEFAULT_HPT_ORDER	24	/* 16MB HPT by default */
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7cb9e87b50b7..c8edab9a90cb 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3759,6 +3759,8 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	s64 dec;
 	int trap;
 
+	msr = mfmsr();
+
 	save_p9_host_os_sprs(&host_os_sprs);
 
 	/*
@@ -3769,24 +3771,10 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	 */
 	host_psscr = mfspr(SPRN_PSSCR_PR);
 
-	hard_irq_disable();
+	kvmppc_msr_hard_disable_set_facilities(vcpu, msr);
 	if (lazy_irq_pending())
 		return 0;
 
-	/* MSR bits may have been cleared by context switch */
-	msr = 0;
-	if (IS_ENABLED(CONFIG_PPC_FPU))
-		msr |= MSR_FP;
-	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		msr |= MSR_VEC;
-	if (cpu_has_feature(CPU_FTR_VSX))
-		msr |= MSR_VSX;
-	if ((cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
-			(vcpu->arch.hfscr & HFSCR_TM))
-		msr |= MSR_TM;
-	msr = msr_check_and_set(msr);
-
 	load_vcpu_state(vcpu, &host_os_sprs);
 
 	if (vcpu->arch.psscr != host_psscr)
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 48b0ce9e0c39..3fffcec67ff8 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -604,6 +604,44 @@ static void save_clear_guest_mmu(struct kvm *kvm, struct kvm_vcpu *vcpu)
 	}
 }
 
+unsigned long kvmppc_msr_hard_disable_set_facilities(struct kvm_vcpu *vcpu, unsigned long msr)
+{
+	unsigned long msr_needed = 0;
+
+	msr &= ~MSR_EE;
+
+	/* MSR bits may have been cleared by context switch so must recheck */
+	if (IS_ENABLED(CONFIG_PPC_FPU))
+		msr_needed |= MSR_FP;
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		msr_needed |= MSR_VEC;
+	if (cpu_has_feature(CPU_FTR_VSX))
+		msr_needed |= MSR_VSX;
+	if ((cpu_has_feature(CPU_FTR_TM) ||
+	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
+			(vcpu->arch.hfscr & HFSCR_TM))
+		msr_needed |= MSR_TM;
+
+	/*
+	 * This could be combined with MSR[RI] clearing, but that expands
+	 * the unrecoverable window. It would be better to cover unrecoverable
+	 * with KVM bad interrupt handling rather than use MSR[RI] at all.
+	 *
+	 * Much more difficult and less worthwhile to combine with IR/DR
+	 * disable.
+	 */
+	if ((msr & msr_needed) != msr_needed) {
+		msr |= msr_needed;
+		__mtmsrd(msr, 0);
+	} else {
+		__hard_irq_disable();
+	}
+	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
+
+	return msr;
+}
+EXPORT_SYMBOL_GPL(kvmppc_msr_hard_disable_set_facilities);
+
 int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpcr, u64 *tb)
 {
 	struct p9_host_os_sprs host_os_sprs;
@@ -637,6 +675,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.ceded = 0;
 
+	/* Save MSR for restore, with EE clear. */
+	msr = mfmsr() & ~MSR_EE;
+
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
 	host_psscr = mfspr(SPRN_PSSCR_PR);
@@ -658,35 +699,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
-	/*
-	 * This could be combined with MSR[RI] clearing, but that expands
-	 * the unrecoverable window. It would be better to cover unrecoverable
-	 * with KVM bad interrupt handling rather than use MSR[RI] at all.
-	 *
-	 * Much more difficult and less worthwhile to combine with IR/DR
-	 * disable.
-	 */
-	hard_irq_disable();
+	msr = kvmppc_msr_hard_disable_set_facilities(vcpu, msr);
 	if (lazy_irq_pending()) {
 		trap = 0;
 		goto out;
 	}
 
-	/* MSR bits may have been cleared by context switch */
-	msr = 0;
-	if (IS_ENABLED(CONFIG_PPC_FPU))
-		msr |= MSR_FP;
-	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		msr |= MSR_VEC;
-	if (cpu_has_feature(CPU_FTR_VSX))
-		msr |= MSR_VSX;
-	if ((cpu_has_feature(CPU_FTR_TM) ||
-	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) &&
-			(vcpu->arch.hfscr & HFSCR_TM))
-		msr |= MSR_TM;
-	msr = msr_check_and_set(msr);
-	/* Save MSR for restore. This is after hard disable, so EE is clear. */
-
 	if (vc->tb_offset) {
 		u64 new_tb = *tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
-- 
2.23.0

