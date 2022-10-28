Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A556612655
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 01:01:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0FKD5x5Bz3dtw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 10:01:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=Scyhmj02;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=essensium.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=maarten.zanders@essensium.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256 header.s=google header.b=Scyhmj02;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzV6G3ByDz3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 04:34:27 +1100 (AEDT)
Received: by mail-ej1-x629.google.com with SMTP id bj12so14500041ejb.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 10:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXgFQ2AiirDn7ylvDdK02G7QYybBypCEVhzqiAXGlxg=;
        b=Scyhmj02CKM5yxBdbaYtrAYm1fwrxtc4tLIwSA/sRtHag12CtQy2AjaU2237oxsWZZ
         lop/DZe74+wPugi3WBwjHcSgWRIREq0aoa4BTgpCdh3eHEuFzCY4/zGdiV6W8Z5AbIRM
         QEAqkNt2Xj5VweRGQyCNodWQ2cr69+tVh7giqmXV+LKeahpntt6CD8KkTPWShlb1sbP3
         XpDdj7ZUkpc8KQggPzg9gv0H8NBq3KnP6z6toMt5HXEPZNtVK1fw1qTPWBE2X5srE+Bs
         vmJMbhn5+FgUDKrMLXZASwoAkXQGud+D3HMBxb0SUqHgIPpo2kG8HOUSGpdrOzXVjxxK
         h0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HXgFQ2AiirDn7ylvDdK02G7QYybBypCEVhzqiAXGlxg=;
        b=F37wbTPxzhq2BpSN1O1ejDhU6T9ITFLHp14pW2tJWXIEfGjVCexOqaZwEmzWF+VK5E
         83xdWJCqc0mDUFAS9boAaqZtqWNCvfhO2MgAOj40M7hg8L+I7DgK/5SrX7cG3IY6Q2CQ
         KPGJ4W1Db86E7hovI4NYp67g2hV/LYVmEUpVYsRgiuXjhjg4h/q3dNiFy4o+WTpmAEYK
         RNdGlhirW/e93hEjs8fSTd+kzV9wJW5MK60yA3HfrXW6iI/WBeKRb3+wBTIm/PttSw0z
         X214Ct/ZkG/rM4JfAKXiUiUydA3uYcqaYMp2CidI5nkoyQtxPBOv06F/twEMuM0CabCb
         a4rg==
X-Gm-Message-State: ACrzQf1AADf4rhi4iAqYKxOHdwi4fU/Y87YhRiOtwKM+PFJptYKlMdE2
	v67nTT6i4vUb5ePQdpEatR7JiQ==
X-Google-Smtp-Source: AMsMyM43tumq4AVpXyo00mGeFeYdaSFpUgltayHAirnrZ1oFPURcmdLfFC4Anm4hdUD30bsqCUmHfQ==
X-Received: by 2002:a17:907:3da2:b0:78d:3b45:11d9 with SMTP id he34-20020a1709073da200b0078d3b4511d9mr407191ejc.87.1666978460491;
        Fri, 28 Oct 2022 10:34:20 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be. [78.22.137.109])
        by smtp.gmail.com with ESMTPSA id v8-20020a170906b00800b0078dce9984afsm2388868ejy.220.2022.10.28.10.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:34:20 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3] ASoC: fsl_asrc fsl_esai fsl_sai: allow CONFIG_PM=N
Date: Fri, 28 Oct 2022 19:34:04 +0200
Message-Id: <20221028173405.155264-1-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <Y1v68WuDck1oaVmk@sirena.org.uk>
References: <Y1v68WuDck1oaVmk@sirena.org.uk>
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
Cc: linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>, Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org
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
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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

