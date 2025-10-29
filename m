Return-Path: <linuxppc-dev+bounces-13527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33447C1C1B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 17:34:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxXr35r1Bz3dKb;
	Thu, 30 Oct 2025 03:33:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761755635;
	cv=none; b=M+ydzWhpPiVHpDnGwvMBVHQiJtKromY/PEVC8vuDHC4MYxJvilehNmJm/yuh8f2RKwy6HzD+UdCUpBByLeaLdtLVyWbAyBPcBelEBvTCNgbsvXKOWKXhCEZrEcapu+HTb/M6aC4HZm8zm/IajrXTlwDgyBi0f20WM/+32Y7Uz+PRr5uIc0e4FCcCrpPTTc0TMlnVlX8V2dhWrwo6M58Ug5ovqbJrB6+ccKVyL9x9XGPx/q/7+GKR+Gw76QF4XrwwIeL2pqtvnxMbfjqhzQRnT8iPuRI+VybrMHq71xVuQdhEc4pzs0zdBNNb3vlXpua9P93l7uizDj3xBuEA+HAE5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761755635; c=relaxed/relaxed;
	bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Psq6om/7t4kDGuLPrUPxaHIdJ68mfdbkPwbQefjpmRnbIwHj186/3LdnvAVTckfAzHEAykxDGAtY7PoeJguQiOJzniL4LAjN7sO3MjBo6To5ojO5QM10o1tEG6I+DImdXLD2TPrA0vHRPRMyASZjM/DRKIlvpgZnKlWasLY4s5iUxikdeta7mvd6NWRJGGBATlnoU1oic5c/wdGGdPb7debbCN6YYm+F3g6PYXxnhpHV7at51TkL1lu8pdsvIii2Bz63biC00445H4diiI93BBIq+oTBeWsnhwQtx5c+Ru1jIyozYcJytwA4iXuqzshk+cIDkyjJObDNImq9PJ+y3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gJrRbGY/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gJrRbGY/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=thierry.reding@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxXr25wcgz302b
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 03:33:54 +1100 (AEDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b5b823b4f3dso9764766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 09:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755632; x=1762360432; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=gJrRbGY/8E/UHZfY66tQ53t8vnrhz6sKnSWZEsLrepzW8cdt79p0dTMQ8K8aniCfkl
         hsbD8BPigjI5Q5RMua88fu/A5UISZtr43mWEdGEs/G7ERyNyaxksjMtGGciIRKHyPZ9P
         iTdrvXtk1uHga+qlDtCKnotW48TuiSIocz+8vOtLE+BGl4r1/H8abcDrpLWyLiDYFWxA
         Lc92f+IOrDruw+k8PFCdHBiHbFomCTHpxX06lVMHwxgCXr3Rr7L9kEsZdifjkKs7Cl7B
         zeN4UD+I+bxagrns6Sl4kV4L8IMjSk3wcrkqFLvY8UTp72524DWJDFXVOgUSx4wWVpre
         zG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755632; x=1762360432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3ZWzIw+tzavBMOmDgztL9+WJKK3w3KSDq6YVOazGFI=;
        b=i53/xB4mlSKVDQNB1advGYGcFqzyTCwDkn3afnn3DxBABbYj3NOYnvlDxi6xBy2nlf
         MXBaRgAe3rfES+Uegj6x7hCg1E29zydGewLoTax5oB079EaBmxuNshTMHCCfulPAaNrp
         UuntTkXUc5wep4RJDE3V0OQ3EmaosTCbKkGLtg3uFHIOm5ZWbIjI6qmx6V8l1g98BCSG
         WiIQBptgo0ZS/Uwsxd+s4m/YSMxGjUX+ElqsggbSFu4kbOwwF7Br3a6Z1hMOq50FBUmq
         RdW5GOYAG+kZWg6NWi1j52bn0Bk74dyE9x7M0788HKfZ8eUHiRomMJQ+oZrPCbKNdO7/
         MkGA==
X-Forwarded-Encrypted: i=1; AJvYcCWwRsL0QBORgEKiHUB470PzB8vO8Lvl/6bS8bHaRgxQ2FG35rPHvjZ51d+qUqSHognE0Ay0kRvcrjcYt+8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyPYa+pPLjd03Morfv2PCfXfFC8SFnkQ04Y8T51nLtGzt7Dxs1M
	oV3NCoLSL04DwGUmw4kI5mH4TLoh9UxuIc2hz8ahmKDyoxEJy6POY1lG
X-Gm-Gg: ASbGncuYqas69Ak/AYJisCSJcpLWAZjiLmeNtIliVCmp5RbIbuaKw9ycmegK8t0gpBV
	+0fhHkZbOv6/vYFjPsuovMsZ9zhce/0LVdDKgKBK9XMAOrcfuXfmkEZtLW+RgVc5uyB2wrDms0A
	UBFK6lIMrHFtBA0cZtjdNemnQqYoUrTrpT/xGRZusOm65IImi1EYFXu9Wu5HLiJ28Ki7uJseP3A
	pIept8DYPeYG3SR9rh7qb+tKRmHNbQceQdePTIIug7/zmeuW4SwxJKsMX+2RQqi5LlYXwtSNfet
	SbPC5nglkM5PeO5Yrs6kGDp2hhwBaqp5w5wJUWBdKvZ7qz/jvQYOLZmkHwkF9UC7QUsgsBtjPSU
	uolJlOHqA3No6RuVo2ssvqWssho0zLco1GEhRrd5Hat66X5miXQiZfcojgWgnypQJscKzUJnyHK
	jkQfimOL3sE4PvapBC9dPqoWPkg44Em/bEXXzZBgqd+2/4rvUhd8FDiid8/oCDeEPoEBR3
X-Google-Smtp-Source: AGHT+IHRieiPBGU6MC5P5jZHI6G/6PD4P6RVg3Iggx9u+yanu4koYZOv2T4MUr84z07ifr1PiVwzxA==
X-Received: by 2002:a17:907:3da4:b0:b6d:8da0:9a24 with SMTP id a640c23a62f3a-b703d2dc3fcmr322653366b.9.1761755631652;
        Wed, 29 Oct 2025 09:33:51 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6da1e2226fsm1067814666b.20.2025.10.29.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:50 -0700 (PDT)
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
Subject: [PATCH v3 4/7] clk: ingenic: tcu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:33 +0100
Message-ID: <20251029163336.2785270-5-thierry.reding@gmail.com>
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

 drivers/clk/ingenic/tcu.c | 63 +++++++++++++++++++--------------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/ingenic/tcu.c b/drivers/clk/ingenic/tcu.c
index bc6a51da2072..8c6337d8e831 100644
--- a/drivers/clk/ingenic/tcu.c
+++ b/drivers/clk/ingenic/tcu.c
@@ -53,9 +53,9 @@ struct ingenic_tcu {
 	struct clk *clk;
 
 	struct clk_hw_onecell_data *clocks;
-};
 
-static struct ingenic_tcu *ingenic_tcu;
+	struct syscore syscore;
+};
 
 static inline struct ingenic_tcu_clk *to_tcu_clk(struct clk_hw *hw)
 {
@@ -332,6 +332,29 @@ static const struct of_device_id __maybe_unused ingenic_tcu_of_match[] __initcon
 	{ /* sentinel */ }
 };
 
