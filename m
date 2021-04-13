Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC05435E05F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 15:43:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKRdM5DFdz3c6h
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 23:43:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=a9hdC8gx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a9hdC8gx; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKRcY6pj6z30Dq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 23:42:37 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id w8so7978747pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aIFXl4n2S7P3tkdBMKDpSD5hoW2eh9a/kOWHPmLANoc=;
 b=a9hdC8gxYXkIUMjE7kaLVixRR+c2bEeHakuuhbRFTO2Rhbi2O2RB4J2ObLCP5vvVv6
 NM5vghhwr/RqnXYXAtgNy/NTcYW7Bl2pz+Ztu+CPDlLgzbF4AQ/wPo5Ycbd3oJ4hpjvc
 Fc9GqjmXy2wBZb8QkgregjWl8Oj6BBZjCHRyddiYQjxq7WS8DV7vJR0Ea2dvRo/z6mBU
 RM4Xrwk1Ndm6u0f1bxqZKCEgXMEV4mqZ27bAt3SN9w6WJ0smF47AnW4TgGhreK2vq3mx
 meSCdejdPYDo3X9ad1LFE1SaPmlD5ktk40zFXep46MlkV7y2+bW3ryeQwKuzi4+xYEKL
 Y3Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aIFXl4n2S7P3tkdBMKDpSD5hoW2eh9a/kOWHPmLANoc=;
 b=ohfH4J2ngxEYMTNQeowiUohV4XaYUYM4rd71rjJ8Sk2k7KGG9NYyA5A6jJ/XNUYu2g
 ARLs1mm3GG/qxJ3jCqE0Zpy3npZ09Sq5J4Q0QRs3DINKNrdGRkA55M+KeYmCoKzmwp6y
 rkpWaNXYvpMSMgcJYOU5/QVOe+QRIPECp14Cek8tgVoesay+oOb8DAkd5QQNWQD0U3Ek
 Nkjv+Q4k//Jl3oTfUIzVgJmVdo/ZjZsrw+YcGz7w2005yrMHjrxTdgtMHs+Psra6zEGI
 RvekcwT1nRidlCNYSAX72VsPfatK2nTHuOTiW4wmhZW+IiMp+UbaS2kVorMrgKukmAhl
 /ylw==
X-Gm-Message-State: AOAM5320Uo52xgzInf4HYH7mYklvQX2vuulTFF9kJav/Ml22++Oma3J1
 DKGm9kZcw2GAFeadGeusVUM=
X-Google-Smtp-Source: ABdhPJyX1Q/bskGNFB2AqhCSy8C2F6XutdV4ZJZ16AVWY0/DeH3YKBgzlb6lwlP6pNHfxWTALbgmcg==
X-Received: by 2002:a63:d810:: with SMTP id b16mr31024741pgh.72.1618321355531; 
 Tue, 13 Apr 2021 06:42:35 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id l22sm100465pjc.13.2021.04.13.06.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 06:42:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 1/2] KVM: PPC: Book3S HV P9: Move setting HDEC after
 switching to guest LPCR
Date: Tue, 13 Apr 2021 23:42:22 +1000
Message-Id: <20210413134223.1691892-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210413134223.1691892-1-npiggin@gmail.com>
References: <20210413134223.1691892-1-npiggin@gmail.com>
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
index 981bcaf787a8..48df339affdf 100644
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

