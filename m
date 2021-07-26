Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D13F93D51F9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 05:58:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5ky5gmkz3fT5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 13:58:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=LQ8LcWXE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LQ8LcWXE; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5ZT74KXz30LY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:29 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so1973659pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPqcBmWn1RQ5ScRaMQkK0PgFL0uqvjQZGq+S5mHe7GY=;
 b=LQ8LcWXESFN7E7UDjn68MfXx3Rm2glVyKpczCyDBpsllBugNqgH5unWXyTQmcdEhN/
 r/Ikvb4S/5WIjBs5EdTt/QrweUp0MF78vQaBBhzOq+kS2nrcUPoPXG8HvIqI3owQ71zN
 ZYY8jPzHJsXw/JNY4BdUIsQp9e+4JCzqdwd/Hvb8yd1wHelhN/YmkIcjs5g112l8CDx4
 ojRjeuecSE7kA2msC0notNCv3V21i5CvHubBMzABd58kK3hEfRCxuA79/XXIDpQ9yjt7
 0cDBr5XigENUfhRyJ8wizS3n+nmbsoxWfAfWQfgXoOXvtLeIhxQZboldizEXhQJ/OQD0
 VImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPqcBmWn1RQ5ScRaMQkK0PgFL0uqvjQZGq+S5mHe7GY=;
 b=m1NCnuAVy87PmSy2y8JBLQz7jvkRgXDawu1onyjQ7F+Syg2eRtHpxaTznHUqCcgTWW
 6EmK1NCbJ4wiObaX/07GDsSHUF6gaFOnrmBsoLDOSpAAb5IAYTZNEOYuXqS3GJmVMsyP
 FSHoLkr03hmb/bsvyVBE9lHneuMVPCsvIt7OvehZuLQUeBXTv172YIArlqFwT9VNwJJ7
 GdKwnvz3oHIExzDSQIa5pNF3DbWJt22iKJ2Ut6wQmt1Q4nvP4nefnoyZca7ENvGanuPe
 bpltfVLoDlj1VxqzF1uZBBVFOnTd2DdI62RV3kS19TC5Q0SRppeY6BGwaQ6RbnUi0kqM
 CZCA==
X-Gm-Message-State: AOAM530L6tyfwbL3ZYmRgdUNpC0EUOW1Awa+fZrTzGn8kxkATUKN0Jic
 JSQGdVUkdOg0kb2LDUce/crOuEuJI88=
X-Google-Smtp-Source: ABdhPJx9wM3iZBEIyRCfm4LJw+CiX3l99fEWgebiSSIYaGlO+n8yORHHgkzIx2S+of1qLJjr2hNhKg==
X-Received: by 2002:a63:1205:: with SMTP id h5mr16044475pgl.204.1627271487880; 
 Sun, 25 Jul 2021 20:51:27 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 18/55] KVM: PPC: Book3S HV P9: Factor PMU save/load into
 context switch functions
Date: Mon, 26 Jul 2021 13:49:59 +1000
Message-Id: <20210726035036.739609-19-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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

Rather than guest/host save/retsore functions, implement context switch
functions that take care of details like the VPA update for nested.

The reason to split these kind of helpers into explicit save/load
functions is mainly to schedule SPR access nicely, but PMU is a special
case where the load requires mtSPR (to stop counters) and other
difficulties, so there's less possibility to schedule those nicely. The
SPR accesses also have side-effects if the PMU is running, and in later
changes we keep the host PMU running as long as possible so this code
can be better profiled, which also complicates scheduling.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 61 +++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d20b579ddcdf..091b67ef6eba 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3790,7 +3790,8 @@ static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
 	isync();
 }
 
-static void save_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
+static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
 {
 	if (ppc_get_pmu_inuse()) {
 		/*
@@ -3824,10 +3825,21 @@ static void save_p9_host_pmu(struct p9_host_os_sprs *host_os_sprs)
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
@@ -3852,7 +3864,8 @@ static void load_p9_guest_pmu(struct kvm_vcpu *vcpu)
 	/* No isync necessary because we're starting counters */
 }
 
-static void save_p9_guest_pmu(struct kvm_vcpu *vcpu)
+static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
+				struct p9_host_os_sprs *host_os_sprs)
 {
 	struct lppaca *lp;
 	int save_pmu = 1;
@@ -3887,10 +3900,15 @@ static void save_p9_guest_pmu(struct kvm_vcpu *vcpu)
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
@@ -4019,8 +4037,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	save_p9_host_os_sprs(&host_os_sprs);
 
-	save_p9_host_pmu(&host_os_sprs);
-
 	kvmppc_subcore_enter_guest();
 
 	vc->entry_exit_map = 1;
@@ -4037,19 +4053,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4178,14 +4182,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -4194,8 +4191,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
-	load_p9_host_pmu(&host_os_sprs);
-
 	kvmppc_subcore_exit_guest();
 
 	return trap;
-- 
2.23.0

