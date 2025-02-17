Return-Path: <linuxppc-dev+bounces-6276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA63FA38963
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:38:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxY5mqXz30W5;
	Tue, 18 Feb 2025 03:37:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810257;
	cv=none; b=LO+KdjngGDdiiPnzq4lKHr3EO4XfqP4QHjUwIzh4W/N+rqlbRGUr2TtcRkdJxOlwMPffwddXmGrLnUP3NBCQbwNvj176VYgvB3UBJDKGyQ1iNvq5pB4EVOZyw1WXk1p2LXRodKW1FIhQFwTwjo9+QhoHflFsjZh/G93I5JtFWB4/YJBzxO36BRgKLnF9qULKCuW6Olr1n/vQa9douqsgw6Thn8qOAKzku0JB7iRz79xIcY0PTx0nCG5bs/LLJeGk4mmpseas6ZSxd+bTAV6klEOe5T4KZ4MlxsTQjmgt8kjR0UThNEm0XnyLMTX0E1DUTunQItwODUqReUopwWpDbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810257; c=relaxed/relaxed;
	bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PAkAOLp58ru+DVkzLUaghOxktXf6G25tcrYrhAdIdN2JKhny3OoR0dJ7S6CT+ACwWpnwgk6FHxLngxBMU321i30HCAaT6sZbNeIwrzjsUN7wdXatJPqTcCf83Xqt5gA3L8vqPbPTJoOVWhUKK0spquoxxfTgbAw8LdQPwdRaDXn0jNDJPswqJxvQTxLhOB6ZL/rIu1wrjzS+V0j5y7qwOS45+5eWR98uTTQqlJnouNbmYacKKbnCXHrOU+eSeFrDV6+miVxElyR/7JbJaKGeiHc0Uwbu+J24pzzvhnrT7K+ECPZd4XGYCsnYFxIXJPN3NCHe3az2+HQHVNHkOIwPMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YdE07+ZF; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YdE07+ZF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxX2MyVz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:36 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38f22fe889aso3587145f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810253; x=1740415053; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=;
        b=YdE07+ZFKw3VjWMw0sFem3bKdiR0iaq5xjoVjc7sCyjw+ablLmmoRHpGXpUNTjFERd
         Iq1rOKhNC9/f78U7g0iVrVnEfDmsMq/ZJP0TOpoS03jWxBbacHFKoXQb6jDYVvT0El0J
         sZx3SYlOPyGjnhkAzC5MuNQsQShwXP094MNLRiETslvr5Y+Wnt3Hev142/iNa+VEDUHl
         FCHqPq6pcENaqgVlbDSOuJ5AECRvKGVXql75377KK+4Ey0OZ8L3GisnNIDB3ZyqkdiaU
         gi8sOH2XKabx3mW+UM+/6yocTk50uQR1Y7LX2urhu5xFmuRWduGFI7YEj4crXOIcpQY3
         Idqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810253; x=1740415053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKpi0u6vaUnsrplCnc00ydxIjOGnOYCvPvGm+BeJUhk=;
        b=OwAayKqjOedmO3afCyk2Kmwg2qKZqZ5m1Dj8wEHkw2MfYpumKHNH4GO/lyzoA+jv3B
         mvjGttxYBUBONzRq3J1QTyeoniN9lf41lrWWr1tOnic9k/HN2LKXm05BxI0BhZyhbWfM
         jbtQMd7PxpRQx/krIki0IUrbnVrLTM4qQ0qNjJLovSLWOJDNgrFpmOWlxI2lJR8SH2lx
         ZVZIQG+LOiF+HRi0CcAs1nLy6fDIgCOgmNeU8/CDVK30kXHrG7d44w8qUCLD0lKSyaeR
         P5zt46LcdaxUfpq80vKIiJ9/R1ttqL4NIndiqJUnvZ7WKTUfyJOmWOwAooVEIV57TDDZ
         csyw==
X-Forwarded-Encrypted: i=1; AJvYcCXZETdaUdSLJE+x46ebUv0QkHS0GJhyv8+TazJieb220Te1xKLCvC2MRvXHkYqrhHRMK/PeAuPHfRGX8h4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyCweBHlTiXsHYjpAhRcVSkfLCIQbv16PfJzPZpbikr35cAjMyS
	Sz1d/MX1xBSJm+KmNVshRfW01wiLbztVO1pVdwal0A1+O34kU+OS
X-Gm-Gg: ASbGnct97FVEenKpqgBKtYpW6wCQbJXCR6mtvtAlyxmcVe+9TkEVIALUcNKWFNwIO9y
	A0pUKtzA6mAInlghEFFiPYOyucCKt1fX+wk0FsoH8TPY42kPcmPCF6BIQd+gNqU1ht+CD0KFffg
	x5RbiiDd5klFUOtCNeGo+CsRpEU3U4J04MaNjftbtCNq1i/GYCmq9CePZ5VTrO/OoyPftLPajip
	JqTg0BLA8/LAR6uGcuVF3GAVwEesYMvGpi77/c6ykQsLph37oUIyLfr3TZfNrEmeWBVcBfNlb0E
	9xYkiu9v1RD0sm0bgmTai17JKg0Ar9Pdn3OiJmeEwbPrNf5Qg2YIrNWjVQPGp6nOQUseUQsLhfp
	87RkQkqs=
X-Google-Smtp-Source: AGHT+IGTsVCL+NTHpDgAjbfPGCf82Ky2fpMBBCHIOPIzC5FN2MM8zcjn3L7PrIBL8Fr/RKV6YFjIXQ==
X-Received: by 2002:a5d:64c6:0:b0:38d:cab2:921a with SMTP id ffacd0b85a97d-38f33f1249bmr8380187f8f.1.1739810253132;
        Mon, 17 Feb 2025 08:37:33 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259f7979sm12509797f8f.83.2025.02.17.08.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:32 -0800 (PST)
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
Subject: [PATCH 6/7] irqchip/irq-imx-gpcv2: Embed syscore_ops in chip context
Date: Mon, 17 Feb 2025 17:37:12 +0100
Message-ID: <20250217163713.211949-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217163713.211949-1-thierry.reding@gmail.com>
References: <20250217163713.211949-1-thierry.reding@gmail.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled
	version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Thierry Reding <treding@nvidia.com>

This enables the syscore callbacks to obtain the IRQ chip context
without relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/irqchip/irq-imx-gpcv2.c | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/irqchip/irq-imx-gpcv2.c b/drivers/irqchip/irq-imx-gpcv2.c
index 83b009881e2a..61ba06a28fc4 100644
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
2.48.1


