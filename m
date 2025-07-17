Return-Path: <linuxppc-dev+bounces-10285-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F6B08AAB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 12:33:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjTlf2QzHz3bqh;
	Thu, 17 Jul 2025 20:33:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752748382;
	cv=none; b=EuZY02f+HexxqDvL7YMHWMrhM3zNnBG9MdDh4Q5lJO/TbfBe+9xXaq9UrX8BFNW9EeMT8Z3DmhgIHEj2YFgVUvtFV1gs91JIF+WNJYQbTyak0+WsQ2/RYCoai2MMqRYdh57X8RDsSvkzBhIWmtz5njKu+eLSw3cfO2nh7B8cCAsWs/plWO/xNn5XivvXXv3rOFEa6SfRaloFP3cEAPTJqTmlY/sokN5++erNu7df1HzPauGcR7myZ6JkhwjUfYXbmEqDuwyYs86rdoXQUiJBbOoEf7rN/6pm06iBSjPefvO+G1mH1dnihfn1G3O8ckVfJ7p1xIdARLz5QEY+AK7GNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752748382; c=relaxed/relaxed;
	bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnbBJp/YbdEyUMAzxcy3fe7kloa4ndaW2cL26HZxVkTK5/5d3Y80bEIbGuRPwH9asC5hVYXbL6AJb7ei71eNKzR+RqPunItKpAPUzjoKYU8VmUeKjEIqL7v4zrdlf/zHyVi3S+pN+6Y7yll8+w7gYKMLXWixRvaDltcQYbu2yt7lx7KtPIO+RIhftFzsKffXbqRz+L7fSoSa9930TBoaLHX5/R/x5w2q2ZP0pwjqhXsDBmmFvxyg7tCRnANyLFsMQBqE4Buue0S1lmvX1CcXyZVw7HQr5ElaHdPy2NwDpRasLfakeZM2JJPJUdvJ14Psl2EOievGi54rRsVfR8+1HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lw/n5vPp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lw/n5vPp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjTld3Vt8z3064
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:33:01 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a4f379662cso592779f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752748378; x=1753353178; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=;
        b=Lw/n5vPpBq5hxFaZIjvqgdqZoCddXyZi+ev49boXw8Ei2FvOKZS0fPi3BXXMy2hRFh
         6ED2SWTPHxvgOO9VgAbntM4F7vD6kCR6yOmOdrz6Fc1v80ypCbccu/V/fCVISN6mlHF0
         t/SuaxYDoAb412fjBKpSmlVurbzKrn/JvVEPrjs7EzV2efNdixjRtdQWe2wZOQ8FbxqZ
         FfxJ6AViYdJnfMmAGM3WlwVlhrcjn9lp+dqj0J3iTLcu91z4xotthFE4FHcJuL6opgVn
         PNIvjOMWwCSJdwsEN/Me4uOLPaNMJRDXjS7RD88pz4wXB7WYcH/D9lzrWCBAuniC02Mc
         7Ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752748378; x=1753353178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAFLXGS25z8S0WanVyIjmw4Vp4se3d5lBR+FdNubaFk=;
        b=Ws/wg12Uyh7Z1SlE3ZFAELZwtoCWDXh1ofdWwTIMc4kp74n6MrOWoJ+qxtJnu1HSYn
         k9bjTExrbO/6C3/+I36BCZ+r7c/1cTjI7kVVhsBbpy409UUhWfZWKgpdZ8u1xuljmo35
         Moeml4gVoJptGdAIxX26PbKx0y3MSjipdD+m9SqB1tponiKUPlEn8gAHGmKMhIH0K8oL
         43M5eyTnd7UNjjssW1HVmdUzNiytRVy/WR3A18hpIMjbvuwlm0FIfQRVXHfkr4TT+59J
         OJg1Bjm8MFgaDKjLrLYTs7e4H67i1NG22a8P1Yqszv8piuEDJZjxEH81okSdtqhS3woM
         Dq9g==
X-Forwarded-Encrypted: i=1; AJvYcCVz6WN9WB3qgZ+X680m+ndDKJH79i87mlMyUFJyXDjOlWEqUeIek1kVCL9t2bP/fTXNB0foIPUMdN4H+Mo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzpEAw5oxy1Tf819bU7e6n8TwYhcdgaMqyB1ExVBJPsim/aBpwo
	vEr7POi1PWId33/n9QKIMzp2nSWwXknC6GRQ0eZ1kC2FOz/6Je3dJzd2
X-Gm-Gg: ASbGnctUFVi4AbHWaHlh6g/mamwNff83yyNYlz/odKrBD51JFiSkEIDju/CiJmgMZMb
	CHV1fnrwVhhzDicSqFcU60F5xafnFlLc+56N2KHLhi3u0RodboP6dzlQD6Tovn7FxvqNttqX848
	AyCyQfz28xKAITtzFd3dwsmjRdrD91bISWZSz/bOb2MQ+tNQaS7xxbdIv//Ul0fgytCIHiZCQMG
	uxiHSeE/UHUXClxqYWdi6irgC3jkyA7gDJy7AbOt464tfzjmJrl2wy/0Yf0Aj5C456dG8v9j1H4
	sviEAFG90zzdfDoH05n2g6G+GKmABYhP0kMA6U1QUsWAOwnAC2n6PDjBgQy8NixLny4P3hgyWcx
	4BsRZirQ66Ft7FAnzTYHCdxXOBKv0RilC2iVJu9NC9dqC4w+G4plUXoXTdcoqkoESUuACDkZMBE
	R42Ty/s++QQFYfVg==
X-Google-Smtp-Source: AGHT+IEdwrBNkg9M8guchW0vI+6tEPzp3HT7pxcYs5sGp6dD4O7OxQ4GRP3g0Y8ml2hczWmCiC6jOQ==
X-Received: by 2002:a05:6000:1887:b0:3a4:cfbf:519b with SMTP id ffacd0b85a97d-3b60e5103fcmr4782590f8f.44.1752748378428;
        Thu, 17 Jul 2025 03:32:58 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc91d8sm20127132f8f.42.2025.07.17.03.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 03:32:57 -0700 (PDT)
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
Subject: [PATCH v2 5/7] clk: mvebu: Embed syscore_ops in clock context
Date: Thu, 17 Jul 2025 12:32:39 +0200
Message-ID: <20250717103241.2806798-6-thierry.reding@gmail.com>
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

This enables the syscore callbacks to obtain the clock context without
relying on a separate global variable.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/mvebu/common.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index ee77d307efe0..53712c3e5087 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore_ops syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,15 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
+static inline struct clk_gating_ctrl *from_syscore(struct syscore_ops *ops)
+{
+	return container_of(ops, struct clk_gating_ctrl, syscore);
+}
 
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,23 +222,23 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(struct syscore_ops *ops)
 {
+	struct clk_gating_ctrl *ctrl = from_syscore(ops);
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
-static struct syscore_ops clk_gate_syscore_ops = {
-	.suspend = mvebu_clk_gating_suspend,
-	.resume = mvebu_clk_gating_resume,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -284,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore_ops(&clk_gate_syscore_ops);
+	ctrl->syscore.suspend = mvebu_clk_gating_suspend;
+	ctrl->syscore.resume = mvebu_clk_gating_resume;
+	register_syscore_ops(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.50.0


