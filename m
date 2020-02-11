Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A57421589AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 06:39:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Gs5y2FgdzDqGL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 16:39:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NpODB2/h; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gs0x5YYHzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 16:34:57 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id n7so4918263pfn.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3xXo7uEfnssBd2qJc1byWG62BsG6/FNbHBXPbd40q3Y=;
 b=NpODB2/h9yGp0PrG88v0OEZ+rUzpNZMjkDj3snVuHSOGnLZsURS0CLXP9ImRRi7OxX
 WQaegWstaw5w/iQghwaJlG7MoerudJTp7rf0I4h+z/QknuT5NUjdiRpmtdMILmRmaSfU
 L/hKSMXIa2nAHytqwg8TKXystcUShhXZA3M9mQkZyzDapnTrthBhCmiYx6rYT+f+lYxq
 ZsUKJnrMFw0Xkj8fF1mheyAncGKEtTAKEGZdTNxt/Hoe8ENYIjE0N7t/IwpcXqY+eus/
 d25mMPRAjgfiYJEY9oek+lgfYKnLyDqN5I75eX0m1+fI02t/1nFdBWsTt6tKADT8Fk//
 Bqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3xXo7uEfnssBd2qJc1byWG62BsG6/FNbHBXPbd40q3Y=;
 b=mYl9ARnxHx6Xmg0BrKOlqfmduG0QTB1kXGcEZ7looh7ODhQQ1a/SWQr1TPAerUHhXG
 qJGbId39Kft8MN60MbXABXrzcJOvYeX1lFQnyhteHldutjSK//BVwV3vmn8moR+EIhHn
 bWm8GenTxVEahR/k7ClOJ2bQaRijuNjvlhs2Ll7HNG6C0wkaiOaFQCNkbIFMvEE1Wfv+
 Wi8vqaSpLh4HWTAR3qJG5L+ubkmYB0MkYJlCaMg+JucxRVxGmnIxivKQYxxlefneb/Hb
 6KXfPQ8GE6KZYmbUqXJTJ/PSB7aMHDbAbNzLbWPi5v9+JR8pEw0OLhxcVF0lks8O2WJr
 6JcQ==
X-Gm-Message-State: APjAAAXsUOcaijeOpFB5mCfnz3jFaTsN/V260vDhKj7YK+Ax4FC/Bgj5
 FxFJzthVsNgjrAS+z0bpcykxzIiTJHJrTQ==
X-Google-Smtp-Source: APXvYqw3ckZm6xU4FL10JVRRbvap/FYlGmQpjy538ZtYWWRIaFcdztB6LF1t0dWzcgnqAyFomXvHrw==
X-Received: by 2002:a63:7156:: with SMTP id b22mr4572872pgn.16.1581399294552; 
 Mon, 10 Feb 2020 21:34:54 -0800 (PST)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id a19sm1189025pju.11.2020.02.10.21.34.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 21:34:54 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/13] powerpc: Enable Prefixed Instructions
Date: Tue, 11 Feb 2020 16:33:43 +1100
Message-Id: <20200211053355.21574-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200211053355.21574-1-jniethe5@gmail.com>
References: <20200211053355.21574-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, mpe@ellerman.id.a, dja@axtens.net,
 bala24@linux.ibm.com
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
index 1aa46dff0957..c7758c2ccc5f 100644
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
index 182b4047c1ef..396f2c6c588e 100644
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
2.17.1

