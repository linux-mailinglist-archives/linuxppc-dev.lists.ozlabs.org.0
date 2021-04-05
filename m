Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82E8353ADF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:35:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCsf5FwLz3gqx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:35:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=K6snk4fx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K6snk4fx; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCYl47jNz3cPX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:22:03 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id g15so7214974pfq.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n409qqh2Jq+wZToH5finj1D0nqz7fE20cnCS/z/mo98=;
 b=K6snk4fxGzLAdrYwoJOU3nIPAhCvz+YL9x5Kg1AD3ZKM24esz/INk/cHlJWcEAp/si
 p+L4u1jCKpy/dOEpmyVQWDmG4nhjf+KmAuJEDao3fTAH8NdHpHrCZOWbUbPpZA4AaZ1z
 0DTTwSXdscxTdwOzdqbu71R2umOvE+5DBQa49/AspBl8ft477jsOP8UoG8K0OCSs7ivF
 LVCVmM5fnx1RkCDoEEaPnX1oOUhEw1HNnvc1q0533BWeDm1oWGHWdaLMDRdl6kag0Ed1
 H/tIfluqvtr9RksKhpCNlm/Zq5TNjFKqUjIXECwZ9x6HFe892mYsy2fgTE17G/nneD1S
 E8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n409qqh2Jq+wZToH5finj1D0nqz7fE20cnCS/z/mo98=;
 b=jN7OMfSr/fpTDlhB2K44UdSU1Xp8UD4/PM9lSLIchZKRZDCqFaesinalg1TaHWasNH
 50FZ9rctCppUjiRgZkfX8Ddr99Qtm+TtwpBKdTLY7FpEcpbHscc69cTpMx4pAF0l5Uyj
 d4FQOMKdqvlyneZHO5qC5DF8y5EfYbkxAS8RTt8hxx62dM1ZbBJNrR5O8MjZ0/72aOum
 6sJIYuTO/bsPtPCJfWmv2eg0qNePknk9wuHcBJ6pzyENS230GE9aEGJtso2FOTxniiDN
 ppTytJr25MYURMAhrodqMB1eWmT0Yez4JkEcwE3lH7RS9dDVhvuWXVeEJ4OleE7Dmhx3
 qJwA==
X-Gm-Message-State: AOAM533kE7rxLksqVGbk4hrrCJSOawQi3PbDQn6hylEuKMcN7kTSIKuP
 devH6L9ucgCZpSmDFA/W1fI=
X-Google-Smtp-Source: ABdhPJxVGQhHDwv12L1B/4NaN/OOvXeT4JBd8BCHiomki2GWTnFOqaPHBs6UVkLm0vcK0ldqP3CMzA==
X-Received: by 2002:a05:6a00:1ad4:b029:216:aa9d:dcea with SMTP id
 f20-20020a056a001ad4b0290216aa9ddceamr21025779pfv.47.1617585721451; 
 Sun, 04 Apr 2021 18:22:01 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:22:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 35/48] KVM: PPC: Book3S HV P9: Add helpers for OS SPR
 handling
Date: Mon,  5 Apr 2021 11:19:35 +1000
Message-Id: <20210405011948.675354-36-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
index 5f0ac6567a06..c2098464eb5e 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3498,6 +3498,89 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
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
 	return req == H_EOI || req == H_CPPR || req == H_IPI ||
@@ -3512,11 +3595,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -3530,6 +3609,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (next_timer < time_limit)
 		time_limit = next_timer;
 
+	save_p9_host_os_sprs(&host_os_sprs);
+
 	kvmhv_save_host_pmu();		/* saves it to PACA kvm_hstate */
 
 	kvmppc_subcore_enter_guest();
@@ -3557,28 +3638,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -3674,33 +3734,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

