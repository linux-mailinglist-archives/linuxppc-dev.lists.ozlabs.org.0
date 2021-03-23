Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A8B3454DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:18:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D5l6Hwzz3gVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:18:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=hJAaNEUq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hJAaNEUq; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cp41PHXz3c7H
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:05:00 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id x26so12514814pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u02W+1uPYr0zNoCJeEXNYnFcxtXSiID7jXsy9YKadYU=;
 b=hJAaNEUqkUaNpVYToUOi7iQXHJ4JZCmc2PkenUEVzs/rsTG2cmh6tPX1nAAHI88cXG
 7BzP+nqd6rr5LK0KxOMiFvUKRZ1WJPQqmRtUni2N49W6ZLNTZsP21oqCB0shSJpJRHbi
 mtsci8nWEV9RQUaMSNo5Y35Un0H2utxbhcmHvuc2bcra9Ms0HOCvQyIVa7t9yy8sbcem
 e7p+ViHyb/5DxTmy1DFuJuvmzX6T5fRDcoSx+njYpppyvXpM1CkAThQN+Bq7Sp5Rqs9g
 ReHL2yyNruP6IZZ1iu+kQD+tvhroMKoZEPUa/E3LwvwxD+AWYuKsiPKGhl3YN0ZpS2hb
 HcOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u02W+1uPYr0zNoCJeEXNYnFcxtXSiID7jXsy9YKadYU=;
 b=GXH/I6NMn9bopeAH8ibnvMXwHCren3b/Budj2yOXyMqIt9ziSuYX6N+7Dsd7obzk0Y
 v0gP76OEHK41oeDbIPKPtGBMYiPk6YJJrJbAPaCkTgZaNxN9pqhMsuJGJTzdA1QXx5lC
 kZS2j5ajxxnvUPr2aewONegDB+kP46MrOcIohxc0cf8bayAcMHc5NTNzvb3qLANBbcPl
 iUBB5NmpOalI3MBGr3BOhoRaEhFr/8QAWI0yayN+H172XnsRq7dn6CaadIcpDUPU5qcq
 XwA4WKDhbSzNlVJpH4YshSjZE5uE+yl7LlB2Ns40rlLIq76UQXA7Dna2A0kyH8cdqOnq
 a0ow==
X-Gm-Message-State: AOAM530OWtq2MPzNLey5Ri296qHoumtCNUYNERG8q5qW+kNHpSCZQEn0
 CHKaPTByIrHUFNWfn+LrQNg=
X-Google-Smtp-Source: ABdhPJyNeSd7pP70Btxo/+3dgXpEm14Zj4O0sbvB2ddU4SwF1nbaZr7G9S9b0XUf9w3xGHjSkiF34g==
X-Received: by 2002:a63:af05:: with SMTP id w5mr1894336pge.153.1616461497824; 
 Mon, 22 Mar 2021 18:04:57 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 34/46] KVM: PPC: Book3S HV P9: Add helpers for OS SPR
 handling
Date: Tue, 23 Mar 2021 11:02:53 +1000
Message-Id: <20210323010305.1045293-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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

This is a first step to wrapping supervisor and user SPR saving and
loading up into helpers, which will then be called independently in
bare metal and nested HV cases in order to optimise SPR access.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 141 ++++++++++++++++++++++-------------
 1 file changed, 89 insertions(+), 52 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 98e5ae897fad..74c67f713a26 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3481,6 +3481,89 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	trace_kvmppc_run_core(vc, 1);
 }
 
