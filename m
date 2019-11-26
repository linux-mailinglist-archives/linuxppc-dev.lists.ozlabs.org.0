Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A401098AC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 06:28:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MXVV09mKzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 16:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="stmr0UvD"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MXNB34yTzDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 16:22:31 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id i5so96536pgj.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9vaEnIFydpWGUt2gCvjobhLUYq+2RwtIThBZhNcFat8=;
 b=stmr0UvDQdGo3mfQW62N9i6S5bTC5jUUP+GxEPUSfVzE6szhM6fgZnEjvPUARpzjaY
 MxGerHMselfhvKIGYFYPdGFYVEpC1PNabRuXKIMKLC6+sQhZUW9hdf3Ec3U7URsGdsVP
 hLPGviwlYhsGJtsLG7n6p+D6imhPIPzE88I72+Dc/DEpcdAgwYnxeXbPkm34yT4WkGe3
 464iFpRAr+pblxK+sdESXt4Kg0dBlNIzWKo8bnW6szbPylixgdg17FkmSBenUJo3bD34
 Dm8T/5UNI5lv2sWc8ThUOCTSahSrTXVHK8Ho29rrS+0QkjtK5+tnxzRPwiZhcOHThL3z
 2aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vaEnIFydpWGUt2gCvjobhLUYq+2RwtIThBZhNcFat8=;
 b=qYKOhy5jjzzyWxqgHq3TWsOo2cRMwV0mHqAXSjjf2veJJXjx+PFI+vZ7yHDfzZ/axD
 1wVTrMzrSr6cUANaT34auZ1D2mF9zz3ahpOnZMDf4r1dVOI9js0wAf+4LQ0TGDXRBHMV
 gqBLR9H+pStAij0dOdKsgIPwgiCq9gI/VuWZG713YWQWqRQMyaKqFX0xWQYEyG1RjcGJ
 V3F1iaBCzHL1/gsAjNYJqdDCeNDc7SlVpxlIFsIG6y5lAr8WTUKQcJ/3w726GEMZKxDQ
 syAd9fvZGl9N4F+zVREGPjR2PIqSd+4itghei4OJXfZeVJ2UYhul8NrP5qK2NbpjHvXf
 5myA==
X-Gm-Message-State: APjAAAXgJFFvjK+yG7SSdVfq4qYbPgqQU4e7EMLLHg6GO/2mal05/OuJ
 /dWB6FmSEHJuhOuPfOcckTRif/a4
X-Google-Smtp-Source: APXvYqx6wikg6lzmTtvR/sOIOsuWvZVZqSe2sw5SNxU09g7PhDfyDfLOxUOkCVYAt9CPETvHYLpRIA==
X-Received: by 2002:a63:4547:: with SMTP id u7mr27438418pgk.423.1574745748663; 
 Mon, 25 Nov 2019 21:22:28 -0800 (PST)
Received: from sol.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id t27sm10657920pfq.169.2019.11.25.21.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 21:22:28 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/18] powerpc: Enable Prefixed Instructions
Date: Tue, 26 Nov 2019 16:21:24 +1100
Message-Id: <20191126052141.28009-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126052141.28009-1-jniethe5@gmail.com>
References: <20191126052141.28009-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alistair Popple <alistair@popple.id.au>

Prefix instructions have their own FSCR bit which needs to enabled via
a CPU feature. The kernel will save the FSCR for problem state but it
needs to be enabled initially.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 arch/powerpc/include/asm/reg.h    |  3 +++
 arch/powerpc/kernel/dt_cpu_ftrs.c | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 0b7900f194c8..521ecbe35507 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -397,6 +397,7 @@
 #define SPRN_RWMR	0x375	/* Region-Weighting Mode Register */
 
 /* HFSCR and FSCR bit numbers are the same */
+#define FSCR_PREFIX_LG	13	/* Enable Prefix Instructions */
 #define FSCR_SCV_LG	12	/* Enable System Call Vectored */
 #define FSCR_MSGP_LG	10	/* Enable MSGP */
 #define FSCR_TAR_LG	8	/* Enable Target Address Register */
@@ -408,11 +409,13 @@
 #define FSCR_VECVSX_LG	1	/* Enable VMX/VSX  */
 #define FSCR_FP_LG	0	/* Enable Floating Point */
 #define SPRN_FSCR	0x099	/* Facility Status & Control Register */
+#define   FSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   FSCR_SCV	__MASK(FSCR_SCV_LG)
 #define   FSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   FSCR_EBB	__MASK(FSCR_EBB_LG)
 #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
 #define SPRN_HFSCR	0xbe	/* HV=1 Facility Status & Control Register */
+#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
 #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
 #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
 #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 180b3a5d1001..f5ca7dd8fbaf 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -553,6 +553,28 @@ static int __init feat_enable_large_ci(struct dt_cpu_feature *f)
 	return 1;
 }
 
+static int __init feat_enable_prefix(struct dt_cpu_feature *f)
+{
+	u64 fscr, hfscr;
+
+	if (f->usable_privilege & USABLE_HV) {
+		hfscr = mfspr(SPRN_HFSCR);
+		hfscr |= HFSCR_PREFIX;
+		mtspr(SPRN_HFSCR, hfscr);
+	}
+
+	if (f->usable_privilege & USABLE_OS) {
+		fscr = mfspr(SPRN_FSCR);
+		fscr |= FSCR_PREFIX;
+		mtspr(SPRN_FSCR, fscr);
+
+		if (f->usable_privilege & USABLE_PR)
+			current->thread.fscr |= FSCR_PREFIX;
+	}
+
+	return 1;
+}
+
 struct dt_cpu_feature_match {
 	const char *name;
 	int (*enable)(struct dt_cpu_feature *f);
@@ -626,6 +648,7 @@ static struct dt_cpu_feature_match __initdata
 	{"vector-binary128", feat_enable, 0},
 	{"vector-binary16", feat_enable, 0},
 	{"wait-v3", feat_enable, 0},
+	{"prefix-instructions", feat_enable_prefix, 0},
 };
 
 static bool __initdata using_dt_cpu_ftrs;
-- 
2.20.1

