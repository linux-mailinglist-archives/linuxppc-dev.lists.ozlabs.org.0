Return-Path: <linuxppc-dev+bounces-1738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C71398E4A8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 23:14:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJncG1VsDz2yVG;
	Thu,  3 Oct 2024 07:14:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727900524;
	cv=none; b=dyu3UKSqB8cE8qgeVteapAFV7ihVhW4YjeBOYAvP5mPfQunq+CyjdRg2EsI0NkS3/mu7SAVjSGbpnQzxgPNcQGxuD7bL1S0Ta2b1OaMOWIujHhI6XxNdunX9lp9kD0iZlBm6WhpA7/tvPCSKqy2r9zrS6Ad2Ctaflq85dVzquyuVzP4Dv2z0VuY5hClHI4sqyeoHiLDY/N5tAephMZRyCHef4ZQuSSb5+fU8YR3hKCfVHlHQzWzlHoSWEFAR4cNNMxhWrxykbamTk5jpDlY0V6I/JXmp8tnSzvnGjWIXHlakmv7m0rwvbLACBxx+Tk9rvdC8EmEIY1VgW6V3sXlozQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727900524; c=relaxed/relaxed;
	bh=10Ete0eASbyrDKTfZvxGKRPjMfOwNNJQDe6fYsjfOVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZDMX0uCR6ld1FhbqHHeBRIMOrES/oZCDLdyDpjzmXFxDrQmWwYJqo1pAOjvC7p2BpY95p7uy9JZy3z5XblvhKTlCmgGoxwkUDfcYkEj7qooToaNo/Bl4Xm4p1BdLpbtCX20JIU8c0sm5Hn/RDQ8DlPYL9MXkCYi/V50rjNhkdS6fUKI0SAumIVC4R69yyLTOxI9c3Yxo4kra+qHe3BRPD5nH60npWGAbYsA8QoVWf4sMAvY5Ok7g+bePvGKKrhNokEKHuDxyeff6YS5JGQKhO96AM6Ead+WGWqiu+uwpzEGW4gpimSy4X1yJ8wAe3B9P9B0zZcAJ90fzu9Ksm8pm4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P92G3Onj; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P92G3Onj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=javier.carrasco.cruz@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJmSC3TPjz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Oct 2024 06:22:01 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37cdac05af9so213223f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Oct 2024 13:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727900518; x=1728505318; darn=lists.ozlabs.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=10Ete0eASbyrDKTfZvxGKRPjMfOwNNJQDe6fYsjfOVs=;
        b=P92G3OnjdF9YQKuf9OJ0Wm19SYB5imBWwTXIKsrrUSsPTWCpYyP0CdNQaUtEKt57bp
         vBdAKLHvAiLIWqcUEFIS0GZqwTREN23AeyppD7iQ/ptVKdp2d5FhbptRWpe+hnW8782v
         Kco9gd4xNiXJhJlSopnHy+qsDFPgbo5dBZOhlManJEWnO4x7BdlWxyJcukATRwQaGfbb
         w9Sdfb7ZeM37dWbyPTOVrKauFJyFwkdProIM1nC/J0QPr+hvMguvxJUsD4d02bKG0kLB
         3wWPdhvApTfEomaDJigNxxQxx74qV9BoO7lfWfpgJVKUtfN2pU36TOkaNOGlc7gHinv+
         VL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727900518; x=1728505318;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10Ete0eASbyrDKTfZvxGKRPjMfOwNNJQDe6fYsjfOVs=;
        b=BQIvuGKHyV8GzWNGpGIOz9rn4a6iwDy1tSI6CbxKNJgJMa8mxj7BaVftduszGbk8Y3
         k+qX18GKYV7VHJFr5DO5pH+UjoDE2/nPHzGVDKlR7M4KfaHCMUQgisq3VbuRWmefSzqR
         I7KpvdjWXO7QnwO1Y+08rjWIWt244jJ9eA0jojJ5r2ztQfqijzcipWEE4ZwLnnW6ZeDa
         NZdUhY27hSOmFvzKLqEavGCDLVzDVUvQ6WJ5FQQJOhPQSp6fmjQRqEBTItr/X3J6yT13
         Q1uLr/UvGo6vfSHfMGUAtMq+AL/+7xT1ZYiVtBusM+FZdK3M/CXPaqsMciJjeNE/BUjz
         O9+Q==
X-Gm-Message-State: AOJu0YzYfW+X2Lc51timldLU3c3/c6u3jXZA8ybvXOJAbYbu/hC2qipq
	gkVTEaeQK03fyrGABLSFRIxoCnLZHRjOaFrihjl7dxyDFx9WfHkv
X-Google-Smtp-Source: AGHT+IFoAq4Ph8jiDRYgIEa71gIMuyXdNHKKqBbTh6+oyGjpqdo81GEjyoal0nyN5Ul0h29juLMdlA==
X-Received: by 2002:a5d:58ee:0:b0:374:c7a5:d610 with SMTP id ffacd0b85a97d-37cfba0a4fbmr3562525f8f.43.1727900517427;
        Wed, 02 Oct 2024 13:21:57 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-28a8-6b99-3729-0965.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:28a8:6b99:3729:965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd572fb5dsm14703947f8f.88.2024.10.02.13.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 13:21:56 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Wed, 02 Oct 2024 22:21:51 +0200
