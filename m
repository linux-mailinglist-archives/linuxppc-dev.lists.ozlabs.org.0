Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4386421414
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNR4450dJz3gWf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:28:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Cp9TFuDn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Cp9TFuDn; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQTt2ssNz3cQS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:02:42 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so293576pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UPwQjon/JGAwP2hNwxa5hh2Gm9nZDXFP065oxigESDI=;
 b=Cp9TFuDnn9PJg4RnIi5LgHZZNizTxMSa0BnQHLvQggcgyzXhPeCRJ0NEX6C75vDAGR
 XPwnPldKswCJvCR+tYxOBiy99l9hkz+cMHSgvIPF//aI/4ccVCLr4sWwc4E+pHGxYKku
 mbgKLR/lRUtSZ2v2eKT6iZKW02RgE4LawNVIk5Oxo21A4oDXdmAOXDXpZZXk22a5JDs0
 22DIiS4E1K3si7dVvnl6kydK5l0VvCIIyQJ4Pi4Jv+1M8mwJ28Z/PoFAzE18sz07eVo4
 tuV8tnJRQE68kisDVM/6mNnYllnkB4RTBXkoT3ut8HyDB2kQCSpxkaJ/qko4j2muh+Uj
 5ocw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UPwQjon/JGAwP2hNwxa5hh2Gm9nZDXFP065oxigESDI=;
 b=5nTxYJmk6oFFuaadm49DQnrlfA8MuBHdSI5Rgs61BI2eYNvrb1/DhF5a37qsKpoqCz
 gilL0S/k0z0H0IP5IctGtHbtqMUfD2I2o+lLKQ5txWu++8v7maVSZ6RdzrQmGDp53rJD
 Ck3G7/7u/ChHIUknUwwB91RilHycaFDcj/5OXwWfYkaYEiMfeszChMQo4tL1oH5XCvZX
 YE8nmrxK2rO2e/fdB4G8/hHcckWxI6MkZJ1S9Cn6eBWzYiP58RdSFEeRoDPiESRU5yN4
 bQCLufI94tRgOGNMewfzKI2vYoCbRIx8zLl6bo+5lN0URfNXVghVYtLS4Dv0J0+fYgao
 jWhA==
X-Gm-Message-State: AOAM531ScdLiMNE7JfYCCXFinAQS5huz+QPBAOQqCfjXTvU/a16+97vY
 CEobtabjGUdMINuhsnDuSoFh7rPdB5A=
X-Google-Smtp-Source: ABdhPJy45b5shGF85tjBMKoIrwjTXQgDTjxMEs1AFFjyfkfEIb4NOz+fsiDzSekMZeuXua4qLG2Iqg==
X-Received: by 2002:a17:902:e8ce:b0:132:b140:9540 with SMTP id
 v14-20020a170902e8ce00b00132b1409540mr441432plg.28.1633363360045; 
 Mon, 04 Oct 2021 09:02:40 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:02:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 41/52] KVM: PPC: Book3S HV P9: Don't restore PSSCR if not
 needed
Date: Tue,  5 Oct 2021 02:00:38 +1000
Message-Id: <20211004160049.1338837-42-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This also moves the PSSCR update in nested entry to avoid a SPR
scoreboard stall.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          |  7 +++++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 26 +++++++++++++++++++-------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f4445cc5a29a..f10cb4167549 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3876,7 +3876,9 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
 		msr = mfmsr(); /* TM restore can update msr */
 
-	mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
+	if (vcpu->arch.psscr != host_psscr)
+		mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
+
 	kvmhv_save_hv_regs(vcpu, &hvregs);
 	hvregs.lpcr = lpcr;
 	vcpu->arch.regs.msr = vcpu->arch.shregs.msr;
@@ -3917,7 +3919,6 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
 	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
 	vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
-	mtspr(SPRN_PSSCR_PR, host_psscr);
 
 	store_vcpu_state(vcpu);
 
@@ -3930,6 +3931,8 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	timer_rearm_host_dec(*tb);
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
+	if (vcpu->arch.psscr != host_psscr)
+		mtspr(SPRN_PSSCR_PR, host_psscr);
 
 	return trap;
 }
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 0f341011816c..eae9d806d704 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -649,6 +649,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	unsigned long host_dawr0;
 	unsigned long host_dawrx0;
 	unsigned long host_psscr;
+	unsigned long host_hpsscr;
 	unsigned long host_pidr;
 	unsigned long host_dawr1;
 	unsigned long host_dawrx1;
@@ -666,7 +667,9 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
-	host_psscr = mfspr(SPRN_PSSCR);
+	host_psscr = mfspr(SPRN_PSSCR_PR);
+	if (cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST))
+		host_hpsscr = mfspr(SPRN_PSSCR);
 	host_pidr = mfspr(SPRN_PID);
 
 	if (dawr_enabled()) {
@@ -750,8 +753,14 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (vcpu->arch.ciabr != host_ciabr)
 		mtspr(SPRN_CIABR, vcpu->arch.ciabr);
 
-	mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
-	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
+
+	if (cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
+		mtspr(SPRN_PSSCR, vcpu->arch.psscr | PSSCR_EC |
+		      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
+	} else {
+		if (vcpu->arch.psscr != host_psscr)
+			mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
+	}
 
 	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
 
@@ -957,7 +966,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.ic = mfspr(SPRN_IC);
 	vcpu->arch.pid = mfspr(SPRN_PID);
-	vcpu->arch.psscr = mfspr(SPRN_PSSCR) & PSSCR_GUEST_VIS;
+	vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
 
 	vcpu->arch.shregs.sprg0 = mfspr(SPRN_SPRG0);
 	vcpu->arch.shregs.sprg1 = mfspr(SPRN_SPRG1);
@@ -1003,9 +1012,12 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_PURR, local_paca->kvm_hstate.host_purr);
 	mtspr(SPRN_SPURR, local_paca->kvm_hstate.host_spurr);
 
-	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
-	mtspr(SPRN_PSSCR, host_psscr |
-	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
+	if (cpu_has_feature(CPU_FTR_P9_TM_HV_ASSIST)) {
+		/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
+		mtspr(SPRN_PSSCR, host_hpsscr |
+		      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
+	}
+
 	mtspr(SPRN_HFSCR, host_hfscr);
 	if (vcpu->arch.ciabr != host_ciabr)
 		mtspr(SPRN_CIABR, host_ciabr);
-- 
2.23.0

