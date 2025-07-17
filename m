Return-Path: <linuxppc-dev+bounces-10283-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 767DBB08AA3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlZ3mW4z3bnJ;
	Thu, 17 Jul 2025 20:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748378;
	cv=none; b=MTyyw/em+MHuIwnvpn4EmbP3vjYIy8oJ85Bv9OoflzMurMn6FfM4qMrIzDoerlvlXl21W9BtW9od/e1yRGCCXeCfvX2eEGv5UVILl977fHtIpSPW4mFLSW8fOKMZtTqTUz7+GG1CQe3bowZAKFi7UhHnIU+KohjgunZrR9szabbClWOoGu/vwJBY6VPhP6XsAZTIWT1g/heOlL6k4lAO4by5U6zqswr27pVbdaGlEDF47X9IphTam+VDdbMDPIiJbT00k9TgwHgGMr2zhB2i/qRazzxIRroN9Hp2t8oJGc3JhJSQRszXhSjzfxLJiNJyG2GcGhWWEQUGSo3wjiwZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748378; c=relaxed/relaxed;
	bh=3GoTBLEmLxVjzP5x5JCQ9EAKICcOeZGsg/sgJv78VUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSGYnlNXfPHSpEMieOhNlfVeYE4uCn+0NLHDEaZHSXICze46f8u8yoxLrvRca43XSKw7GgS0HXXNpZzUdRfYBqkxcqfQTbQWcu+h0E0muqvJrJe+4wA7A4+XvY2CyChwdldiq8zx0P4Gi1rvZxumJp1P90JohOO9HlzXWiA5ioRsSbcnrS38h5aZ5FqlP0jOGqLOHAabybw5t3d2TbYZPOADf07585bJJHtxVKyRj3iqYvHZZ2sMgaCoNvgnaUIxhFJAJ0uIntUMdcszi29jfbjUbmAPEwVuD6z3lIycZdmpfmjtpXv0c5cC7JO5jCxRCZJ2SpUBZ3qSigMiJVYjWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ur//lWaT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ur//lWaT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTlY4kPtz3064
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:32:57 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a548a73ff2so761283f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748375; x=1753353175; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GoTBLEmLxVjzP5x5JCQ9EAKICcOeZGsg/sgJv78VUk=;
        b=Ur//lWaTxgJCYBFPdcNLvcnbQrrHyZslWS0PgPR1RYBJhLdpgEdMthCaX+SC3Q9FH2
         HUJXSLaMYJndj3R4s8ZvNynLIvt8mU/QkPYDIVycPIocAX901orUU03eF8nulAEtZKmv
         iJHgcE6Jl6mw9fLBCQ5lSJCLZzuW2Z1ZcRsNBe49EYGNVHEQxe5JEo8N9oxxYysRtPVF
         OvEXUNdn8Q5r3V8rDYlmsqf+cys1Q9xCPdK+RdqeYV8fEp5ApdbWFbyebqXApScT5uvY
         zmrt/p5RHi9ypzlId358MtyQoi6C0Qe/Obr4F50xsJLNg7KpK/6V2xAtQ+stCVK4xair
         LAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748375; x=1753353175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GoTBLEmLxVjzP5x5JCQ9EAKICcOeZGsg/sgJv78VUk=;
        b=Qx/77drdjj+3K0HKeXNNV3fxReE+0QFF1GsdLeGCzjuyY5nJ+UE1zuaj0IlDDrj4pc
         tJqADLvhRyIMnBqGZ1lxo+6bEKMqZSNzJ8DIH28y0o2DCbUWl+HXh9g2eb+Cx3m1Tjso
         jWP5z5AGW3fvfy6xO0pefxrrpMe9/osgeSjwIJdEeNdufpDwXzg92LulxFn+FiEPm+0T
         dDNCUZr/9dA15N9gi0KvNwobdtlPD4021VyQ4qVMB8mJwZN78A8A1eDhEZwUmhkpgVIe
         tdtouhXrHVC5CpdNbqEqXdRBqd2lBuNi0Fokl/4Sr1g3jhXCvK/8reupqTwPR0V1iGs7
         s3YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNPm7X3D3fjjf9ZRqiRVIr9H39p/1Lr1stJ5E/w/k5ycLm13Fhv+2l0mH+V73KipYQHuaEEPnUH3a7AvE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzQRRBD1blfD6H9k2ddNDSjPSuszMv2NK9T2GBImnFjL6UVR2qh
	UDtj+AnMEWJ4WbhbJ3qcrDPL6s3UJkTRl0gb6l171aeXUIwnQL4Rf+tb
