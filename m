Return-Path: <linuxppc-dev+bounces-10286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C68AB08AB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:33:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlh2sWcz3brN;
	Thu, 17 Jul 2025 20:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748384;
	cv=none; b=Qzf84FdPU74sU6r0Gai1RBhbpaR2APCR2+1Zs3mqppBQkZPvRm9drCVjjIjJMpjqL9B/EVr+ItmvJ2YSCW9yFQYEdRhTxwHdf60yqTWy2jnRSt/EEpx7EfURzc+0kzG/79YAVKvQSeFAkfCpnDw4T1DxcKFlcKEHpMWV0B9fM8pSUCFlY8DvpM2ClW7f94AdAaRijT4FREePkD/602eWnrFqWUA71e1pq/XtYiAGeLV8KfYN6jMlmIQD9ifD2W2FqtuJIA8aYMgAsUwRSKafU7slvgag8BYky0XPpGBaPToiYPBm4HdaoWhlB1xfyPLPD91DpRcvphZ+maObrDkqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748384; c=relaxed/relaxed;
	bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PavpZIQlWlac3StV18HSYZ9otSOSGOFeFPMNcIQv44GqPeL3j/K0rIO2R3GlSJeaoydXsMNh0H+8KoX/N/GJ5kWzaSpkIn8VelwjFsF8mm9ZgLNlHYkWhVZH3rbYpI+NFjcVA1P94Sgz3hzR0snHPtOxS4gPNOkA3XTSEVw/rcx5wAtTi0IpwSwqjytTDMfg+POLji+KmB+kWV7OlJZpgNPhqfvWsYGPaT7QjZy4pNuzJ9GXf45XUpyUr4XRkOwqyJf20Omf7gmsVGlaPEizCH/FDe5k5NXEJhoUF6H/gb0574bdJB21UtU10Y6ydEZO5ypyZkljYQLrppNJ+4Cjcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZyyjuNT5; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZyyjuNT5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTlg4pQRz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:33:03 +1000 (AEST)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so412979f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748381; x=1753353181; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=;
        b=ZyyjuNT5gv+FXI1DFliU9lLKeJEO9yXFnOuRcKl1Jfy6rjbY08svztgG6uVstK2hAA
         Lg51wnKYvj0/HetFXZsxK5SSm6juYO5z35jC/cY+4PcyyqOjL+wBZgdECMdGCgxOBa0n
         RLLATDidysysN5YoFR30IgEDC6ILe1DtANtTunhXmcV9g/ZAe+ssGGrj698NLXG17+JW
         Jqbwidr6Z7vn4pndgYN7/WxBexjMp0X8y8wEDBuMPsOJgW8GoMpMkeEj2/G//aK/gybd
         TcTxDcej2Yt8w4Cl+tAFdqreb1t6QVWggtJWG2Utaneyq/ulAnqXN0KW/Pk7WypxfXmI
         XPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748381; x=1753353181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGNFpZqODfmzhJr9aiRrd+TX86pzNqh5cw08oNQmcLU=;
        b=spF9/Wgedx8t5J06dUMecxLKqmUu0mrQN8kwmVNWWsJNxCxq4MIkwS00FUiky+4Szw
         Amd0OY9QtU7WptS3RyQCN5SE/6UrTZUWgclN2t03KUtPqF4tYxjOhKeOxZJZr5oqRiNr
         76X5eyHShT8/tRh3pM1XoKYqY8oos+UeiKiXdFcV5WAYDcJh0Retzs5mjfI6tpwBl4xl
         L/RzakHBLEQ69R8iCMruwwCDAEM2lFAuAOXDBBr2nNgsvNZf/L/LgeC2XLnKtnv0nV1G
         fbDDWQlP5mKmi6Arc9H0cktKxXeIP2TNFwyqY/95utE0kKkzrk1hV2Kkv1R6NPi5lAD/
         L8ew==
X-Forwarded-Encrypted: i=1; AJvYcCVpQXBc68cyCVX23G49oM1+FUXPaS3jjyvz5+zPdJH/uq/h+9K5Zx/o6qWlzR/DakYDSI2RUu/KHU8vdag=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzBY1UVAKxUp+MJ6fAtnh//ym2CZfW1kNprHvHmsgR+nG+q8mW7
	oQ8qq2H8mLOl4TXbi+0cmrX14O9z3YszxXgzQZd/CSyAeUy9JPfxpHhK