+static void load_spr_state(struct kvm_vcpu *vcpu)
+{
+	mtspr(SPRN_DSCR, vcpu->arch.dscr);
+	mtspr(SPRN_IAMR, vcpu->arch.iamr);
+	mtspr(SPRN_PSPB, vcpu->arch.pspb);
+	mtspr(SPRN_FSCR, vcpu->arch.fscr);
+	mtspr(SPRN_TAR, vcpu->arch.tar);
+	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	mtspr(SPRN_WORT, vcpu->arch.wort);
+	mtspr(SPRN_TIDR, vcpu->arch.tid);
+	mtspr(SPRN_AMR, vcpu->arch.amr);
+	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
+
+	/*
+	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
+	 * clear (or hstate set appropriately to catch those registers
+	 * being clobbered if we take a MCE or SRESET), so those are done
+	 * later.
+	 */
+
+	if (!(vcpu->arch.ctrl & 1))
+		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
+}
+
+static void store_spr_state(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
+
+	vcpu->arch.iamr = mfspr(SPRN_IAMR);
+	vcpu->arch.pspb = mfspr(SPRN_PSPB);
+	vcpu->arch.fscr = mfspr(SPRN_FSCR);
+	vcpu->arch.tar = mfspr(SPRN_TAR);
+	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
+	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
+	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+	vcpu->arch.wort = mfspr(SPRN_WORT);
+	vcpu->arch.tid = mfspr(SPRN_TIDR);
+	vcpu->arch.amr = mfspr(SPRN_AMR);
+	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
+	vcpu->arch.dscr = mfspr(SPRN_DSCR);
+}
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
+};
+
+static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
+{
+	host_os_sprs->dscr = mfspr(SPRN_DSCR);
+	host_os_sprs->tidr = mfspr(SPRN_TIDR);
+	host_os_sprs->iamr = mfspr(SPRN_IAMR);
+	host_os_sprs->amr = mfspr(SPRN_AMR);
+	host_os_sprs->fscr = mfspr(SPRN_FSCR);
+}
+
+/* vcpu guest regs must already be saved */
+static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
+				    struct p9_host_os_sprs *host_os_sprs)
+{
+	mtspr(SPRN_PSPB, 0);
+	mtspr(SPRN_WORT, 0);
+	mtspr(SPRN_UAMOR, 0);
+
+	mtspr(SPRN_DSCR, host_os_sprs->dscr);
+	mtspr(SPRN_TIDR, host_os_sprs->tidr);
+	mtspr(SPRN_IAMR, host_os_sprs->iamr);
+
+	if (host_os_sprs->amr != vcpu->arch.amr)
+		mtspr(SPRN_AMR, host_os_sprs->amr);
+
+	if (host_os_sprs->fscr != vcpu->arch.fscr)
+		mtspr(SPRN_FSCR, host_os_sprs->fscr);
+}
+
 static inline bool hcall_is_xics(unsigned long req)
 {
 	return (req == H_EOI || req == H_CPPR || req == H_IPI ||
@@ -3495,11 +3578,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			 unsigned long lpcr)
 {
 	struct kvmppc_vcore *vc = vcpu->arch.vcore;
-	unsigned long host_dscr = mfspr(SPRN_DSCR);
-	unsigned long host_tidr = mfspr(SPRN_TIDR);
-	unsigned long host_iamr = mfspr(SPRN_IAMR);
-	unsigned long host_amr = mfspr(SPRN_AMR);
-	unsigned long host_fscr = mfspr(SPRN_FSCR);
+	struct p9_host_os_sprs host_os_sprs;
 	s64 dec;
 	u64 tb, next_timer;
 	int trap, save_pmu;
@@ -3514,6 +3593,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (next_timer < time_limit)
 		time_limit = next_timer;
 
+	save_p9_host_os_sprs(&host_os_sprs);
+
 	kvmhv_save_host_pmu();		/* saves it to PACA kvm_hstate */
 
 	kvmppc_subcore_enter_guest();
@@ -3541,28 +3622,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	mtspr(SPRN_DSCR, vcpu->arch.dscr);
-	mtspr(SPRN_IAMR, vcpu->arch.iamr);
-	mtspr(SPRN_PSPB, vcpu->arch.pspb);
-	mtspr(SPRN_FSCR, vcpu->arch.fscr);
-	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-	mtspr(SPRN_WORT, vcpu->arch.wort);
-	mtspr(SPRN_TIDR, vcpu->arch.tid);
-	mtspr(SPRN_AMR, vcpu->arch.amr);
-	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
-
-	/*
-	 * DAR, DSISR, and for nested HV, SPRGs must be set with MSR[RI]
-	 * clear (or hstate set appropriately to catch those registers
-	 * being clobbered if we take a MCE or SRESET), so those are done
-	 * later.
-	 */
-
-	if (!(vcpu->arch.ctrl & 1))
-		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
+	load_spr_state(vcpu);
 
 	/*
 	 * When setting DEC, we must always deal with irq_work_raise via NMI vs
@@ -3658,33 +3718,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.dec_expires = dec + tb;
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
-	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
-
-	vcpu->arch.iamr = mfspr(SPRN_IAMR);
-	vcpu->arch.pspb = mfspr(SPRN_PSPB);
-	vcpu->arch.fscr = mfspr(SPRN_FSCR);
-	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-	vcpu->arch.wort = mfspr(SPRN_WORT);
-	vcpu->arch.tid = mfspr(SPRN_TIDR);
-	vcpu->arch.amr = mfspr(SPRN_AMR);
-	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
-	vcpu->arch.dscr = mfspr(SPRN_DSCR);
-
-	mtspr(SPRN_PSPB, 0);
-	mtspr(SPRN_WORT, 0);
-	mtspr(SPRN_UAMOR, 0);
-	mtspr(SPRN_DSCR, host_dscr);
-	mtspr(SPRN_TIDR, host_tidr);
-	mtspr(SPRN_IAMR, host_iamr);
 
-	if (host_amr != vcpu->arch.amr)
-		mtspr(SPRN_AMR, host_amr);
+	store_spr_state(vcpu);
 
-	if (host_fscr != vcpu->arch.fscr)
-		mtspr(SPRN_FSCR, host_fscr);
+	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
 
 	msr_check_and_set(MSR_FP | MSR_VEC | MSR_VSX);
 	store_fp_state(&vcpu->arch.fp);
-- 
2.23.0