X-Gm-Gg: ASbGncv0yrqguZlKtysLhGTB+dMEyr4cNWaPfHdKse7e5Vtg/JZhxudGjyYWeVjXCKq
	xE+OymMRQF3Y7TgFIUNKHeOuW0agWGh7bZXJhKx38a02H6d7Wn8IYwb/HyEEBjAmfgE0rf/lzOa
	U4+UrnOR+F4unkvQ/pRScnONUy6nfwj9AhGOoJvhj+FOs3+FlbkwfhGvG0qO/+J6lSaKvrtqbXZ
	ctKaZrttdA4Wo6WcHXT4BeslRxqBEVazibiwHpx0o7S7Kt23sqQXEFllBWQ6kRaewZj+NAFAwiA
	i0PXZ7cPYN3iT5IR7WYfhHKcF9dVNvIy506rx2HGrMi9CS8LedU/Vx7tdXj9j4h3xjM99ytr9pt
	ie+4hgPEIfZVd8AACLVSHVjwQb1YeD8B40HTlNtCKHmOddcV7RnQ76nrqFGGFY0IH2kzoxINJcY
	HrKSfx/6KcSDnd5Q==
X-Google-Smtp-Source: AGHT+IFzelVEVcHZ/OEffn+B3ZOPH1G6XXdnoiZLhN8P1cfO9z6/oEzmEO+w51ye1sA65QFg9m/KUA==
X-Received: by 2002:a05:6000:2d84:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3b60dd7d98emr3809652f8f.46.1752748374338;
        Thu, 17 Jul 2025 03:32:54 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8bd163csm20204660f8f.4.2025.07.17.03.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:53 -0700 (PDT)
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
Subject: [PATCH v2 3/7] bus: mvebu-mbus: Embed syscore_ops in mbus context
Date: Thu, 17 Jul 2025 12:32:37 +0200
Message-ID: <20250717103241.2806798-4-thierry.reding@gmail.com>
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

This enables the syscore callbacks to obtain the mbus context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/bus/mvebu-mbus.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mvebu-mbus.c b/drivers/bus/mvebu-mbus.c
index 92daa45cc844..1f22bff0773c 100644
--- a/drivers/bus/mvebu-mbus.c
+++ b/drivers/bus/mvebu-mbus.c
@@ -130,6 +130,7 @@ struct mvebu_mbus_win_data {
 };
 
 struct mvebu_mbus_state {
+	struct syscore_ops syscore;
 	void __iomem *mbuswins_base;
 	void __iomem *sdramwins_base;
 	void __iomem *mbusbridge_base;
@@ -148,6 +149,12 @@ struct mvebu_mbus_state {
 	struct mvebu_mbus_win_data wins[MBUS_WINS_MAX];
 };
 
+static inline struct mvebu_mbus_state *
+syscore_to_mbus(struct syscore_ops *ops)
+{
+	return container_of(ops, struct mvebu_mbus_state, syscore);
+}
+
 static struct mvebu_mbus_state mbus_state;
 
 /*
@@ -1008,7 +1015,7 @@ fs_initcall(mvebu_mbus_debugfs_init);
 
 static int mvebu_mbus_suspend(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	if (!s->mbusbridge_base)
@@ -1042,7 +1049,7 @@ static int mvebu_mbus_suspend(struct syscore_ops *ops)
 
 static void mvebu_mbus_resume(struct syscore_ops *ops)
 {
-	struct mvebu_mbus_state *s = &mbus_state;
+	struct mvebu_mbus_state *s = syscore_to_mbus(ops);
 	int win;
 
 	writel(s->mbus_bridge_ctrl,
@@ -1069,11 +1076,6 @@ static void mvebu_mbus_resume(struct syscore_ops *ops)
 	}
 }
 
-static struct syscore_ops mvebu_mbus_syscore_ops = {
-	.suspend	= mvebu_mbus_suspend,
-	.resume		= mvebu_mbus_resume,
-};
-
 static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 					 phys_addr_t mbuswins_phys_base,
 					 size_t mbuswins_size,
@@ -1118,7 +1120,9 @@ static int __init mvebu_mbus_common_init(struct mvebu_mbus_state *mbus,
 		writel(UNIT_SYNC_BARRIER_ALL,
 		       mbus->mbuswins_base + UNIT_SYNC_BARRIER_OFF);
 
-	register_syscore_ops(&mvebu_mbus_syscore_ops);
+	mbus->syscore.suspend = mvebu_mbus_suspend;
+	mbus->syscore.resume = mvebu_mbus_resume;
+	register_syscore_ops(&mbus->syscore);
 
 	return 0;
 }
-- 
2.50.0


