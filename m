Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F279393F9D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzV21kdcz3dMG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:12:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=S27WD7+Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=S27WD7+Z; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPP5g5Tz30FD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:25 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id q15so2030614pgg.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mQleErudL7LlSeeWLywYowKU3q8rCRmoPGtYQA3+M6c=;
 b=S27WD7+Z5zk2CvpIGLQmGAAYSJP2LkALG7/uGpO8U5ZMu21EAze8cXe0bXE16L/9Tg
 W74cQn9v2XE65HAEbcOSJna4onm5zuj2EibQil7ebvYZ+3lezrRamH2+rxX8aLsLNh3p
 HGo1bUFHUAMRVHDTCVed5iDDlRAMYKcuMbs0lrFYL+o1RPcxVE0MLpwQcwXW0uqH0aon
 /OH1mTq4ZX0CZwfvhITWH+XB/JIHzpPHySaF8hmuLrigw8d9+djdpqIzb4h6ixOI6PW5
 RPOrrF1XQDTu1ZR/S3mcsociGioYlwvO0s0Sh1cnU26gXahjZGWkNMzZIOUprMiYLzUs
 NawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mQleErudL7LlSeeWLywYowKU3q8rCRmoPGtYQA3+M6c=;
 b=ahKFivB99tTsMW4cU80rHctchgO3ic6Wydgmi7rXB+uqeEMFFMpg37+o71WW67jXMJ
 XgaTCRUZnHnQWVq2Zzykg7XKdFX8Fu88lfboka8IZWv8jf2NtmyiAciPo/iURjrU3jbA
 rgEeEyk4I52AZrJlLb1OleMaoFpOSbZ0PZAvl/hDS42sHXMhEYqaGf0uNek9vGFYxRq5
 4IFdvoBuHQxFGPgOUYOJ+LtAYagXpAMMvaPAz5VeXcYpxTqN+Lq3OnX1qLvQtT7h8vBs
 RDmi9XJtl42igXI3JozjJChnUCqlh4+8pYyQiY/cf5MPY+ahJhmRgCC09my1C2AjKOxI
 xYQw==
X-Gm-Message-State: AOAM532x0be9i2dTjuSzTMcHDDoHOKNP4Eg6kaUMn9uwPQ7vIW5Z/7EV
 EEQdVSl+ctDWWuE+TR3625I=
X-Google-Smtp-Source: ABdhPJwrzWvrZxNJb7pqq8f0jddC79WWo0mHiH82Jx/72GOGrjLrk6dYpGqSAGiNbHIuW6FqIESYfA==
X-Received: by 2002:a63:ba03:: with SMTP id k3mr7934502pgf.81.1622192903256;
 Fri, 28 May 2021 02:08:23 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:23 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 09/32] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
Date: Fri, 28 May 2021 19:07:29 +1000
Message-Id: <20210528090752.3542186-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LPCR[HDICE]=0 suppresses hypervisor decrementer exceptions on some
processors, so it must be enabled before HDEC is set.

Rather than set it in the host LPCR then setting HDEC, move the HDEC
update to after the guest MMU context (including LPCR) is loaded.
There shouldn't be much concern with delaying HDEC by some 10s or 100s
of nanoseconds by setting it a bit later.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 907963b174e1..466d62b35b6a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3502,20 +3502,9 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
-	/*
-	 * P8 and P9 suppress the HDEC exception when LPCR[HDICE] = 0,
-	 * so set HDICE before writing HDEC.
-	 */
-	mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr | LPCR_HDICE);
-	isync();
-
 	hdec = time_limit - mftb();
-	if (hdec < 0) {
-		mtspr(SPRN_LPCR, vcpu->kvm->arch.host_lpcr);
-		isync();
+	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
-	}
-	mtspr(SPRN_HDEC, hdec);
 
 	if (vc->tb_offset) {
 		u64 new_tb = mftb() + vc->tb_offset;
@@ -3563,6 +3552,12 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 	mtspr(SPRN_LPCR, lpcr);
 	isync();
 
+	/*
+	 * P9 suppresses the HDEC exception when LPCR[HDICE] = 0,
+	 * so set guest LPCR (with HDICE) before writing HDEC.
+	 */
+	mtspr(SPRN_HDEC, hdec);
+
 	kvmppc_xive_push_vcpu(vcpu);
 
 	mtspr(SPRN_SRR0, vcpu->arch.shregs.srr0);
-- 
2.23.0

