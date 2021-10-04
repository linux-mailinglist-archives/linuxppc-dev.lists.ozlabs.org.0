Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 124F54213BB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQgf6kkNz3f4w
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:11:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=b2wo8PkT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=b2wo8PkT; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSh6yLwz2yR7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:40 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so219455pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fu524DKeQa7aA0oGOpETME6QVLaF1mXTP4gF4wx3j7o=;
 b=b2wo8PkTgo2kDW8F+YIlfIQoOD3qLK2WnqqbnikFDKF0ubZaVzo3fjxS4MQqnLl2lq
 9+VvcLjtLyLshN5SQP5XL/80bzOT13I+04PNEtsIqINBuHtm5zXuytokeYBUf3S7f0We
 p9IlUi5kDTEUwHBl8fkJS7+2GCKLmlfJqimQKys3Jhy8/Yicu5Y2tTqz4Wg9Kulbkc6P
 SNqogvrINmY5pqRlGgyFK3BD9JPrXD2ZbQXrtxbimgvrGmbxLKYzyy7dfk6r3Gprm6kx
 /DXwOR4rLhNRLE0gzTSXIFVuRgrGXM+Z3jl+atvFcx8wk3JlN/D49FkqFCM52eRN3IJs
 uWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fu524DKeQa7aA0oGOpETME6QVLaF1mXTP4gF4wx3j7o=;
 b=e5hSjg4YbHME9WnYVASi9ArKWYhj+J0+DUpLH6QYMuHFcqQNeDbIVwgZeNiL5q5N/P
 1Z+rMMhlwLAkERpsqJmJTX7zDBZ8hCxnBOmakzB7fQQHtPY7Kuut2EJ1dLBC5mEUmwc4
 zYhQQLaVcR03p4aoYKFttg8pWm8J8cjVh6qtjHIYyJBdHf0ybR+x/RRIEkv02WlbiWfs
 KT5Q9TtQBRztnEhxH/Hj9fo6Js+CAjXVVVgIFeX8o4F0Ruvq5LRfJYcQggkHfsH0TGKp
 Q8spooQ+Y6qrWs6iInc+EfHWGuSb2BFUQyA1pa9M20+fAHLE6Jaq0iGSZv4/aL3LRRaT
 YqnQ==
X-Gm-Message-State: AOAM530UapC0YDrTT1tG4WpZV3VHsOEOBN/m1TkZ6VKTHX0IjPrqNaLg
 9d2dHhV/hWtuZh0VjfPac+w=
X-Google-Smtp-Source: ABdhPJxjYKwr4imt33gQJbyxsg/OvT6YuajCBNwIVyA4iVZUqYhcNo7T3b0N05TCGRj7ieDgwSB9kQ==
X-Received: by 2002:a17:90a:12:: with SMTP id
 18mr38036547pja.104.1633363298821; 
 Mon, 04 Oct 2021 09:01:38 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/52] KVM: PPC: Book3S HV P9: Demand fault PMU SPRs when
 marked not inuse
Date: Tue,  5 Oct 2021 02:00:12 +1000
Message-Id: <20211004160049.1338837-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Cc: Athira Jajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
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

Reviewed-by: Athira Jajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 131 ++++++++++++++++++++++++++---------
 1 file changed, 98 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 29a8c770c4a6..6bbd670658b9 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1421,6 +1421,23 @@ static int kvmppc_emulate_doorbell_instr(struct kvm_vcpu *vcpu)
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
+	if (!(vcpu->arch.hfscr_permitted & HFSCR_PM))
+		return EMULATE_FAIL;
+
+	vcpu->arch.hfscr |= HFSCR_PM;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1702,16 +1719,22 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 	 * to emulate.
 	 * Otherwise, we just generate a program interrupt to the guest.
 	 */
