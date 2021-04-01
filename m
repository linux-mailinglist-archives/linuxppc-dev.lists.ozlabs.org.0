Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6FE35160C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6Kl4H1qz3gkg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:19:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=UL063ESD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UL063ESD; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB61b41bKz3cWl
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:23 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id y2so1162206plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HGt1pa4lw5NCECf9jcYilrTKWgWaQkMBLbkdgvbSzU=;
 b=UL063ESDaetizihR1x6Z8QYrvRMsgagWoj54zTtxRPgj/jXknACxbFhfq1piuz/Xo7
 PYqDRwq24Wy5TObjFxLDhY4XP7BEjwZlEfVuUInnXnRTarZAgTRdy3aG/OlUo5MQE0h4
 tX3fokHmrgT2EnAJzXuX0FVNtxzTS8Xi/bZDQKNKZb61D2w0zDpAEnjKmakyy/BgA1nz
 fQeDHb3hMixTVy4cRP2+TviXzSEjt4uGXbLJE9bMVpWduOCKl+xPHC7hDJVcBGb3bQut
 O+XkD/BN1aUVaHP7c6fMVHawozfR5dNmNiKjn+Bd+xet411UudNxLWry2zYhjwgzec7S
 A/gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HGt1pa4lw5NCECf9jcYilrTKWgWaQkMBLbkdgvbSzU=;
 b=Pu1j/7C1n4R7AAk69Nuy53TzLMcXowdRpEK316BRt9tT1vxU2DOrjHx2BcJxjmW3PM
 XoGRQfTitj8sSk9uV1u2pXSuOKRM6W+mvp1qgmirPHzHDOPhaQBl0WQI3ywvwtCKUV94
 rkeis7MvPfpNXlOAR2hu2i1lLYQPQzlsC0hMKxy1kM1gCFbm13gBbMrFder/BOG/Dk63
 Qp4I9ZfyBSI7D6Yw1VKltKLYflNjFW2pfkMLVpTu1iUgE8CTaF61zm5Z20jjCO8ww2Pa
 4hiJDvPq3sYwYJPaPc9h5MQL/uQ72TZKyC7GEynrb7FcSeEUtvLk9uqc3LpLuDYiEpFU
 KoUQ==
X-Gm-Message-State: AOAM5316b+xwza3QEp7WFPxAlMvFGzQbuKe9Nm6eYc2dX4Kr42QhHE7D
 wDurJRt4N3YiO6a+LUwJMyv9KZlOeEA=
X-Google-Smtp-Source: ABdhPJxyQY6etD1TI+8X+6/TZvuyFgXri8vMVp2lw4Hqoxh9HiSAKhQAkNRv5hPjoQc/X+B63dqLFA==
X-Received: by 2002:a17:90a:b311:: with SMTP id
 d17mr9453032pjr.228.1617289521273; 
 Thu, 01 Apr 2021 08:05:21 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 34/48] KVM: PPC: Book3S HV P9: Move SPR loading after
 expiry time check
Date: Fri,  2 Apr 2021 01:03:11 +1000
Message-Id: <20210401150325.442125-35-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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

This is wasted work if the time limit is exceeded.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 36 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index 62cf0907e2a1..29e2ae04b8d5 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -133,21 +133,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	u64 tb, purr, spurr;
 	u64 *exsave;
 	bool ri_set;
-	unsigned long msr = mfmsr();
 	int trap;
-	unsigned long host_hfscr = mfspr(SPRN_HFSCR);
-	unsigned long host_ciabr = mfspr(SPRN_CIABR);
-	unsigned long host_dawr0 = mfspr(SPRN_DAWR0);
-	unsigned long host_dawrx0 = mfspr(SPRN_DAWRX0);
-	unsigned long host_psscr = mfspr(SPRN_PSSCR);
-	unsigned long host_pidr = mfspr(SPRN_PID);
-	unsigned long host_dawr1 = 0;
-	unsigned long host_dawrx1 = 0;
-
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		host_dawr1 = mfspr(SPRN_DAWR1);
-		host_dawrx1 = mfspr(SPRN_DAWRX1);
-	}
+	unsigned long msr;
+	unsigned long host_hfscr;
+	unsigned long host_ciabr;
+	unsigned long host_dawr0;
+	unsigned long host_dawrx0;
+	unsigned long host_psscr;
+	unsigned long host_pidr;
+	unsigned long host_dawr1;
+	unsigned long host_dawrx1;
 
 	tb = mftb();
 	hdec = time_limit - tb;
@@ -165,6 +160,19 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		vc->tb_offset_applied = vc->tb_offset;
 	}
 
+	msr = mfmsr();
+
+	host_hfscr = mfspr(SPRN_HFSCR);
+	host_ciabr = mfspr(SPRN_CIABR);
+	host_dawr0 = mfspr(SPRN_DAWR0);
+	host_dawrx0 = mfspr(SPRN_DAWRX0);
+	host_psscr = mfspr(SPRN_PSSCR);
+	host_pidr = mfspr(SPRN_PID);
+	if (cpu_has_feature(CPU_FTR_DAWR1)) {
+		host_dawr1 = mfspr(SPRN_DAWR1);
+		host_dawrx1 = mfspr(SPRN_DAWRX1);
+	}
+
 	if (vc->pcr)
 		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
 	mtspr(SPRN_DPDES, vc->dpdes);
-- 
2.23.0

