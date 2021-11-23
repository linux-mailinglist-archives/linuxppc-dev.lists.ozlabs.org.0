Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9B0459FCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0JQ4RCjz3frc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:10:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mZ/TXvJg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mZ/TXvJg; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzx42sTnz3cPC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:53:44 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id h63so17792059pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lsmQXZXSslExyEu4yT8LtW1o8ZBitu9FwVGKP4u7ZSM=;
 b=mZ/TXvJgVtG1XD9WDZtBbfPKGCXq9QlmvqRSXC1zPozy/2YuryNYtsDsQzOS60boQT
 TQPm4gh5Ks90S9ktR0CIDUwK2D1bcl8KIEgiSF5veKdshBu0k/TrdEHKyH93C9RoqQ7X
 mlv4lg3Cm6n+EQopBlcZrgUVVt/sckauBT7flWlRkhb44MbCE6JSoBtmF5fmv3wnyHP6
 ueBPwr6FsIraC5CyJB4d6DyDaEgc1PnneoRtrS5Gos8EgFxI2p3dO1NlCYlkPhm7qeIk
 v00AYOOhSjN6fWovWnTlg9/33TcSjwog1/DXei87F5rgA2IhzZc3ukAW6h1Ed48SHv9C
 bapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lsmQXZXSslExyEu4yT8LtW1o8ZBitu9FwVGKP4u7ZSM=;
 b=zG1go4bAgNvmEq7B0Keznt+Nun/NTphdxCPScojqFYtyZtLU0+6zTDSkSr7UlM3aib
 r0PatdX9RI2RpT88w2YaubP5D05y1RFHWFyvLjEAKlbT0RvLgLU3ngyMHgJQA2fAUhK+
 s0kV6IGJziA0MHywHEPnl8kmJ1QXCTJ0QANNd9z9gPmoAbrpeHT4tCdUiJyvLg4BjMCr
 SJIihQZ+91h94KTsTBz8S80cB12Fk7OqqLqmiQ/DnvszEdTW9EFZvoGshvzaai1jm35N
 PAKDI0sBtTKxCQ5MlHk1vUtTbVZtlMwQBJqw5NWD/2MkzFSPqkd6hplLilY8ZVr1T8BA
 153A==
X-Gm-Message-State: AOAM530Yi/pC0n9yxQ39t+3oUGtFecuXxCv2AH+lK5qFC7TG38O+Q+lg
 u7f/2ehiAhK+VL9Fgd5oNQQ4s60CaRy/bg==
X-Google-Smtp-Source: ABdhPJw7KEF7VwOCfEQQttkH/mcSZWIvT1JFal0PqvPdbZ1nWZ5mdTRDnIjs5BfjLPnGQMfB5G/W1A==
X-Received: by 2002:a63:ff09:: with SMTP id k9mr2902145pgi.76.1637661222316;
 Tue, 23 Nov 2021 01:53:42 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:53:42 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 27/53] KVM: PPC: Book3S HV P9: Juggle SPR switching around
Date: Tue, 23 Nov 2021 19:52:05 +1000
Message-Id: <20211123095231.1036501-28-npiggin@gmail.com>
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

This juggles SPR switching on the entry and exit sides to be more
symmetric, which makes the next refactoring patch possible with no
functional change.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 5c44c4ff5d46..53fe41102c22 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4222,7 +4222,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 		msr = mfmsr(); /* TM restore can update msr */
 	}
 
-	switch_pmu_to_guest(vcpu, &host_os_sprs);
+	load_spr_state(vcpu, &host_os_sprs);
 
 	load_fp_state(&vcpu->arch.fp);
 #ifdef CONFIG_ALTIVEC
@@ -4230,7 +4230,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 #endif
 	mtspr(SPRN_VRSAVE, vcpu->arch.vrsave);
 
-	load_spr_state(vcpu, &host_os_sprs);
+	switch_pmu_to_guest(vcpu, &host_os_sprs);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4330,6 +4330,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 			vcpu->arch.slb_max = 0;
 	}
 
+	switch_pmu_to_host(vcpu, &host_os_sprs);
+
 	store_spr_state(vcpu);
 
 	store_fp_state(&vcpu->arch.fp);
@@ -4344,8 +4346,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu_vpa_increment_dispatch(vcpu);
 
-	switch_pmu_to_host(vcpu, &host_os_sprs);
-
 	timer_rearm_host_dec(*tb);
 
 	restore_p9_host_os_sprs(vcpu, &host_os_sprs);
-- 
2.23.0