X-Gm-Gg: ASbGncv5MCRtrtNLsLTIJL33/6yB8YJIhnWc/kFX8sTplQBIuCrsPLejnKtxSkPeh1C
	7X4QXSnA1+e9ALUhTm5xVeFKtfGsnjQWisrXKQ3j2Wbso5I/4qv1t9uhBGGLvij3BdLKGWPu8v/
	1Gk5ZPDXV+F2o7a/bsyS1eDznOV5YT+8TmO2DOoVzPAXL433J7q8R7l+OSEV8/+dOK+gWj54Qsl
	QxZuA+psT4QDvO7sa56kAGpCHMqF/BT9aU02l32oaXM0GdApVhXBlE7VHHBVlen3ZKhpL2d4gVP
	dDCsjzQie6XXjY/l5193L//n+jPOtLylURvFhKyQHVdxrI813yBQ1IAy1UlVdUN4phiTLejo+Zm
	7syGkoOKcg3L9glswFhXxVZOLH1C9qKXEwQ/WEZgKCTfltKUXXzH68Qk6MFbDLGf/juE+MIioh0
	kvbMXgDT1sJ7Fgpw==
X-Google-Smtp-Source: AGHT+IEJyseOSQ7/RZYPnww/L9LgeDBNM4g6hD4cUsfsALyidX4LqCToCF9T7Owp+uYfqFCAdatHoQ==
X-Received: by 2002:a05:6000:2901:b0:3b6:1ed:9ad2 with SMTP id ffacd0b85a97d-3b60e51b8bdmr5306916f8f.42.1752748380572;
        Thu, 17 Jul 2025 03:33:00 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd1924sm20547938f8f.16.2025.07.17.03.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:59 -0700 (PDT)
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
Subject: [PATCH v2 6/7] irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
Date: Thu, 17 Jul 2025 12:32:40 +0200
Message-ID: <20250717103241.2806798-7-thierry.reding@gmail.com>
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

This enables the syscore callbacks to obtain the IRQ chip context
without relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/irqchip/irq-imx-gpcv2.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index bdee15a327f3..8e606baf3a01 100644
--- a/drivers/irqchip/irq-imx-gpcv2.c
+++ b/drivers/irqchip/irq-imx-gpcv2.c
@@ -19,6 +19,7 @@
 
 
 struct gpcv2_irqchip_data {
+	struct syscore_ops	syscore;
 	struct raw_spinlock	rlock;
 	void __iomem		*gpc_base;
 	u32			wakeup_sources[IMR_NUM];
@@ -26,7 +27,11 @@ struct gpcv2_irqchip_data {
 	u32			cpu2wakeup;
 };
 
-static struct gpcv2_irqchip_data *imx_gpcv2_instance __ro_after_init;
+static inline struct gpcv2_irqchip_data *
+from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct gpcv2_irqchip_data, syscore);
+}
 
 static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 {
@@ -35,14 +40,10 @@ static void __iomem *gpcv2_idx_to_reg(struct gpcv2_irqchip_data *cd, int i)
 
 static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	void __iomem *reg;
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return 0;
-
 	for (i = 0; i < IMR_NUM; i++) {
 		reg = gpcv2_idx_to_reg(cd, i);
 		cd->saved_irq_mask[i] = readl_relaxed(reg);
@@ -54,22 +55,13 @@ static int gpcv2_wakeup_source_save(struct syscore_ops *ops)
 
 static void gpcv2_wakeup_source_restore(struct syscore_ops *ops)
 {
-	struct gpcv2_irqchip_data *cd;
+	struct gpcv2_irqchip_data *cd = from_syscore(ops);
 	int i;
 
-	cd = imx_gpcv2_instance;
-	if (!cd)
-		return;
-
 	for (i = 0; i < IMR_NUM; i++)
 		writel_relaxed(cd->saved_irq_mask[i], gpcv2_idx_to_reg(cd, i));
 }
 
-static struct syscore_ops imx_gpcv2_syscore_ops = {
-	.suspend	= gpcv2_wakeup_source_save,
-	.resume		= gpcv2_wakeup_source_restore,
-};
-
 static int imx_gpcv2_irq_set_wake(struct irq_data *d, unsigned int on)
 {
 	struct gpcv2_irqchip_data *cd = d->chip_data;
@@ -275,8 +267,9 @@ static int __init imx_gpcv2_irqchip_init(struct device_node *node,
 	 */
 	writel_relaxed(~0x1, cd->gpc_base + cd->cpu2wakeup);
 
-	imx_gpcv2_instance = cd;
-	register_syscore_ops(&imx_gpcv2_syscore_ops);
+	cd->syscore.suspend = gpcv2_wakeup_source_save;
+	cd->syscore.resume = gpcv2_wakeup_source_restore;
+	register_syscore_ops(&cd->syscore);
 
 	/*
 	 * Clear the OF_POPULATED flag set in of_irq_init so that
-- 
2.50.0


