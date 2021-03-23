Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4703454D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:18:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D5H0tYzz3gR1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:18:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=g0KPjTuw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g0KPjTuw; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cp11Ymdz3c6W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:57 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id k24so10040570pgl.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmDpEHgsazPBq/iaHf1gq1ioVfAETKz0M2WFtf/RE1s=;
 b=g0KPjTuwknaPHORqF8abNTqxzcfOHoswrBnb1gDIuoXptLY6IUUsijMyI3pTUQ1jUV
 h+un+hveOYovOJODCiIOd7ilsjWeWIx5EwWfJGcY2ifHGigJgkWhfzLiY+I/1dhCA8KW
 0Q3xfBIQIJ2qqQYz99ieZPKpcsE6T+9bPxYU553lDMgIv0kX6Xif5FCXlMf+be/OeNxy
 ZqsW830mMSXOpWQXcWQHxxXaTibYoQAc3Mwx6sKt2u4SCNvaXGODd9B0Tl1oA1qKqjsa
 JoQzbr6NtRtkv1jK06VgBRfyFfmG9GPv1dBJNJSkbzvPIoa2Jf/kLph9RD7RTyLsQ7UX
 amew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmDpEHgsazPBq/iaHf1gq1ioVfAETKz0M2WFtf/RE1s=;
 b=eM0VEZFY+OSiqZr3M/NjLIO2Dq0ggsUE4P9dfa3ppKnNy8vDH6OoirR/UQU86Z4x5F
 1ygHgQMmjNaRiO7vU1JNz17zswyn/pOaIIFE3zSTHG0ZL4TS6/EqtjH5wltJKC8uL6Id
 Jfk+ol7VAFVJcwTuoVT/Kg/hI8uUsv4od5AX34jY5VhS8xEoRMegT00zUGtHKAyqiui4
 VSXOqGEkvyney1syIdiPugAoJsrZ0uH154S2NeREfGaxLeAeSaQdW8ZWpLWXSug0uVT4
 oWB0ZTvmvrHeQZCXY0WcyUcyYJE+mlp1HfnGFrH7ORGue1rUMQ2HnIFLY6cQRTcJBBwU
 5sSg==
X-Gm-Message-State: AOAM531m8Pt5+C1oAEND+3IqU4Co8QD6npDpCTvCPC7xISUBo8pKHjTK
 dG6SAB7fes7JwYr1YsxqBxUE8qxrdrg=
X-Google-Smtp-Source: ABdhPJxMas/9lfwRgTcjcrbFuFFIram7aZO0X8Y5LpmjHrmv+Ugt6nLLBms3F3mgsWZlh5LPD0+RUw==
X-Received: by 2002:a62:8485:0:b029:1fc:823d:2a70 with SMTP id
 k127-20020a6284850000b02901fc823d2a70mr2398327pfd.18.1616461495441; 
 Mon, 22 Mar 2021 18:04:55 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 33/46] KVM: PPC: Book3S HV P9: Move SPR loading after
 expiry time check
Date: Tue, 23 Mar 2021 11:02:52 +1000
Message-Id: <20210323010305.1045293-34-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
index 4058a325a7f0..f57379e73b5c 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -138,21 +138,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
@@ -170,6 +165,19 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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

