Return-Path: <linuxppc-dev+bounces-7402-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90467A768DB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 16:56:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRDjZ23RHz2yqj;
	Tue,  1 Apr 2025 01:56:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743432994;
	cv=none; b=HQ4TpH6pfXIC5dYztUr7qoWMNkoKT3UmC4LXZ/dT3ZGIonBLDO/gEU6lTimnyuXNq3ML85U9YERpI3KfxZFq8KYhT9Rk1I6iFPlNAMI2zhtPvjweqUNHXsmLHBE2nEqTyqXduVGpKHLzT+LFGIxcuo9yzxEzQ3iKU4P4dI6YtFzbr19oG4co5ktfe7bIW6Au0g3hTGNYIKbSRQA/xJiT8xSQXq8+smF6PDvBqCjNTKn3/iDf53/2+DL31qGF2L6xD1jt0+CHUQXl/f10xklG8SHb13mA2vb/Qc5mVBB1BcAfMAxHmWpfAki5uc6k570O0awZ2WypdV9afxuuOTqh4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743432994; c=relaxed/relaxed;
	bh=1XY3qhbUwnkpFj2MvkkdQqb+OCV100PjhsM8OVvrf0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dXViGckHJU0mrs3m+GtpJLsSpcS61YBmV84frkP7OwpnwCXvf670vAP3IsAybXofweQ/dTUKo7Qa51MQUBh6VGVrRget38JuYiaTz5IlArTC3P5uqrOBIbICxeIXwrbHtD51DiSe7M8EziHJhtTGy0IbgJLE1t/m/9d2r4+z68g8jKyRZqP5tLlPdnJMiweq15Q8PbJhwCIXJVTtCu9czKMXutzziKR8tqSbgDAWR+4J7zOifl+/irHXtIyLRthfvQMGLXFpSiv8rLpNW2BKfblefSN4Fg9gmaXaLspZ5nHsk6in7unRZuOfgzTvFAiWBnC/DOGimBFcmWqTE8/mzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c7m5HVXU; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=c7m5HVXU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRDjY4bYXz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 01:56:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2CF344CBE;
	Mon, 31 Mar 2025 14:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37E0C4CEE4;
	Mon, 31 Mar 2025 14:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743432991;
	bh=OIa51V2iB+r4NR1Int+coAkN5hAyRU+5eYfOlP92a6U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c7m5HVXUeOQRefc7wEGL2Sa5n9v11RgwsGaIi/U70Apv+8nuzcpmkNdHBEGkWSkS1
	 F4joMQnza2IRjqWiW/WGn327RTWKb3Bs813O9msXcM32b1QtLGy+ZqHTVY8QJjx2SV
	 +agWO3SgjYnrww5zaTmIZo/YsySXu7JsfbbuEQUPsfGoxmOcyvn4OOBZjdsEYsMsF3
	 Lgs8uj5dl6OrCVzXMqAipotQLgeABPpmeWbCCFvHcNA3BJp3+TxC54Gvc/o5W/hI/K
	 01eJV4/Ww3ax5x7d1zZ+kG1std1sBEIpz2/0tIOT9QRUZ9WSSZaFoCAQLUca/+QRl8
	 mVxqddx9SjDwQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.6 14/19] ASoC: fsl_audmix: register card device depends on 'dais' property
Date: Mon, 31 Mar 2025 10:55:55 -0400
Message-Id: <20250331145601.1705784-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145601.1705784-1-sashal@kernel.org>
References: <20250331145601.1705784-1-sashal@kernel.org>
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
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.85
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit 294a60e5e9830045c161181286d44ce669f88833 ]

In order to make the audmix device linked by audio graph card, make
'dais' property to be optional.

If 'dais' property exists, then register the imx-audmix card driver.
otherwise, it should be linked by audio graph card.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://patch.msgid.link/20250226100508.2352568-5-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_audmix.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 0ab2c19621175..d8e44470f501e 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -492,11 +492,17 @@ static int fsl_audmix_probe(struct platform_device *pdev)
 		goto err_disable_pm;
 	}
 
-	priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
-	if (IS_ERR(priv->pdev)) {
-		ret = PTR_ERR(priv->pdev);
-		dev_err(dev, "failed to register platform: %d\n", ret);
-		goto err_disable_pm;
+	/*
+	 * If dais property exist, then register the imx-audmix card driver.
+	 * otherwise, it should be linked by audio graph card.
+	 */
+	if (of_find_property(pdev->dev.of_node, "dais", NULL)) {
+		priv->pdev = platform_device_register_data(dev, "imx-audmix", 0, NULL, 0);
+		if (IS_ERR(priv->pdev)) {
+			ret = PTR_ERR(priv->pdev);
+			dev_err(dev, "failed to register platform: %d\n", ret);
+			goto err_disable_pm;
+		}
 	}
 
 	return 0;
-- 
2.39.5


