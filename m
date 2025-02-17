Return-Path: <linuxppc-dev+bounces-6274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B6A3895C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 17:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxSxT24vpz30VS;
	Tue, 18 Feb 2025 03:37:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739810253;
	cv=none; b=RO59XXtoJ3K6m029VrPuIz/RUkqyc/oPvt1vZalohZBoHKqiAqO0HDea5VSYphFmlJwyNvrI7Y5YG4SrscftOgbKcP2pVdB96bgJj7sFw/bZwKdJy4HJVHfBvNAbsGPUL50dAWGG0BB5S1Bew4ZXExeXRTvqZL91T/Z/l3e60E0g71yqABybpsW9jMy81uhED/K6iCzkOBbCV0aPq6C6o2GIXo4r0qlYjx978lgB8atjvJHsgNHRL1BQCezgyzHy6zr5jNgRFh9DgONDkPRdySVfvgXsvumEACgnymqHI3tg16lnJ060nxLmWv3GHxhFNUmlK+03pjjfKgHno+TYSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739810253; c=relaxed/relaxed;
	bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwJPI/xVxhxSeUf+SP8X/3dKTl483yrtoQmDb0QAFhPuxSfqUhiPb0L13FnqkCajKKNo1irHvHabWr2nW4/nCIS9fxwoYqr2NXG2U2IAizIWsRZa24zqrZ+jDoFaQpho0gSL7GReq8AEnO6i+TVZ4s+8NdQImZGTnkjebKksAoYkltyRhp8QTqtQ8ONT7QwYBnE71OE3bWah0DhZWqc4ZCQr3uDYjiBHZmzPzGq1j36bGXTzYO8mePhJjQrSnUasq2EJrF8onFHw89CYtfjRnuDdsyBh1L1YcujIUCELz1e286fm9R8lzQNHtloddaIbmSCx3UralqPs5vMGIcmBpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I27cyDTj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I27cyDTj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxSxS3MHsz30Q3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Feb 2025 03:37:32 +1100 (AEDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38f378498b0so1580306f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 08:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739810249; x=1740415049; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=;
        b=I27cyDTjO28iHb/UJlFeiRic7rDQ5ltO3GOo3OfVUEXS1rNDObi0fpSNwP7rABAdQc
         zQbjbduAl+bELJbeGfPiKf4zgBTDRkfax/P1yuoNfyl4cxZqjn6za0aWiCV9SmM0p8F9
         wNrvarUjYcqqQQiFXylelCM9lD6omYTvTdCS/sCdRxrELf1Wmr7qCf7WQamCSnE7vXYA
         JzlTr6Vy3ENB/BEaFL3BjZe2M1daevQiqbjkul+w0HK4ZVNIZLTEOJ+1TlV6c8avoMGl
         pZEScO0dAyoaWhs097L8a1SPv/5Nv5Nji/m2kHC45VFx9Urk4skn94+h2RPdT0CFqavV
         gHng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739810249; x=1740415049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Pliae2eQBpyDaB/rhM+Xrce+n5H7ftTZ7yML/5v4Q=;
        b=gwUzuRe95Zzir+AMlh4GBjBDNOQ9sc7KgbD3F0RnEIm7wbBUMZvCGtJEcJ1EAh7o1s
         v0/yyUwOW9sxQ03V4IY7t2o/oFBdgcfqVx8fREptoBCFAi1P/AnZHA2AUdEYOlKOJJjk
         beUZ9lZsOwXtGoah2pKW4eas2dxIm0Yxsa5YVmZKpB4UyBBSd4KjNCrbv7CxTdd0kK7j
         CrXl86jsc8WRy08QiU5/+VINSk9lif/kW6liGlEaU3T0KtFqBAu43EcOVH/55Q20ugrH
         5VZo6Rq1bo0txtyBK8iZX5BmiATZ8AykEE88quGdAC9D2Ox8glWS3aq6VIBGXIPNJdam
         nV6A==
X-Forwarded-Encrypted: i=1; AJvYcCW5ocMZcnJu6FQ9phs2UHL23xmBnr1AeUi7KTjK+yIwFxFtCFsBLvcLJjSeFc3Y7dx9euLydOzrc2P4bo8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxbmWfzAgEyybxS7aHPz4CCzcXieoAia34tjIYpMKRGnqbQE4ZX
	b2qqqxhpKDhYARowjdEu7kwoib13KxpVfeJVgpUT/vdyT4INEO2k
X-Gm-Gg: ASbGncs5idxu0jSKcK8spbfsM4E4zwErtGYWVVMYfDj7ejlTSMW5XerZGwlh51QAviO
	BgkLM7zMDzYA8iJP9LP7l8cVZIiWvynm1U9urEr9OW/oEt5cM3GPEfYnRqz7wxm42ZcVazucn9X
	ypP0McTDooWZaHXgDhX4bmmk36iqQ7PjKHvXBtxX1KlX9Lo2MbqUbm1xXQvIqsXZXsVraEk/vZv
	oMjQBGOgAi7y6SgppezE/rhbTN8SxUam3pf3Kae9530fsJpIFUZs1gvmeBTnWQO8kKZi3qXgpEL
	A+n9Yb7wPoNY9SYKRJPbikJyoYi++w8aPhBmAH61yEQTI0zHI3sJb6c17AlHqFjfwrnfBxl5buH
	5BHGxfCk=
X-Google-Smtp-Source: AGHT+IEcmZoV9E3nZ+6g02c1M8tS19/XgVVrKGZ1S0RbQ0hvdrhxp+y24wkbvweGnlTFrgLbDmIhiQ==
X-Received: by 2002:a5d:6a0a:0:b0:38f:2e78:450c with SMTP id ffacd0b85a97d-38f33f2961cmr6950160f8f.19.1739810249186;
        Mon, 17 Feb 2025 08:37:29 -0800 (PST)
Received: from localhost (p200300e41f22a600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f22:a600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f259fe1efsm12791371f8f.97.2025.02.17.08.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 08:37:28 -0800 (PST)
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
Subject: [PATCH 4/7] clk: ingenic: tcu: Embed syscore_ops in TCU context
Date: Mon, 17 Feb 2025 17:37:10 +0100
Message-ID: <20250217163713.211949-5-thierry.reding@gmail.com>
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
2.48.1


