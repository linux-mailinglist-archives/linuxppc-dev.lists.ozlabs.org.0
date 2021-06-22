Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BF8D3B0263
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 13:07:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8NsD2K5Mz3fh1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 21:07:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=j5fUt+oE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j5fUt+oE; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8NgG5SSwz3c3D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 20:58:50 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id m17so7062655plx.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LJfalil73uKeljur4BgtpcLOhSDvaBS2PpltIheRlE=;
 b=j5fUt+oE2mJuYLgpJBEkEcaa3XB3eUI6ceq+djGIuGQAw1KSMMRrmEhBBrmBhmq5mS
 /BJfbk6moCS0Q9gKPyaqrvqHmZtupsgEqwV0zFCgDl3mheV66OFSif8H+u0rhOQdk3ZD
 IYiDrD2cbT17qiV5d2UNxPRKotCwIo+5U7ZtELpd8g4EBvstU+OH1RyV2yQFGoFrQKLr
 Ivv+GvAgmRz+Mm8hsZzDaDI7XxfFdPkye7zGLjnosNDm7joPgHvkxdyQ3qiH/2g4QG1/
 cWlMIySq/mcLXI8i4g2sZif8x7STHaiRF7gTKmu6EmIVjHM709/dbRmEhL5qMyY3Ibp+
 PrzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1LJfalil73uKeljur4BgtpcLOhSDvaBS2PpltIheRlE=;
 b=MeQqEH7ggpySRO8puYGzDx/b9eiKeL7Oz0i3KyDjIhE3KsRfFtqxjSSy3O8c3OvrkY
 WasJTa9r24mf6I2kIi8hxzgLEKD9UH/Z1zJzV5xBb6ItLNJZB/f9vHvUjDS6DxzLaMPr
 tb/4yT9l8d0UvsIz8g3fEeTNRs8yQRnnCvg7qINxp0ITxh3Jj/ScO9DdSWECY9+fJrQ6
 lftPetMNzPSv6XUC5I3xJZYoy/2eTW7eiGm0QHkz+/rmZdD4IAzRXnDuey6xpwcpgcN7
 fUagaEF9GSNrOTkioKlAwBfCFlDrp1aoMOUolcgbRvtDbPKsChps+rEDAmXjY4JDrqg6
 9Y8g==
X-Gm-Message-State: AOAM533S1NDonbFC4PGUEHJCNOjNY+looVmTYzl5+PO/HupVkwuFby5I
 pfQWBvdTgqqxiTH6RzHAMjriv57nZsE=
X-Google-Smtp-Source: ABdhPJz/FF92zn6KzAyPUOBSWa8QE0H1Q3c56QYdIqahi2AXNBxFboZJEnGqRBUiVQt+d5XJgy8w8g==
X-Received: by 2002:a17:902:fe10:b029:127:6549:fe98 with SMTP id
 g16-20020a170902fe10b02901276549fe98mr160846plj.25.1624359527688; 
 Tue, 22 Jun 2021 03:58:47 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id l6sm5623621pgh.34.2021.06.22.03.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 03:58:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 21/43] KVM: PPC: Book3S HV P9: Move TB updates
Date: Tue, 22 Jun 2021 20:57:14 +1000
Message-Id: <20210622105736.633352-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210622105736.633352-1-npiggin@gmail.com>
References: <20210622105736.633352-1-npiggin@gmail.com>
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

Move the TB updates between saving and loading guest and host SPRs,
to improve scheduling by keeping issue-NTC operations together as
much as possible.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 469dd5cbb52d..44ee805875ba 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -215,15 +215,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.ceded = 0;
 
-	if (vc->tb_offset) {
-		u64 new_tb = tb + vc->tb_offset;
-		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
-		vc->tb_offset_applied = vc->tb_offset;
-	}
-
 	/* Could avoid mfmsr by passing around, but probably no big deal */
 	msr = mfmsr();
 
@@ -238,6 +229,15 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
+	if (vc->tb_offset) {
+		u64 new_tb = tb + vc->tb_offset;
+		mtspr(SPRN_TBU40, new_tb);
+		tb = mftb();
+		if ((tb & 0xffffff) < (new_tb & 0xffffff))
+			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		vc->tb_offset_applied = vc->tb_offset;
+	}
+
 	if (vc->pcr)
 		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
 	mtspr(SPRN_DPDES, vc->dpdes);
@@ -454,6 +454,15 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	tb = mftb();
 	vcpu->arch.dec_expires = dec + tb;
 
+	if (vc->tb_offset_applied) {
+		u64 new_tb = tb - vc->tb_offset_applied;
+		mtspr(SPRN_TBU40, new_tb);
+		tb = mftb();
+		if ((tb & 0xffffff) < (new_tb & 0xffffff))
+			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		vc->tb_offset_applied = 0;
+	}
+
 	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
 	mtspr(SPRN_PSSCR, host_psscr |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
@@ -488,15 +497,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (vc->pcr)
 		mtspr(SPRN_PCR, PCR_MASK);
 
-	if (vc->tb_offset_applied) {
-		u64 new_tb = mftb() - vc->tb_offset_applied;
-		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
-		vc->tb_offset_applied = 0;
-	}
-
 	/* HDEC must be at least as large as DEC, so decrementer_max fits */
 	mtspr(SPRN_HDEC, decrementer_max);
 
-- 
2.23.0

