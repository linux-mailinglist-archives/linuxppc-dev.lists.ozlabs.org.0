Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C43E95B7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Aug 2021 18:16:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlFLS65Vsz3dR8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 02:16:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=eiiAc8pp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eiiAc8pp; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlF2r6tDnz3cXd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 02:02:44 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 fa24-20020a17090af0d8b0290178bfa69d97so5811103pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Aug 2021 09:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dqMVvfuBOIM1K0b+cDSRuoKajK+MjiiA6DyuNM0QnsE=;
 b=eiiAc8ppPoKhBj0tm3THpd47ZLZMfgcxnFjqGAwR+dPo4xncGcQ09+EN0puUW7wtU4
 aZrVmjsF88DO4tuK45/Gr8SRcUwz+EiXoMQEwt2CWCXilte0y6Gj7htLq1/iY818foxC
 Dtz6txdtO243NQiIwFRocwPG9AQjO3wC51dhrODfrx9MpYpQ3vyhqauU0FLIQ58MP4tM
 ALnohnyrANMAU+NF4msjPA3opzuG1jqmNbpEcQPAAn76k6IrYPBoai4Fb4219K1nZHZ8
 igu/BR8v+OjsiXlx6E5Ly0Fx5yJex1ps19qYhlO8PN/jXTNP1TUHmw2VNt4l3bDOqYy4
 a4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dqMVvfuBOIM1K0b+cDSRuoKajK+MjiiA6DyuNM0QnsE=;
 b=rJ/ZS3U8ndV+4ITRw0u1bD1Z3g2Ykmvp6cPiOAU83kbrEOiKPuPuuVxaXqnGc6UchF
 Ujdr69Ph+puSlW7t00zF1fYuvJiaznmPqQvDG3Ap4iSPhA9u/oJ246qS4z2Maad3P6Gl
 o8cVgNTd1n8B9pCib6vptFl4H2Wah0d0A8mmcvyDoprr3nN1amjp86pwdPG8wrlk7VdN
 zwmwZPEcpcKNarbf88IHtMVWX0mbO6ToSqcsjmMPmdVrEwIzDqR+GzDF651ksv/QP1bX
 BGD4WmL/aYZI62c+OpS6O8z2NpSpjQJDf01lndkJ7oujQnqehZD7a1vC04warsRO40Vs
 /LYw==
X-Gm-Message-State: AOAM531i1Mx4drkjdZTPvLu8FgUi0u4Y6NeyxZBWS0e7HbyB/BTNSpJN
 LGL+WeEcvZ76NAz87wnNvSQ=
X-Google-Smtp-Source: ABdhPJw+QAiNZFHHj/MSqmKfte2qSj5ICYK5lnjSKrK0y25y0sEvWQeFMzb7HL9ExPuBINqLVivM5Q==
X-Received: by 2002:a05:6a00:721:b029:3c7:623e:a871 with SMTP id
 1-20020a056a000721b02903c7623ea871mr29208773pfm.9.1628697762938; 
 Wed, 11 Aug 2021 09:02:42 -0700 (PDT)
Received: from bobo.ibm.com ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id k19sm6596494pff.28.2021.08.11.09.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 09:02:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 22/60] KVM: PPC: Book3S HV P9: Factor PMU save/load into
 context switch functions
Date: Thu, 12 Aug 2021 02:00:56 +1000
Message-Id: <20210811160134.904987-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210811160134.904987-1-npiggin@gmail.com>
References: <20210811160134.904987-1-npiggin@gmail.com>
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
Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than guest/host save/retsore functions, implement context switch
functions that take care of details like the VPA update for nested.

The reason to split these kind of helpers into explicit save/load
functions is mainly to schedule SPR access nicely, but PMU is a special
case where the load requires mtSPR (to stop counters) and other
difficulties, so there's less possibility to schedule those nicely. The
SPR accesses also have side-effects if the PMU is running, and in later
changes we keep the host PMU running as long as possible so this code
can be better profiled, which also complicates scheduling.

Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 61 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index c3fe05fe3c11..0ceb0bd28e13 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3820,7 +3820,8 @@ static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
 	isync();
 }
 
-static void save_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
+static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
 {
 	if (ppc_get_pmu_inuse()) {
 		/*
@@ -3854,10 +3855,21 @@ static void save_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
 			host_os_sprs->sier3 = mfspr(SPRN_SIER3);
 		}
 	}
-}
 
-static void load_p9_guest_pmu(struct kvm_vcpu *vcpu)
-{
+#ifdef CONFIG_PPC_PSERIES
+	if (kvmhv_on_pseries()) {
+		barrier();
+		if (vcpu->arch.vpa.pinned_addr) {
+			struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
+			get_lppaca()->pmcregs_in_use = lp->pmcregs_in_use;
+		} else {
+			get_lppaca()->pmcregs_in_use = 1;
+		}
+		barrier();
+	}
+#endif
+
+	/* load guest */
 	mtspr(SPRN_PMC1, vcpu->arch.pmc[0]);
 	mtspr(SPRN_PMC2, vcpu->arch.pmc[1]);
 	mtspr(SPRN_PMC3, vcpu->arch.pmc[2]);
@@ -3882,7 +3894,8 @@ static void load_p9_guest_pmu(struct kvm_vcpu *vcpu)
 	/* No isync necessary because we're starting counters */
 }
 
-static void save_p9_guest_pmu(struct kvm_vcpu *vcpu)
+static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
 {
 	struct lppaca *lp;
 	int save_pmu = 1;
@@ -3925,10 +3938,15 @@ static void save_p9_guest_pmu(struct kvm_vcpu *vcpu)
 	} else {
 		freeze_pmu(mfspr(SPRN_MMCR0), mfspr(SPRN_MMCRA));
 	}
-}
 
-static void load_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
-{
+#ifdef CONFIG_PPC_PSERIES
+	if (kvmhv_on_pseries()) {
+		barrier();
+		get_lppaca()->pmcregs_in_use = ppc_get_pmu_inuse();
+		barrier();
+	}
+#endif
+
 	if (ppc_get_pmu_inuse()) {
 		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
 		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
@@ -4057,8 +4075,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
-	save_p9_host_pmu(&host_os_sprs);
-
 	kvmppc_subcore_enter_guest();
 
 	vc->entry_exit_map = 1;
@@ -4075,19 +4091,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	    cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
 		kvmppc_restore_tm_hv(vcpu, vcpu->arch.shregs.msr, true);
 
-#ifdef CONFIG_PPC_PSERIES
-	if (kvmhv_on_pseries()) {
-		barrier();
-		if (vcpu->arch.vpa.pinned_addr) {
-			struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-			get_lppaca()->pmcregs_in_use = lp->pmcregs_in_use;
-		} else {
-			get_lppaca()->pmcregs_in_use = 1;
-		}
-		barrier();
-	}
-#endif
-	load_p9_guest_pmu(vcpu);
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
 	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
 	load_fp_state(&vcpu->arch.fp);
@@ -4216,14 +4220,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		vcpu->arch.vpa.dirty = 1;
 	}
 
-	save_p9_guest_pmu(vcpu);
-#ifdef CONFIG_PPC_PSERIES
-	if (kvmhv_on_pseries()) {
-		barrier();
-		get_lppaca()->pmcregs_in_use = ppc_get_pmu_inuse();
-		barrier();
-	}
-#endif
+	switch_pmu_to_host(vcpu, &host_os_sprs);
 
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
@@ -4232,8 +4229,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
-	load_p9_host_pmu(&host_os_sprs);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
-- 
2.23.0

