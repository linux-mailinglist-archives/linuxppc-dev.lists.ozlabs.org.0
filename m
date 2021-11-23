Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A54B459FE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:16:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0RN27zXz3gNm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:16:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YbLcGYxa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YbLcGYxa; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxP5wmXz2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:01 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id m24so16587170pls.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fvZe8X5uZiEm04NwIiPcf+0FCtEtLStCr6oO4LrBR7w=;
 b=YbLcGYxadAkUT8FLThelFosvw4m7dhj4b9UMOVJDoVvIw2rR4BwknjU5t+TwfCyO3L
 2HmemvBLhWz8a3BCOp5v2ogL2L+KBg3vF692Hspy9V4WtrZ95S1m0d7rFEQpLK+b010v
 oNtbIU625ngScuHxAMB/sQap2Qwhfbn5RG74k44e+TcZnPrFI3rFcpo1dFAQtcKRgwIi
 OjJnuMx05+I86tooAq5NMEn4382I4GVww2WrjwoSimZVcu3Bxg+wR/cK9Tokupmp3jGx
 Rj6dDV0dqybFlHZ/lrLoyYFCliX63p8dEcFb1Y5vMVgTdY0f2apMgx+l9DKeTGdKjM/u
 wBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fvZe8X5uZiEm04NwIiPcf+0FCtEtLStCr6oO4LrBR7w=;
 b=Iki6KOE78RjOVUGm13WuwVCkompYA+lbZFZJs62kvQvHlNBWn0A8XAFXq3/KhRZFva
 EZsRcpcPJNR0MT/9CtCptl0nEhPhrJHcrEN5UGMwFwzWXQZgn902NGbJ5upI0f8OIpvI
 QSK4wpRIoZ7D4mPbVsnN9QcLZESMlJOEff8afAmr+nJVVwMBkucXXShq6MKpuJuuOMqV
 zj8fLk2TSNyXZiCOeA9UIwn8uXOyEyHX7NmzAcWqXJXevpWknpPssk/jf30eAOAsw+09
 SVS/ygrJgOC7wbGZ5DCd2Ps3/Q/5WUTHJlk8juvN5l7hFK2bYNM+07BGHoRZUOILoChc
 yowA==
X-Gm-Message-State: AOAM533DGhoyTCxTlW++JbG3q1qXW438O/QLHjWGV6nJa0Fxj8Dpchez
 KMWcn+p7dd4rH+v9lRXXhqOm4MZFvcP4gg==
X-Google-Smtp-Source: ABdhPJykxIA9gLgYxUTKtmvPKvTUOgvco/XzK1kX+lGtfVzSTDrrbkook2mSPVwIlCvUO6Q8PKJBxA==
X-Received: by 2002:a17:90b:188e:: with SMTP id
 mn14mr1263445pjb.91.1637661240102; 
 Tue, 23 Nov 2021 01:54:00 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:59 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 36/53] KVM: PPC: Book3S HV P9: Demand fault EBB facility
 registers
Date: Tue, 23 Nov 2021 19:52:14 +1000
Message-Id: <20211123095231.1036501-37-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use HFSCR facility disabling to implement demand faulting for EBB, with
a hysteresis counter similar to the load_fp etc counters in context
switching that implement the equivalent demand faulting for userspace
facilities.

This speeds up guest entry/exit by avoiding the register save/restore
when a guest is not frequently using them. When a guest does use them
often, there will be some additional demand fault overhead, but these
are not commonly used facilities.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/kvm_host.h   |  1 +
 arch/powerpc/kvm/book3s_hv.c          | 16 +++++++++++++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 28 +++++++++++++++++++++------
 3 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 21ca15c3bc0b..7a55b19eb6c0 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -579,6 +579,7 @@ struct kvm_vcpu_arch {
 	ulong cfar;
 	ulong ppr;
 	u32 pspb;
+	u8 load_ebb;
 	ulong fscr;
 	ulong shadow_fscr;
 	ulong ebbhr;
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 3795080d5403..da29cf9236c8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1436,6 +1436,16 @@ static int kvmppc_pmu_unavailable(struct kvm_vcpu *vcpu)
 	return RESUME_GUEST;
 }
 
+static int kvmppc_ebb_unavailable(struct kvm_vcpu *vcpu)
+{
+	if (!(vcpu->arch.hfscr_permitted & HFSCR_EBB))
+		return EMULATE_FAIL;
+
+	vcpu->arch.hfscr |= HFSCR_EBB;
+
+	return RESUME_GUEST;
+}
+
 static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				 struct task_struct *tsk)
 {
@@ -1727,6 +1737,8 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 				r = kvmppc_emulate_doorbell_instr(vcpu);
 			if (cause == FSCR_PM_LG)
 				r = kvmppc_pmu_unavailable(vcpu);
+			if (cause == FSCR_EBB_LG)
+				r = kvmppc_ebb_unavailable(vcpu);
 		}
 		if (r == EMULATE_FAIL) {
 			kvmppc_core_queue_program(vcpu, SRR1_PROGILL);
@@ -2771,9 +2783,9 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfscr_permitted = vcpu->arch.hfscr;
 
 	/*
-	 * PM is demand-faulted so start with it clear.
+	 * PM, EBB is demand-faulted so start with it clear.
 	 */
-	vcpu->arch.hfscr &= ~HFSCR_PM;
+	vcpu->arch.hfscr &= ~(HFSCR_PM | HFSCR_EBB);
 
 	kvmppc_mmu_book3s_hv_init(vcpu);
 
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index a23f09fa7d2d..929a7c336b09 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -232,9 +232,12 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 				struct p9_host_os_sprs *host_os_sprs)
 {
 	mtspr(SPRN_TAR, vcpu->arch.tar);
-	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
-	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
-	mtspr(SPRN_BESCR, vcpu->arch.bescr);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
+		mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
+		mtspr(SPRN_BESCR, vcpu->arch.bescr);
+	}
 
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
 		mtspr(SPRN_TIDR, vcpu->arch.tid);
@@ -265,9 +268,22 @@ static void load_spr_state(struct kvm_vcpu *vcpu,
 static void store_spr_state(struct kvm_vcpu *vcpu)
 {
 	vcpu->arch.tar = mfspr(SPRN_TAR);
-	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
-	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
-	vcpu->arch.bescr = mfspr(SPRN_BESCR);
+
+	if (vcpu->arch.hfscr & HFSCR_EBB) {
+		vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
+		vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
+		vcpu->arch.bescr = mfspr(SPRN_BESCR);
+		/*
+		 * This is like load_fp in context switching, turn off the
+		 * facility after it wraps the u8 to try avoiding saving
+		 * and restoring the registers each partition switch.
+		 */
+		if (!vcpu->arch.nested) {
+			vcpu->arch.load_ebb++;
+			if (!vcpu->arch.load_ebb)
+				vcpu->arch.hfscr &= ~HFSCR_EBB;
+		}
+	}
 
 	if (cpu_has_feature(CPU_FTR_P9_TIDR))
 		vcpu->arch.tid = mfspr(SPRN_TIDR);
-- 
2.23.0