-	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL:
+	case BOOK3S_INTERRUPT_H_FAC_UNAVAIL: {
+		u64 cause = vcpu->arch.hfscr >> 56;
+
 		r = EMULATE_FAIL;
-		if (((vcpu->arch.hfscr >> 56) == FSCR_MSGP_LG) &&
-		    cpu_has_feature(CPU_FTR_ARCH_300))
-			r = kvmppc_emulate_doorbell_instr(vcpu);
+		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
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
 
 	case BOOK3S_INTERRUPT_HV_RM_HARD:
 		r = RESUME_PASSTHROUGH;
@@ -2750,6 +2773,11 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 
 	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
 
+	/*
+	 * PM is demand-faulted so start with it clear.
+	 */
+	vcpu->arch.hfscr &= ~HFSCR_PM;
+
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
 	vcpu->arch.state = KVMPPC_VCPU_NOTREADY;
@@ -3820,6 +3848,14 @@ static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
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
+	/* Save host */
 	if (ppc_get_pmu_inuse()) {
 		/*
 		 * It might be better to put PMU handling (at least for the
@@ -3854,41 +3890,47 @@ static void switch_pmu_to_guest(struct kvm_vcpu *vcpu,
 	}
 
 #ifdef CONFIG_PPC_PSERIES
+	/* After saving PMU, before loading guest PMU, flip pmcregs_in_use */
 	if (kvmhv_on_pseries()) {
 		barrier();
-		if (vcpu->arch.vpa.pinned_addr) {
-			struct lppaca *lp = vcpu->arch.vpa.pinned_addr;
-			get_lppaca()->pmcregs_in_use = lp->pmcregs_in_use;
-		} else {
-			get_lppaca()->pmcregs_in_use = 1;
-		}
+		get_lppaca()->pmcregs_in_use = load_pmu;
 		barrier();
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
+	/*
+	 * Load guest. If the VPA said the PMCs are not in use but the guest
+	 * tried to access them anyway, HFSCR[PM] will be set by the HFAC
+	 * fault so we can make forward progress.
+	 */
+	if (load_pmu || (vcpu->arch.hfscr & HFSCR_PM)) {
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
+			mtspr(SPRN_MMCR3, vcpu->arch.mmcr[3]);
+			mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
+			mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
+		}
 
-	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
-		mtspr(SPRN_MMCR3, vcpu->arch.mmcr[3]);
-		mtspr(SPRN_SIER2, vcpu->arch.sier[1]);
-		mtspr(SPRN_SIER3, vcpu->arch.sier[2]);
-	}
+		/* Set MMCRA then MMCR0 last */
+		mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
+		mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
+		/* No isync necessary because we're starting counters */
 
-	/* Set MMCRA then MMCR0 last */
-	mtspr(SPRN_MMCRA, vcpu->arch.mmcra);
-	mtspr(SPRN_MMCR0, vcpu->arch.mmcr[0]);
-	/* No isync necessary because we're starting counters */
+		if (!vcpu->arch.nested &&
+				(vcpu->arch.hfscr_permitted & HFSCR_PM))
+			vcpu->arch.hfscr |= HFSCR_PM;
+	}
 }
 
 static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
@@ -3932,9 +3974,32 @@ static void switch_pmu_to_host(struct kvm_vcpu *vcpu,
 			vcpu->arch.sier[1] = mfspr(SPRN_SIER2);
 			vcpu->arch.sier[2] = mfspr(SPRN_SIER3);
 		}
-	} else {
+
+	} else if (vcpu->arch.hfscr & HFSCR_PM) {
+		/*
+		 * The guest accessed PMC SPRs without specifying they should
+		 * be preserved, or it cleared pmcregs_in_use after the last
+		 * access. Just ensure they are frozen.
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
+		if (!vcpu->arch.nested)
+			vcpu->arch.hfscr &= ~HFSCR_PM;
+	} /* otherwise the PMU should still be frozen */
 
 #ifdef CONFIG_PPC_PSERIES
 	if (kvmhv_on_pseries()) {
-- 
2.23.0

