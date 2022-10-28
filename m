Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7487612651
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 00:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0FGB47s0z3cMp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 09:58:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=aSCxH4V0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=essensium.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=maarten.zanders@essensium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=aSCxH4V0;
	dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzPcx5zSlz3c6D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 01:12:14 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id d3so8561719ljl.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sj8HqllYMhfqKSvoQNCAihSbEuI4FzdlLzmNIw46HS4=;
        b=aSCxH4V0xWhwnLfV9pMe0XfN4ID4YAlJ0P8AuJMDr8MQsLUgliJ7DKMek2AnNfLxEF
         +2ppRP9SBmJR4ZgjRhHXuoDFBvPUp+ysV89R+Y67dKWSM4Y0v5Dt/t0MTlKsPimJ/QvN
         rXO98VseuYdpDVBiRSEIcdFxJF1u7xzWzXAjUN0lmnIbuL/tgscSTCSS/fDCfT5ZkBlz
         cIHso4eLUO6aunBIclS8lDu4VwjxEFxQbjzuY0lRT54CvhK80AwArFkgGf+m6Qjw992p
         68Nt/z1nNqEd0x9wDZYv1iSokRqTappf3lsaBaidhhkB1lvrK03uLtBMfMTGvgo4iHFF
         Vkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sj8HqllYMhfqKSvoQNCAihSbEuI4FzdlLzmNIw46HS4=;
        b=Ltlf90NZpfvX0JQagX5YlrBHHtQHcOQ/mNhARHYz64sa551DJ3gDkx6l22yj4y9nyH
         HA2JjVyCBHTkPezGmGMwYuqRPvcxz3ZFNIROaQe7SnK88zQCHrT8uKDlmPBBC10k599Y
         V4mlT/KEr+TZ+bxNcIL91oJ5AA2sSbnJCiyzLjuBPRwaYpuvqC2HY4H2CigAm9fjNwFs
         qH8olLUu65NDmR6ue9jvwSmD6/6IsrjZYklW3PfLtRa33A+aAlI0WrgAdMaiDmPqKdsr
         tegn0QSThfZnePNv6uxR0XcW+7Oc74FPhwua1aK5zPmLDgmlGQn8qvMAxMDdvF6LPxJB
         Z9lg==
X-Gm-Message-State: ACrzQf0hMycAVKfL+q4dVJrEvXMpobcuP8j9OOJNIVo+Deg2jQ9qlXdR
	sAdfWdo3fEhqBF16BvvBtBxRsOD5u9hafcvaG9k=
X-Google-Smtp-Source: AMsMyM6mA6aj5cK7n1IOR21s4CGJnScN3SYaB+eu81S/8fo6cgpjaWtiWo/dcNJNNXbaJgS8HtwxcQ==
X-Received: by 2002:a17:907:16a6:b0:78e:f140:a9b9 with SMTP id hc38-20020a17090716a600b0078ef140a9b9mr47339126ejc.502.1666966314346;
        Fri, 28 Oct 2022 07:11:54 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id 9-20020a170906300900b0073d753759fasm2241902ejz.172.2022.10.28.07.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 07:11:53 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Date: Fri, 28 Oct 2022 16:11:28 +0200
Message-Id: <20221028141129.100702-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 30 Oct 2022 09:56:23 +1100
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
Cc: alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_PM=N, pm_runtime_put_sync() returns -ENOSYS
which breaks the probe function of these drivers.

Other users of pm_runtime_put_sync() typically don't check
the return value. In order to keep the program flow as
intended, check for -ENOSYS.

This commit is similar to commit 0434d3f (omap-mailbox.c).

This commit fixes:
cab04ab (ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk)
203773e (ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk)
2277e7e (ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk)

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 sound/soc/fsl/fsl_esai.c | 2 +-
 sound/soc/fsl/fsl_sai.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 44dcbf49456c..08ca410ef551 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1226,7 +1226,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bda66b30e063..763f5f0592af 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1070,7 +1070,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMB, 0);
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 38f6362099d5..01f3463c0e47 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1149,7 +1149,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
