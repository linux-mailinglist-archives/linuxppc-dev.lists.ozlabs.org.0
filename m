Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B6B332510A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZCc0LbVz3d99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 00:59:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EADf74ji;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EADf74ji; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmYzJ6ydfz3cmr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 00:48:44 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id n10so3797709pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 05:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nFaLjtbHvhG9RPsmAn2L9v8PlI/yIaIQI9IuG70b8yw=;
 b=EADf74jia1v+Dl6Sggk63dBVE/91g56OzdKAcCr7OH87ZEbwTUUsyIYSYtUebnuqut
 RYYC17/N81cipa9HgiuVssN//6TD3rDIDGN1irGlLuJ1m721pGVwnDW5wwwg1dFbp2Ol
 eWRpz6/s54aUApKSIGxi/DdNTFrEhtFzoMVWVUU4kDY4o34RAc0JhuP9BVP7TJOA88pW
 NDWGl5cSGpo8WPjtWxVGgM6/eclmiSBMj9hnAnoDD54m77l5KhxFk2yqCA2zNouz7JGW
 olbzgujULdHZzqDNwVsaXMY7UbfDDxokHWzIWz+0tKBEQGpIzzfN5HqLgUulHtuzhLKF
 wCdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nFaLjtbHvhG9RPsmAn2L9v8PlI/yIaIQI9IuG70b8yw=;
 b=PtiKYITcYWrXNdDXledLGW3i+3JU1HadAlC28ioKl4Be9QCjJ9qB5x1zOgMw7sJXtU
 m/eyQOntgRzZeJmxfwqaBgvW5Lsin42p+vTslDbbq/cgWGEzAUMbWwq6+8z3c/qBANBQ
 0BnqkcotRw4M/hVLXcrgAKkSutsW7Qr+Z/8XuX34Iqj8aEg1JaVThimhf9AoEez9Z1Gy
 yrqblQJYxJZL6g7Qw9v11oaA2ATTMaIke6cfkqZEUOFtlhOSSt5XYOhF+TMz6/yNwbec
 sDRw9piMSFFM+CxELdjKSaoOXWuW50UeJskm6Xx8fiXEi2bYTBEnpknRCaJ6fQ+QLQXH
 K/mQ==
X-Gm-Message-State: AOAM533DYy42CLxVhhlXFDQpDcmL9sw7IuxHUwnppbTVW589fBqflnNe
 r9a03GVqFO8vZX1f2AXrlEQ=
X-Google-Smtp-Source: ABdhPJwUbThXbDyvaI7aS0Fet3uIuMuLbgnDOCcKp5h4bhbUy/L5JdKF4Iq5km8L76+G2R6KN4SepA==
X-Received: by 2002:a63:1c13:: with SMTP id c19mr2929117pgc.359.1614260922556; 
 Thu, 25 Feb 2021 05:48:42 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a9sm5925868pjq.17.2021.02.25.05.48.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 05:48:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v2 29/37] KVM: PPC: Book3S HV P9: Switch to guest MMU context
 as late as possible
Date: Thu, 25 Feb 2021 23:46:44 +1000
Message-Id: <20210225134652.2127648-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210225134652.2127648-1-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
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

Move WARN_ON traps early so they are less likely to get tangled
on CPU switching to guest. Move MMU context switch as late as
reasonably possible to minimise code running with guest context
switched in. This becomes more important when this code may run
in real-mode, with later changes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 40 +++++++++++++-------------
 arch/powerpc/kvm/book3s_hv_nested.c    |  1 +
 2 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index dd0a78a69f49..b93d861d8538 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -143,8 +143,13 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
+	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
+
 	start_timing(vcpu, &vcpu->arch.rm_entry);
 
+	vcpu->arch.ceded = 0;
+
 	if (vc->tb_offset) {
 		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -193,26 +198,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	mtspr(SPRN_HFSCR, vcpu->arch.hfscr);
 
-	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
-	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
-	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
-	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
-
-	mtspr(SPRN_AMOR, ~0UL);
-
-	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
-
-	/*
-	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
-	 * so set guest LPCR (with HDICE) before writing HDEC.
-	 */
-	mtspr(SPRN_HDEC, hdec);
-
-	vcpu->arch.ceded = 0;
-
-	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
-	WARN_ON_ONCE(!(vcpu->arch.shregs.msr & MSR_ME));
-
 	mtspr(SPRN_HSRR0, vcpu->arch.regs.nip);
 	mtspr(SPRN_HSRR1, (vcpu->arch.shregs.msr & ~MSR_HV) | MSR_ME);
 
@@ -231,6 +216,21 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDSISR, HDSISR_CANARY);
 
+	mtspr(SPRN_SPRG0, vcpu->arch.shregs.sprg0);
+	mtspr(SPRN_SPRG1, vcpu->arch.shregs.sprg1);
+	mtspr(SPRN_SPRG2, vcpu->arch.shregs.sprg2);
+	mtspr(SPRN_SPRG3, vcpu->arch.shregs.sprg3);
+
+	mtspr(SPRN_AMOR, ~0UL);
+
+	switch_mmu_to_guest_radix(kvm, vcpu, lpcr);
+
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
 	__mtmsrd(0, 1); /* clear RI */
 
 	mtspr(SPRN_DAR, vcpu->arch.shregs.dar);
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index 0cd0e7aad588..cdf3ee2145ab 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -323,6 +323,7 @@ long kvmhv_enter_nested_guest(struct kvm_vcpu *vcpu)
 	vcpu->arch.shregs.msr = vcpu->arch.regs.msr;
 	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
 		LPCR_LPES | LPCR_MER;
+	/* XXX: set lpcr in sanitise hv regs? Why is it plumbed through? */
 	lpcr = (vc->lpcr & ~mask) | (l2_hv.lpcr & mask);
 	sanitise_hv_regs(vcpu, &l2_hv);
 	restore_hv_regs(vcpu, &l2_hv);
-- 
2.23.0

