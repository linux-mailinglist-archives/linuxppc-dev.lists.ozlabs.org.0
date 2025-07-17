Return-Path: <linuxppc-dev+bounces-10284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4DBB08AA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:33:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlc55Tnz3bpM;
	Thu, 17 Jul 2025 20:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748380;
	cv=none; b=l28i6UrjHRyWhtEAt9enfAEygD9drc2EOa66n1xXqCrVmGeJgEf23nV+6i/rjxxXN5XUV6/0uRiJx1shaoAaDCs1bnccPpQMrRCQEWRGE/jKDpXKhh3bbbT2el5ON9Zsx1pJ1gwrsdIWp73WUQwCOYTBGLc5XqGPnMmZ3zB3CbqRJfQJgr5qNQAzvgf+2IualdupTc83wUNVQBXuCdvsXLE1PhZmh6jUIGNjO/Iv2bkC+B09/aoQb3OfPhIP1Z3AHPIzZr2C09DLEHX+bkHGhGs+rdhXVC3d6ivxNSRjc+DIU16cWE8h3hQJxWsCn8tgXleTGSafqaH8mU6BEK9Eow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748380; c=relaxed/relaxed;
	bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7FCMng+yOhG+D5mZ6qZ35sZLdqIsnMEVkd9O6T5OIYTS+k75jl2EAXsv5q+kuB8RTYuyZRGmmjHD7Z6/En1ioxi9BxDfWV4MwmmGkHKmchxl6So0j2yEunJ5rSHzEx6fB3vUMX8hKnB6o7Gau8I7D0VkdiHXQx7RmiMKI0n8evTScgrg2fY1/eGWHgeuUmovwMTF7cZwMoyhr5LES/psDbjVapljHRqrzwRKrkX2Ghk1z1Ubkk06If9r/Ob/P16FYZp+grziV03UQHOuQakiyC2rD1K2uzeXidJiSYBFGlyLkNA6mDCcNBHe+JARED4RiIVAOrQn2AAX7HyyM+9gA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UvmeckbX; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UvmeckbX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTlb5VxFz3064
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:32:59 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45622a1829eso2576965e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748377; x=1753353177; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=;
        b=UvmeckbXpoMxcEY8otRnVdCL40J1tjgEPPdKBdDmnxcB2/YVmYce9DvuW00XsGulk5
         coV4SL1DHLxTYCeLK600YNCs7sxuMNAKIFmfCKK6Vk/8XjBEpikkZPAMBziBI1BCwDrt
         b3g21rEOyT2Dvbuj+nGTSO6zsCfe4GjAUYQXh/KGI+RgVqV/xWSusv1bBclFVJ0kKoSH
         fIA4DTa9eC5IDSNdvyjskQy3oLhFVlmxDDJPE6mt9XxWq8w3kzUCikfdd9XFFxE/YSPG
         RpZmjuklQIOxrIa3psAOAcNOX+chO9KmzvI9gdwTp1r771kcAykTi3NxuwQ1ObsEh/ZW
         9LKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748377; x=1753353177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5KTffJpKMpn8uJ1Va+yFB5k6/yxUZURkt0Rt5PLMCHI=;
        b=LhRfRzEyQt1HI9JjBM7Q/xGgLJCc+frOEmdG1lM7fPPq7+4IMrhf25bKFlUnWy2jNI
         g1wEwmCOikxbJ0L1ESeXALDQscep4vAFkfZSQzhotHFnbxHbeloZgtQjqG1Gbg9K7EqZ
         C5dOnj761nh/s4QbNX+mXeRPkY8rmutKtf5fWhVn/heWiusBckZ8h6nJwJRLG2c6aNYz
         6FtHh0exeaw9SBcB5uX5GwDZy2DbRJ42pfGeTuvUo3BOXCPtyepOjKRSE6lFmUEBEo7y
         fjtIrJzDKvByUGRvy0M0n3VLdvS2CosmsEAYt6OYglO2tw2+jd2ra+vZgMHIBx+hs1Su
         a5VA==
X-Forwarded-Encrypted: i=1; AJvYcCVZgpcJK+Mu5wGrtVyo2lWZb0V2MzOc5MHaKDvkW5VllJbQ6zzhjucB82REDVQYyyNljxHVHJEfiu6QfPQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7sWbxQJmE0lyd2zNcBV0VZgoUe8cw/MWEuKlR5TRvRit9se0B
	JB6K3y3c6RvRlnIxV2TS3qQR8hoxuCCVYdMWlRFqXWpbhcRddrZv83tQ
X-Gm-Gg: ASbGncv9SB/n32KYWfE01coT4mmbWQAnVwbIpUowFaov5Je3RNl4VjyFBaEL4Z5eYHm
	2Gwb+HFRuN5FmvUSrcQakkZynQAPYtT7KpNn0h7XYDeWMRhShSoi2Sl7Y7u/S9keDcsAJJgXOr/
	VfkrEvH1OaYyIomHMaWm85MY2WNg6VwqCTjs6eX030FZ4Q40U10icW8lIgFbRPSQEo1rm1DeZYv
	6c+hSG3fPvQmMb4LJ2kQBfIfYQdMTShippJKFOt2BOHX8BlJT/asTzTckYJ+46y1MRPmcp1dwuB
	n0CtrG0dObqtBFlGXL2vYRRzcStW2p/TIh3OP60Pjtl9F7GiAxcQRctmFx8UHAcW8LKYdrOEFGE
	Xzg0U8ZCDQ+AFkIPCNnt9gkt/nRI2Dwx5VpKuG/YfSuAZf5hQ4+k+8mmq3zgX5FMGUtxFJpo1Xb
	E6xELBbRdUcxaNbk5XvuLTWGNe
X-Google-Smtp-Source: AGHT+IHc8vQXtNpyThvJpHCdFDQv27nKu7NYwqVFIiEhHTf13nJ3NAM+LgvjkH4nGyp8L9aYlCB8Ng==
X-Received: by 2002:a05:600c:5246:b0:456:207e:fd86 with SMTP id 5b1f17b1804b1-4562e03bdf0mr74830065e9.2.1752748376435;
        Thu, 17 Jul 2025 03:32:56 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45634f4c34dsm18373635e9.6.2025.07.17.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] clk: ingenic: tcu: Embed syscore_ops in TCU context
Date: Thu, 17 Jul 2025 12:32:38 +0200
Message-ID: <20250717103241.2806798-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250717103241.2806798-1-thierry.reding@gmail.com>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the TCU context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/ingenic/tcu.c | 54 ++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index 85bd4bc73c1b..503a58d08224 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore_ops syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,24 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
+{
+	struct ingenic_tcu *tcu = container_of(ops, typeof(*tcu), syscore);
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +448,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.suspend = tcu_pm_suspend;
+		tcu->syscore.resume = tcu_pm_resume;
+		register_syscore_ops(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,38 +477,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(struct syscore_ops *ops)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore_ops(&tcu_pm_ops);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.50.0


