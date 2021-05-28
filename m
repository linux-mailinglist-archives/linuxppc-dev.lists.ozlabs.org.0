Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BD393FAF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzZg38HDz3fCY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:16:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bo4LQUms;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bo4LQUms; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPr2YcLz3byh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:48 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id j12so2053084pgh.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=93ZW7UwUCAB4MEfJeaOXKnfYp71unN3wnqawYPiJ9mA=;
 b=bo4LQUmsJGNUIfBjNCZngm+LdbHqPqk8bYULOyUhXGT11dgYrnGZtZdJ4v/EcmK6l4
 F6cVBiupBwKBzfw7m094hA2/UPUclcFfO3izMikjKvzfadiUHE9cZ1MbFfFkySVo5o66
 Hu0s6LeiVQiyv/Q3J9+Lo93VvEgUMuCtoHyjq9tWkTIVA3wuPO+jOYNa11g3ZqLoYqnS
 WRxVVI2QBnSd6KuM4uhKP8jlP9E2spPN6WvxO/DWccyj/tO/UjQYWogyUwo398p1xxjy
 8aV1Nf6qkR9/e0waGQzDMwlH3Z4ySHUKIKKzvh/cFYACM8xIbIJfNVScqENImJQz9ILW
 libw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=93ZW7UwUCAB4MEfJeaOXKnfYp71unN3wnqawYPiJ9mA=;
 b=XBI2A2sXpMp8MQKGzQCbvhT28wJe7LomKsBo3AJdpJ8mkYhWpQP+7N1JOo/BcD0ce4
 qSN5hu5ycYzI8EsY05VswAHyrvWxnQCSYXz28R/TQZqmwiB5+qVeAWvn1ehfS0SYmAHP
 UR8kBYkCyEiJxneKEHt2rAosat2KfL14kvC0A8Iap6JA3KH3veOrvW2CU6GW9VMSTi0/
 X5Aiyu4RsZTuO2b9JFzxya/dJ0wO0+wl4OrF0lUqmb1nhQP42s3SLl4iTjVBAm/wKv6N
 cjPq+8u9xj+VFOvd/wWzXHn/8cwPUFmCy5OxBRKZeiyZIzapMjeCkB9bjRAY6o9G3h2b
 yLSQ==
X-Gm-Message-State: AOAM532qnTiCR0ydUDZXwQJCvsnoYZA+8NBOfqIkEGfGlaXvVR8l/KTn
 E2FLLcVmvelWh/jVnKcMURY=
X-Google-Smtp-Source: ABdhPJwpZQuGNq1wy+JMPK3nQ1TJsPutRmULuFbJtHA/3IbKJQdCJuzbvhT6NUxd3qkQxkuUg7Lvdg==
X-Received: by 2002:a63:5252:: with SMTP id s18mr8008613pgl.229.1622192926205; 
 Fri, 28 May 2021 02:08:46 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 18/32] KVM: PPC: Book3S HV P9: Move SPR loading after
 expiry time check
Date: Fri, 28 May 2021 19:07:38 +1000
Message-Id: <20210528090752.3542186-19-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is wasted work if the time limit is exceeded.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 36 ++++++++++++++++-----------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 8a56141214c1..f24a12632b72 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -123,21 +123,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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
 
 	hdec = time_limit - mftb();
 	if (hdec < 0)
@@ -154,6 +149,19 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
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

