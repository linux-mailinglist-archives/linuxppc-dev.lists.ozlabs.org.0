Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD98353ADE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCsC0mHsz3glp
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:35:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=muOHp/vI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=muOHp/vI; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCYh1Ls4z3cN1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:59 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so7088671pjh.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TGKHP+bbZ5HpeqjL0ziVqhKR6G70TwNSVTHqxmQ2sOI=;
 b=muOHp/vI+RhL5vOz6Bu5jATo+MrWev1hms+tcMLsQUtMe+ZR1ua4Mx9NKk05l0798I
 UGSB3/BtoGPV6sMhIBTBiIeJMj0cioS81x4Hu5oT2TFkpL/Php2RE5C3rxQR4iwDlHUg
 WZ7E8hC1NBhTvy/5NqcUFjc11ZwRXkhu33wVqMoI2ZaqIlGEkzB6OJg+WfOTosvvPQML
 QCPHp+yYB4FX48toTHfpjjU/Y0Okw4cvhjJXeIXTM0YSyAYTHNLbtGICaqiaxBN0gazF
 COs6Chf8mZhflp7796ngJMJMqj47sd7WZhyj8KO56f5NkeArip96XsjTnFmIN3ZNMl+w
 xZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TGKHP+bbZ5HpeqjL0ziVqhKR6G70TwNSVTHqxmQ2sOI=;
 b=H6Go3S5OiQMwW+Cdh2nh7alKxoKXlv3jTiZjj9hgiGqQJZN56JruMCitro/bXOq2fL
 IzXonCDSUSL4BRXU/84Z74GkMnIcYzn/UisLYc/UKarsVn3hwplrQcsp9FPtIu2L8875
 ss8C1tPx4fdFLKWKRO51+j+SFdPdO1+SEci6/pRFJ9jAhfOS3fB3dsbKGfZF7Hc2uu9K
 Kblnxq5aIHSVQEYuKKBcpD4t6uZrfyfqsfDcknSpBjoGmS++HTDeUdQrli3CoSaEfxCW
 wnltK70ri/sn+keeytorqH3t8wx5d0gw32SS9d5y0ollFOrhFfrg/usQVXvETz+S/gtj
 yGTw==
X-Gm-Message-State: AOAM530VxWl+PNrhDcPYB05LGrsYGTtTdMdW0X+UsFYuxrB4RJOV34bF
 qSHPqRC7uZ3JBMqNV+jJThs=
X-Google-Smtp-Source: ABdhPJxcGNfJM1qoYqtN8hzaJAWk6fODQ6qJicUk+aq23Cv/V0CpmV8cqsQSUTETOoBV1Q84lo69vw==
X-Received: by 2002:a17:902:c407:b029:e7:2272:d12e with SMTP id
 k7-20020a170902c407b02900e72272d12emr21804963plk.52.1617585718333; 
 Sun, 04 Apr 2021 18:21:58 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 34/48] KVM: PPC: Book3S HV P9: Move SPR loading after
 expiry time check
Date: Mon,  5 Apr 2021 11:19:34 +1000
Message-Id: <20210405011948.675354-35-npiggin@gmail.com>
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

This is wasted work if the time limit is exceeded.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 36 ++++++++++++++++----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index 44c77f907f91..b12bf7c01460 100644
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