+static int __maybe_unused tcu_pm_suspend(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_disable(tcu->clk);
+
+	return 0;
+}
+
+static void __maybe_unused tcu_pm_resume(void *data)
+{
+	struct ingenic_tcu *tcu = data;
+
+	if (tcu->clk)
+		clk_enable(tcu->clk);
+}
+
+static const struct syscore_ops tcu_pm_ops __maybe_unused = {
+	.suspend = tcu_pm_suspend,
+	.resume = tcu_pm_resume,
+};
+
 static int __init ingenic_tcu_probe(struct device_node *np)
 {
 	const struct of_device_id *id = of_match_node(ingenic_tcu_of_match, np);
@@ -430,7 +453,11 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 		goto err_unregister_ost_clock;
 	}
 
-	ingenic_tcu = tcu;
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		tcu->syscore.ops = &tcu_pm_ops;
+		tcu->syscore.data = tcu;
+		register_syscore(&tcu->syscore);
+	}
 
 	return 0;
 
@@ -455,42 +482,12 @@ static int __init ingenic_tcu_probe(struct device_node *np)
 	return ret;
 }
 
-static int __maybe_unused tcu_pm_suspend(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_disable(tcu->clk);
-
-	return 0;
-}
-
-static void __maybe_unused tcu_pm_resume(void *data)
-{
-	struct ingenic_tcu *tcu = ingenic_tcu;
-
-	if (tcu->clk)
-		clk_enable(tcu->clk);
-}
-
-static const struct syscore_ops __maybe_unused tcu_pm_ops = {
-	.suspend = tcu_pm_suspend,
-	.resume = tcu_pm_resume,
-};
-
-static struct syscore __maybe_unused tcu_pm = {
-	.ops = &tcu_pm_ops,
-};
-
 static void __init ingenic_tcu_init(struct device_node *np)
 {
 	int ret = ingenic_tcu_probe(np);
 
 	if (ret)
 		pr_crit("Failed to initialize TCU clocks: %d\n", ret);
-
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		register_syscore(&tcu_pm);
 }
 
 CLK_OF_DECLARE_DRIVER(jz4740_cgu, "ingenic,jz4740-tcu", ingenic_tcu_init);
-- 
2.51.0


