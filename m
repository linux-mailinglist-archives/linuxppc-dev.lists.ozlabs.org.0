Return-Path: <linuxppc-dev+bounces-13529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49BC1C1C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 17:34:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxXr83dN7z3dTs;
	Thu, 30 Oct 2025 03:34:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761755640;
	cv=none; b=AaB/HvJ20avPM6gCLntonUtjpsvHAtQlGlPFA4iO16Q4oToIytqCgWFTsjqERItr5ULh5WaG8LCvf3Ar6WHusVQzGg+2sfNtSCT1YHYgfAwAKsvHgrDveDOB0hbsCMh2MqlpHGttqFGdaSo0zPCKCDSYLNA5XOg0KRdeSxdBFQUh3aNF/EDJwmS6F9k3jS7scDFFfGWuV4FKXf9inp3e2Gap71AuDgdh8arA20SgCABYS+qD6y0PAdpE4XSGPOp99F27/gXv3HJdAB0bD/wqJ0Fnoc+EVUb6eNldfUVoVCTehF5Jldan0RONCLV4ZTWFJ+C14K+EJoMIzWEiy7dpyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761755640; c=relaxed/relaxed;
	bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HJjfj+vRLwnkpLbOntQ0s7Rzmt3pAI9pG9jUwbTvop4Rsgq39USoGl08UGPxsylcck0H3b0sjDt5LEU83eOOWrwP3hckBDOBeSQAt6vIsKT67PYIz9Q9NQUKAj/qHz7NwPvEGefDl/QofidW7VUFgCgrbXJkpTwaigMzYAYSKjpyZVshZcZDpwpq1f6BTk/w5MACVyuwU4Ns0ZKi16ID53Ir/4jTtFtL2GBjAUIPyW+NbCUtCgDxHDxFWD/TM05bs5IBt/PQ+VqiQnXWPgnw55cGGOwEWepYUiTnkVNVuq08elckfEVjJRvrJhpnIqwwGS8eO25VyBkATjtS/PYcAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b+Jt5TUC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b+Jt5TUC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxXr73h81z302b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 03:33:59 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-63e076e24f2so6370631a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755636; x=1762360436; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=b+Jt5TUC5LIkqOPZd2Km8AGFAt2t/aCQXffapJ5sYQrRmgjJUI1rS7Buq4cl5lGpLK
         n/2QuJCVXgLbKqIQMiO4whKQvUvWZd+USI4bunzRrc38ndJzXqvTW1tP4CD8w3ZciCbR
         pbACKNfal5VssI5MNX1wEg7J6COdiY8ciFRGEU8dbo1YnxNp8VfMl2nFe1WILlrU/iBE
         lVWhfn0QLvf5mwVeuLB02soc1u0fGfv9/s5dENQU4Lv11g1r7q8Wv+IAQK1YSzWKWIt1
         EzxT6XKzaMY4DgQzFuFYi85v02z24MbE3c3LqHj7zcMYciTGx4gyltLFBk00iMeadAEa
         CT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755636; x=1762360436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JhxpRTp1uOQ7/yJc+0xNuSmcJdpaGHV/pw/kDcH2Yfg=;
        b=rW2Hvebmb2UFZWUKr6tPfKyI6zuG1cpfYDPE2qiIrsjqFm+c9zpigqt2d/YCl7dKxi
         fOLmaFYor1Di6fONu7YrM452eBdRcwzaP5YByLuMvcU+CiVfIEasnqo7JDfSWJrkdxUw
         Yfs4HYTKd+gwyrEdoXcr91OTlFPNrhbKgMnncOiz/EC3L8jIMDoHVe7AJlT2pIRzf668
         ozXKHUW4Ely7QhKNobSpeD/E1l6LjM4HcKeoLEfTeXp8RtYhyOqlVrIDaVlzZ3JbBt2f
         45BeMwIuiv5c17wb0trE9TaLrF4FU3TLwZ6KNMF2jzmBF6CVau/cSfw7F1ghqkT5nzJK
         vgVg==
X-Forwarded-Encrypted: i=1; AJvYcCVx7AKfAZfdrQI9QlBr2qdIri5m8yn+SWB8ZBzqF8aDEoXvpdAo/vsadVByJHvfyJmFDPBy1/61sM46bQI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKF08JsxGuVkjAB4m5rEy6jT6lNMScTkOwyag902kA3YddY8U/
	kpG0102AR0+z08rYHLhLBLGFgCcj39ErHo484QHUoeM0LZ6il1cxugoG
X-Gm-Gg: ASbGncvExTCqAJCy3N8LQ+PKj3CfNIqcJLPftrbzVjhnCYlcDL6G3d+pFWEQkUupi0N
	Ie8JLwBzMNxldZgZehnR/ZwlLWknx8rZA+3x6nSA4W117AUL0LBZkM4K1FFfs1kEz5c8nUrTa06
	CK7OrHGQpw5vIQQY2xa6jV3hZIhriTfjp54EDugtKQwkUB6oQzyBLkeHOJ4+UXSWN6l0qJ9z7lh
	qbMrr8Nta962ZIXs2wUU4aVi4qKWLEcy34n3fPU5FeqGjs9nNQvl6dlUJ0LJqtpMkG+PYmIMP91
	jbGcEJUnZ//v2xG3Z3IcfMgG1SyLyXxmresnbzM8OvI2/XN7oeSkUWBffA0DX7rai6gKQqJAA4X
	4nW0+iAArerre8S9QO+7eXUlPfMnUvpSb8iSzCHDOQWvDBvxEXEZhgMK2JZwmWGKF3QoR7ROi6e
	IgcXRnmYniqLb3Dr6BU0zuj6KbreSf2C/YR6R9PRuTk5QoO4yqgZ5Xrnihtq6MAp/ukyQI
X-Google-Smtp-Source: AGHT+IEBhKyqSuQzRg5+jPbNr1lJJJfXBtMjYTViFyDgVE4pc7ia4Gu9caVkoUUyuihmK5MM+ILYDA==
X-Received: by 2002:a05:6402:5c9:b0:62f:50ff:b675 with SMTP id 4fb4d7f45d1cf-6404437f5a7mr2656312a12.33.1761755636037;
        Wed, 29 Oct 2025 09:33:56 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6404de640fcsm1695354a12.8.2025.10.29.09.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:54 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
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
Subject: [PATCH v3 6/7] irqchip/irq-imx-gpcv2: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:35 +0100
Message-ID: <20251029163336.2785270-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message
- remove unused global variable

 drivers/irqchip/irq-imx-gpcv2.c | 24 ++++++------------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 04f7ba0657be..ebfc659af385 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore		syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,8 +27,6 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
-
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
 	return cd->gpc_base + cd->cpu2wakeup + i * 4;
@@ -35,14 +34,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,13 +49,9 @@ static int gpcv2_wakeup_source_save(void *data)
 
 static void gpcv2_wakeup_source_restore(void *data)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = data;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
@@ -70,10 +61,6 @@ static const struct syscore_ops gpcv2_syscore_ops = {
 	.resume = gpcv2_wakeup_source_restore,
 };
 
-static struct syscore gpcv2_syscore = {
-	.ops = &gpcv2_syscore_ops,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -279,8 +266,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore(&gpcv2_syscore);
+	cd->syscore.ops = &gpcv2_syscore_ops;
+	cd->syscore.data = cd;
+	register_syscore(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.51.0


