Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB0811F358
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 19:01:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZwMn3q6KzDqxL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 05:01:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=tiny.windzz@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ak3fvDEQ"; 
 dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZwD53jtlzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Dec 2019 04:55:01 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id w5so1112890pjh.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 09:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cR390BUd1z2kCitxpdbSxliSXAqeOVtm3C9sL9OzjjQ=;
 b=ak3fvDEQ4v6f6WR6iuVyCDGGuOXR5kV7UcWmahh2teo8P+j98Rkfhsic/vSt4LF2S0
 dG816usghYdayQyFi+h73xQK7mV3WEin9ewgy+4obyVj2YJLKxIBJTgWNVo1ReynM9f2
 dGPbh5KaUL27AYtbMhomIj9EpwiJPMiJrFqZGaR8U8Y1Hr81RmU50AXBc5AYTUAAcu+X
 h34m0JUpuOCbta0deTOnbL3CduxIdcdVoOTeaS4rX/cXd1+cHBmGKmJAfRZMkgReE+eh
 ib0Fwx6P7vvwuE0bkNdrKd7uZCbDlbvAJgyao18OQue/ZJTBhgdtEsEcKmDZssmDkZmE
 2MGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cR390BUd1z2kCitxpdbSxliSXAqeOVtm3C9sL9OzjjQ=;
 b=HWgLimwNiw4xL1I+uEIMQEwHNPHnMyL9BXjQK8RHLK00puMox6oGjtilxqvGH8wmBi
 Qv6M7HKTjQAxSbkMtB1iwuXHRp+BrLjX5TnK00OogADzy6ys4kMim42uWP3alk7S00a+
 1QnfoMnATq1AY32hfwijxofiya9nArtObJ1TmVeq7to248R2WQk5O8U8CxZP0+9Gi0Yb
 y/aovvI6TsBCg7E/cbvKzbORX/vq637JfNdAtif/iQfzSzM+g5yWeL5J/FSxqigi9ZYk
 ZJyjjOrgzEiz+O7eIqS8R6lmNKatK+GzGB5iEC24hoGo62Q4DectG8sfAf+EM0yUJ9C6
 Eb1A==
X-Gm-Message-State: APjAAAXuAAGyn0dB5DpYS5xuOnh8DzyohC+wdgRGQOJ348dZQi/5nl2q
 4XIPr8mMPYD2em8oMfFDVHU=
X-Google-Smtp-Source: APXvYqwoSFUXO6LtjfdNMc8g3OGbieZm7pvHioNceUic/z+nzmqFIdRcPY5BJ/C1CRPZ5uLd99i6yw==
X-Received: by 2002:a17:902:6b49:: with SMTP id
 g9mr6338781plt.156.1576346099003; 
 Sat, 14 Dec 2019 09:54:59 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k23sm15535481pgg.7.2019.12.14.09.54.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:54:58 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 03/10] soc: amlogic: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:40 +0000
Message-Id: <20191214175447.25482-3-tiny.windzz@gmail.com>
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
 drivers/soc/amlogic/meson-canvas.c      | 4 +---
 drivers/soc/amlogic/meson-clk-measure.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
index c655f5f92b12..561044063319 100644
--- a/drivers/soc/amlogic/meson-canvas.c
+++ b/drivers/soc/amlogic/meson-canvas.c
@@ -166,7 +166,6 @@ EXPORT_SYMBOL_GPL(meson_canvas_free);
 
 static int meson_canvas_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct meson_canvas *canvas;
 	struct device *dev = &pdev->dev;
 
@@ -174,8 +173,7 @@ static int meson_canvas_probe(struct platform_device *pdev)
 	if (!canvas)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	canvas->reg_base = devm_ioremap_resource(dev, res);
+	canvas->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(canvas->reg_base))
 		return PTR_ERR(canvas->reg_base);
 
diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 0fa47d77577d..173baa53fce3 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -605,7 +605,6 @@ static int meson_msr_probe(struct platform_device *pdev)
 {
 	const struct meson_msr_id *match_data;
 	struct meson_msr *priv;
-	struct resource *res;
 	struct dentry *root, *clks;
 	void __iomem *base;
 	int i;
@@ -623,8 +622,7 @@ static int meson_msr_probe(struct platform_device *pdev)
 
 	memcpy(priv->msr_table, match_data, sizeof(priv->msr_table));
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
 		dev_err(&pdev->dev, "io resource mapping failed\n");
 		return PTR_ERR(base);
-- 
2.17.1

