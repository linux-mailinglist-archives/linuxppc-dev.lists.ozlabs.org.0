Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7AF16F65D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 05:14:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S2Vm1JXlzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 15:14:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=KYLddRCC; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S2Mz1jztzDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 15:08:14 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id n96so692328pjc.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3xXo7uEfnssBd2qJc1byWG62BsG6/FNbHBXPbd40q3Y=;
 b=KYLddRCChfxa3xB1SZX7mZVddV/enHL2pQ4cPHZoDRrM3DgBadFbx6AXuBUw7nxkrh
 q0om31Dc2w9lphlwp4EsEnsdK3LlxNQPxoWmf5lP13hxsL4ppu89K82u1Hw/MykA3kp8
 W+67GLa0FvwyVmhXc/JeSEFFcXVD8od2Ivr2IDcswAzu/eIbqMyRMm6ClGnj1jiLAht/
 saBBTI5ntCB5GAfYeSdRxZigHBmiao3jzg9sohKPYpiJfzlDNVZPpMx9qWkxR2IpujMM
 BNiUehJXYgB0d508hkzhyb9+xhNxFun42VRGvY9YFu/dextakQcK033s8Zf4BNPXKalx
 Lxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3xXo7uEfnssBd2qJc1byWG62BsG6/FNbHBXPbd40q3Y=;
 b=NoUHJzaTWFYFRksdq/lC4YyiYNJQ6nPju9A5Mxz8H3NSIiKTEWuicyRaMESv3CPLtz
 GWm+HCxlaGnRdgtEx2Mj8ydYeM8+37Ah8b1ZjHqM6jdNhj16K8FzZhGMcv1RkFrYrV1p
 AcNdfXMdlDrP8l2ORK4wXsFiLNFAKcN4SxuCJsLxWXXWL0dnyJGaE3IM9NOs3U3xl4zb
 Rr6noPHMJFyU5YLhMt04N9i93ZxkFKkGQAQJbuQ+FkShIZeLPOO+XGLyGKhhl9Vg6cdR
 4nMmwrcSzg+WE09jaMWt0BEp/Z+Lq6rjXMEF24MIMhMdPC9vCc+JchqMKTigl1BKIxAI
 soQA==
X-Gm-Message-State: APjAAAU2tdnOq2iUEj6IuaaxKQkVDhbLq1bMzblyjHlbrwGI3eFbkrPg
 Lf9K9d+fgDShbjpsETtMwH8f0WVUnho=
X-Google-Smtp-Source: APXvYqz0ele9iDpD+UiUj4JcciX/2SjccX+Fs9mIyP2pNmtnw3C6Dt40OcOHC2rNMcVmA61rO+LC6A==
X-Received: by 2002:a17:90a:9416:: with SMTP id
 r22mr2871932pjo.2.1582690091589; 
 Tue, 25 Feb 2020 20:08:11 -0800 (PST)
Received: from tee480.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d4sm604681pjg.19.2020.02.25.20.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 20:08:10 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 01/14] powerpc: Enable Prefixed Instructions
Date: Wed, 26 Feb 2020 15:07:03 +1100
Message-Id: <20200226040716.32395-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200226040716.32395-1-jniethe5@gmail.com>
References: <20200226040716.32395-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, bala24@linux.ibm.com, dja@axtens.net
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

