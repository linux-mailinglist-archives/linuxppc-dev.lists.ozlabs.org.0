Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC76D11F35C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 19:06:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZwTM6wRSzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 05:06:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OCcdjtzd"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwDB1c01zDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:55:06 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id q127so1191251pga.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v6oAG/oclrFZaQCUj3wJrPoJgy8LLnv+ppI5zjGSg18=;
 b=OCcdjtzdFuDyzNdFRzdJGEK76qLV1wGwcTnhFwUzPrNIPhZ9jWkNZij8M6nrd2EqfQ
 xLdaVpLufWVdsT/JQCTm7lDYNoW5zbwtCZ3JNDX9PBDxZEeDrr4LM94ONhsxXiBoRYSD
 vwMSJnvm2XuH/yOd7dnU9xcj13rrYnxkxAdEB0sheLW1J/ap+GQdqZDSfv7y/fC3AO05
 q8jxfaZssVfvuKTZ5klKz3YaPLhO9FNqhKBHW9Zj8q9hcdEPxDNLOD88YHAJFHlAKzH3
 RmKZEcild3g8BPyIPHduEF8bqveRyYY24EdZfRKUZ+xRhqr4Sbmhg7f/o/Tu/c95uI1S
 whoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v6oAG/oclrFZaQCUj3wJrPoJgy8LLnv+ppI5zjGSg18=;
 b=PLP9duscCvmbKJ2qYq9oKVmNWaaFqWeGuf6mE7nrSig4qeWr5IeOHcMr9uKV05jTu1
 mTjjHARx43ILe6ema7lAXmLqrtNsOJR2kDUCIAHFQ8jHoL1MUhNdxWgeUxwnx9pHJ0Fe
 1foXVeFuekndCnIrxn5Ge8XPvehf1f84VvHCxshso9YqNkxVz+wSb/pxOE/ezRuM1I/s
 1bUSMBtnQ1P8W7fugyCvZurz5/4EavyjLVVwqHLMxZ30Z2iThW2otINdXB9xDbEPDf8N
 uZmQcrnWG0STCgOyxOcsfsclDa+kDka4P+FJVB8PN0hWaX3r+bo77Lp0uf+PMyfpPNsf
 WqEQ==
X-Gm-Message-State: APjAAAXk9Ou+EUJw7RUjaY1THSWll5Zk4DRNgl6WUykREsrwB72gH0Vy
 2uZ59gYNHDVkyygrG+XfKzs=
X-Google-Smtp-Source: APXvYqzpEedmt61YxQUSdB6sRDA3ehIRbG8Z9JBjQgmUFXEG8lTrpXVy3xxhvrG+pkjNaW8TwDq1eA==
X-Received: by 2002:a63:4f5c:: with SMTP id p28mr6565754pgl.409.1576346104392; 
 Sat, 14 Dec 2019 09:55:04 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id b22sm16045885pfd.63.2019.12.14.09.55.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:03 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 05/10] soc: fsl: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:42 +0000
Message-Id: <20191214175447.25482-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/fsl/guts.c | 4 +---
 drivers/soc/fsl/rcpm.c | 7 +------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 34810f9bb2ee..ebec06a22ab4 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -140,7 +140,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	const struct fsl_soc_die_attr *soc_die;
 	const char *machine;
 	u32 svr;
@@ -152,8 +151,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
 
 	guts->little_endian = of_property_read_bool(np, "little-endian");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	guts->regs = devm_ioremap_resource(dev, res);
+	guts->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(guts->regs))
 		return PTR_ERR(guts->regs);
 
diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe6d2cb..322fde95974b 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -102,7 +102,6 @@ static const struct dev_pm_ops rcpm_pm_ops = {
 static int rcpm_probe(struct platform_device *pdev)
 {
 	struct device	*dev = &pdev->dev;
-	struct resource *r;
 	struct rcpm	*rcpm;
 	int ret;
 
@@ -110,11 +109,7 @@ static int rcpm_probe(struct platform_device *pdev)
 	if (!rcpm)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
-		return -ENODEV;
-
-	rcpm->ippdexpcr_base = devm_ioremap_resource(&pdev->dev, r);
+	rcpm->ippdexpcr_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rcpm->ippdexpcr_base)) {
 		ret =  PTR_ERR(rcpm->ippdexpcr_base);
 		return ret;
-- 
2.17.1