Subject: [PATCH] soc: fsl: cpm1: tsa: switch to
 for_each_available_child_of_node_scoped()
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-tsa-scoped-v1-1-ba6a6d657f82@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF6r/WYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwMj3ZLiRN3i5PyC1BRdc1Mz0zRzk7RU42QDJaCGgqLUtMwKsGHRsbW
 1AM/O5BdcAAAA
To: Herve Codina <herve.codina@bootlin.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727900514; l=5467;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=rKJz0hao9xUpcsffGX5ZoN2ju/z7QmSDWhPXF7YCt+8=;
 b=Etx2qoaGCIabzk/U64d9Sqti+QbXieObYLBdJ6sdh4HrFIOI6H1/inwqehWshOTHicrQmUIRM
 8pnW+dWmNRRDzA9jRw33np5cwayHwZsmuYTEi4+1M70RhscG15sJDi/
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The non-scoped variant of this macro turns error-prone as soon as error
paths are included, because explicit calls to of_node_put() are required
to avoid leaking memory.

Using its scoped counterpart simplifies the code by removing the need of
explicit calls to of_node_put(), as they are automatically triggered as
soon as the child node goes out of scope. Moreover, it is more robust as
it accounts for new error paths without having to worry about
decrementing the object's refcount.

Note that the device_node is declared within the macro, and its explicit
declaration can be dropped as well if it is not used anywhere else.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/soc/fsl/qe/tsa.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
index f0889b3fcaf2..a1140aadfd6c 100644
--- a/drivers/soc/fsl/qe/tsa.c
+++ b/drivers/soc/fsl/qe/tsa.c
@@ -680,7 +680,6 @@ static inline int tsa_of_parse_tdm_tx_route(struct tsa *tsa,
 
 static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 {
-	struct device_node *tdm_np;
 	struct tsa_tdm *tdm;
 	struct clk *clk;
 	u32 tdm_id, val;
@@ -691,11 +690,10 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++)
 		tsa->tdm[i].is_enable = false;
 
-	for_each_available_child_of_node(np, tdm_np) {
+	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
 		if (ret) {
 			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		switch (tdm_id) {
@@ -719,16 +717,14 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 invalid_tdm:
 			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
 				tdm_id);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 	}
 
-	for_each_available_child_of_node(np, tdm_np) {
+	for_each_available_child_of_node_scoped(np, tdm_np) {
 		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
 		if (ret) {
 			dev_err(tsa->dev, "%pOF: failed to read reg\n", tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 
@@ -742,14 +738,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			dev_err(tsa->dev,
 				"%pOF: failed to read fsl,rx-frame-sync-delay-bits\n",
 				tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		if (val > 3) {
 			dev_err(tsa->dev,
 				"%pOF: Invalid fsl,rx-frame-sync-delay-bits (%u)\n",
 				tdm_np, val);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 		tdm->simode_tdm |= TSA_SIMODE_TDM_RFSD(val);
@@ -761,14 +755,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			dev_err(tsa->dev,
 				"%pOF: failed to read fsl,tx-frame-sync-delay-bits\n",
 				tdm_np);
-			of_node_put(tdm_np);
 			return ret;
 		}
 		if (val > 3) {
 			dev_err(tsa->dev,
 				"%pOF: Invalid fsl,tx-frame-sync-delay-bits (%u)\n",
 				tdm_np, val);
-			of_node_put(tdm_np);
 			return -EINVAL;
 		}
 		tdm->simode_tdm |= TSA_SIMODE_TDM_TFSD(val);
@@ -792,13 +784,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "rsync" : "l1rsync");
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		ret = clk_prepare_enable(clk);
 		if (ret) {
 			clk_put(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		tdm->l1rsync_clk = clk;
@@ -806,13 +796,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "rclk" : "l1rclk");
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		ret = clk_prepare_enable(clk);
 		if (ret) {
 			clk_put(clk);
-			of_node_put(tdm_np);
 			goto err;
 		}
 		tdm->l1rclk_clk = clk;
@@ -821,13 +809,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "tsync" : "l1tsync");
 			if (IS_ERR(clk)) {
 				ret = PTR_ERR(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			ret = clk_prepare_enable(clk);
 			if (ret) {
 				clk_put(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			tdm->l1tsync_clk = clk;
@@ -835,13 +821,11 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 			clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "tclk" : "l1tclk");
 			if (IS_ERR(clk)) {
 				ret = PTR_ERR(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			ret = clk_prepare_enable(clk);
 			if (ret) {
 				clk_put(clk);
-				of_node_put(tdm_np);
 				goto err;
 			}
 			tdm->l1tclk_clk = clk;
@@ -859,16 +843,12 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
 		}
 
 		ret = tsa_of_parse_tdm_rx_route(tsa, tdm_np, tsa->tdms, tdm_id);
-		if (ret) {
-			of_node_put(tdm_np);
+		if (ret)
 			goto err;
-		}
 
 		ret = tsa_of_parse_tdm_tx_route(tsa, tdm_np, tsa->tdms, tdm_id);
-		if (ret) {
-			of_node_put(tdm_np);
+		if (ret)
 			goto err;
-		}
 
 		tdm->is_enable = true;
 	}

---
base-commit: fe21733536749bb1b31c9c84e0b8d2ab8d82ce13
change-id: 20241002-tsa-scoped-7565f74fe3c0

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


