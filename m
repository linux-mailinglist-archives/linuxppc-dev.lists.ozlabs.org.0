Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2971459FFD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:19:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0WD4MDGz3gfR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:19:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d6bxkMvN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d6bxkMvN; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzxb66Vxz3cX1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:11 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id u11so16615121plf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dxwv+65t54bV+1fSYcdkM4k+96IsxTQ+Dk8ZwPadNLk=;
 b=d6bxkMvNyLoki5pkjUubgMkGk/sZzscAuXs4h3nSc/R/AdJrpQCCswdqXKA/APwBFb
 614Ms0Iq8nlrOWm9r33CALPnNZCfbE+EYqiTE/wGrMCYFusw84Hgap23MM9IrmaJGEXc
 lMC+W9bH7BXVW3iHPffetGndCQZ2aZeGSZTyJpgNy4jVTY/poCi0Kb8UANzkPUO3dnuf
 e46Q+T4LibPWIzV9l7ZnCi4cVJJqzbsPz1GxW3ILlyZ+cXk8X1RjmxbM1AThdpijGmU7
 A7pOuf1w9BtItlCAiUEttXEOMiunWWXGiO7Xjegq/weKdzx5zIjPNAYEIXKkcEJO9ezk
 4Z3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dxwv+65t54bV+1fSYcdkM4k+96IsxTQ+Dk8ZwPadNLk=;
 b=Ex5Vw8I7f9WpXhszamAdPedsd/o9lOnu/5o3pQLXSUdOXsuT3YBxrY2mGmTjxuZN1t
 q8guxfx8nUrX1lxj/cS+jmuYb7/m9+mYtrPPbzHbJp4kaHceyPIU+ixZw6b66fVjjf91
 Z8/1G6yXZfpE9jfmGPI5kFdHNsGpzEf2MwxcZVzHJPrG29vn0Q9CaDeyaydCdOl7N2Ow
 DHrWTSQq+4qIUg8hV7r8Jz1Zmt92FOH9bsrd8PcBGbnnx+C8r2j6hobbqM586/lMy651
 KPPTvaCFF6fa7ZOMiCFaRQhqef1VTFUwqN5Cx8gg22w5ZacN4zw+ZV33YiW/d02uzl96
 o9og==
X-Gm-Message-State: AOAM531CBz67V4zyqgTiWdqLeYNF8dZQ51KlPqkyU+axc68mjvTSi+XN
 n4nR+zcGawVVWr4ffBbmB+UCAXHycw7Jiw==
X-Google-Smtp-Source: ABdhPJz8brWCm+euUH2nrGLU1PZfZR+zfR2633295AxCLljCgHB9bnujynalAx6csR2lOL08syXxvw==
X-Received: by 2002:a17:90b:1d81:: with SMTP id
 pf1mr1330346pjb.134.1637661249978; 
 Tue, 23 Nov 2021 01:54:09 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:09 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 41/53] KVM: PPC: Book3S HV P9: Don't restore PSSCR if not
 needed
Date: Tue, 23 Nov 2021 19:52:19 +1000
Message-Id: <20211123095231.1036501-42-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
index 7d48aa8aebb2..9da27f19a697 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3889,7 +3889,9 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	if (unlikely(load_vcpu_state(vcpu, &host_os_sprs)))
 		msr = mfmsr(); /* TM restore can update msr */
 
-	mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
+	if (vcpu->arch.psscr != host_psscr)
+		mtspr(SPRN_PSSCR_PR, vcpu->arch.psscr);
+
 	kvmhv_save_hv_regs(vcpu, &hvregs);
 	hvregs.lpcr = lpcr;
 	vcpu->arch.regs.msr = vcpu->arch.shregs.msr;
@@ -3930,7 +3932,6 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
 	vcpu->arch.shregs.dar = mfspr(SPRN_DAR);
 	vcpu->arch.shregs.dsisr = mfspr(SPRN_DSISR);
 	vcpu->arch.psscr = mfspr(SPRN_PSSCR_PR);
-	mtspr(SPRN_PSSCR_PR, host_psscr);
 
 	store_vcpu_state(vcpu);
 
@@ -3943,6 +3944,8 @@ static int kvmhv_vcpu_entry_p9_nested(struct kvm_vcpu *vcpu, u64 time_limit, uns
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

