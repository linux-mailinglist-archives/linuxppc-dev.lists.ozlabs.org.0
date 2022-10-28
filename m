Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE6F612654
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 01:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0FJC4VbXz3dvn
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 10:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=b7KpZsfq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=essensium.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=maarten.zanders@essensium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=b7KpZsfq;
	dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzRjK1qShz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:46:11 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id m15so8409733edb.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9dtDrkTtJDWiY55QD7A/AEXd7H01h6LFKl1oWBL6fQ=;
        b=b7KpZsfqzkutWlZGik4MAB1Tx6dfC3eHgxL5t+NdtcgaRf3bRJlJmpysb/wWaxN3uV
         O4fiJWluRqxiZGZkVAeZN95K960I3FdolJKeE6hrTrREE/C1FWpCylkLwjAnL5eUy+Rm
         cu51JQj0wsZSQz5IhNg22FlJln2wsMmaUqJKXyZgyiT7jIAh3EIEaNMUYx/fm5yK+XhH
         qD/NUodEX9yxxkKKY+s/cVr6feGYrVfzuhvT0g/lDAEJHkiXqqcIgeoa64GshzeL6c+O
         V4FxWupBqrgnm9yejdqyzW6K9Cv139uVN5D5WJNQUFm+9eWR162wnk8PPJ7a6LMlE8B6
         gDkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9dtDrkTtJDWiY55QD7A/AEXd7H01h6LFKl1oWBL6fQ=;
        b=VjTBVFfK7X/V0j9LW3ouLKfA57O9fxiTgkeWk76ZGv4vmeVIiB+Fdhrmtnta4fd+vZ
         /1pPlzHuMXznIL8pofc+A+fxgpk5DrJMVTDSYeRpbVsclcmnqVanrJPNt0UaGbTzZFae
         0QhMmTxiSuboh15zCnt2bv3U1R3u69Hwx3q2OqOstZe3WoZF5LxcX8FyXb6Nkmab76sr
         7KKLA7UNelmdfH47f+YpFTd8Hm3P0I2r9WYi39k+bLf2zEeyAdEX8d+O/ul6MpcZ3AgX
         VZj4Lk/r0T4AwL3OgKEa8UCTJXE5BlBfTPGu9rJep4iU2ppw9FkCB7Q5lYquYnDiFJi2
         RiUg==
X-Gm-Message-State: ACrzQf1pcVvmitcDe6tnweD46tJcERYjDpZ8onsN/BajQfuXTEpkk0QQ
	XLwryB1lusbQOh6gtIcptfpdrA==
X-Google-Smtp-Source: AMsMyM5dyCd1eEohQv62c02F5R5xcIrjosFu9rz+3oYRdB87GVstKjFzAVec4TcpCWzH0Wqqpc7mRg==
X-Received: by 2002:a50:eb05:0:b0:457:c6f5:5f65 with SMTP id y5-20020a50eb05000000b00457c6f55f65mr26705edp.311.1666971964506;
        Fri, 28 Oct 2022 08:46:04 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906309200b007a23fe14442sm2329092ejv.195.2022.10.28.08.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:46:04 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Date: Fri, 28 Oct 2022 17:45:34 +0200
Message-Id: <20221028154534.112175-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
References: <Y1vyMQ8Jj7/smeC6@sirena.org.uk>
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

This commit is similar to
commit 0434d3f4525a ("mailbox/omap: Handle if CONFIG_PM is disabled")

This commit fixes
commit cab04ab5900f ("ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk")
commit 203773e39347 ("ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk")
commit 2277e7e36b4b ("ASoC: fsl_sai: Don't use devm_regmap_init_mmio_clk")

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 sound/soc/fsl/fsl_asrc.c | 2 +-
 sound/soc/fsl/fsl_esai.c | 2 +-
 sound/soc/fsl/fsl_sai.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 936aef5d2767..e16e7b3fa96c 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1232,7 +1232,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 5c21fc490fce..17fefd27ec90 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1069,7 +1069,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMB, 0);
 
 	ret = pm_runtime_put_sync(&pdev->dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 81f89f6767a2..e60c7b344562 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1446,7 +1446,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	}
 
 	ret = pm_runtime_put_sync(dev);
-	if (ret < 0)
+	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
 
 	/*
-- 
2.37.3

