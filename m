Return-Path: <linuxppc-dev+bounces-7404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04958A768E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 16:57:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRDkP543kz2yqm;
	Tue,  1 Apr 2025 01:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743433037;
	cv=none; b=UY272KBEmG7wHwkmXXKtDHNy/xCcOTrxZiHAyGLrwtIzfDFIvXG6rEwrpVxoAu3WZ9+9MEcRa+Mpxif19VB8YUypwLKyvfL41Wcf/MFUu6DCuqMFOEt2pKIjnOHGsR8APBv9doxihszQokZOoahCkNKI4J36RBAKMhizRIVOkR1qv/O8b1DlrzSvwctwCPnceDVVQdOeVnNJ6vlIS1zUXMTmJqG2oPVfwJiWnk0u20OPKZDWayxSYp151TPAdYUvAw3EWQ7xIWULRZiflglDEVecOQTWASEl+83kjVeNMWXoeX0WVpV4vkMDy4vxw+2RYX6tLLS7ux7uKJdIm2LXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743433037; c=relaxed/relaxed;
	bh=mWlchdh6JdkUEhJc6MA+xJCFPhWgi2aLJFe50ttojYg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j1CGQ7LrzSPpGgwj/O5/MSyB5h0sI9vO5mVZtSUbZFBIuHpnosv65Fg+ALiA8mgc89wWmh8bENM6B5wCHE6eet/wl4PwhgDQE5J/wBXaFYPi2UYMTZ1HKLq/o7oVhGaNsv5y0RYDxV/EfEJoei+40OKLjOJrFhLwfs1yId0XEXAgDL9DOGL6B+LgdNKml5PfW8P2/pa+zD/6apPuL4XSkjE10M/d4uzI+baSrJ/8aaIXEl7lPYibLRHzm6zGk5KWkikvJtb9OE7xn/Qvl50UnIxFOP88fVxcg1gJC8BsbTMObI0uJdcDPybzGSWnWSY+UA+4Vpjywv2RkOBwC98kuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VvuMym4U; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VvuMym4U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRDkP0m8Gz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 01:57:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 781E7614B6;
	Mon, 31 Mar 2025 14:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BA5C4CEE3;
	Mon, 31 Mar 2025 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743433034;
	bh=wH6f4F38u0npLk501yQtj1sSIBotIvDuvAx2q/Ip+sU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VvuMym4Uck6F55xT8LrL9/BlKd7DEzCVSRDAJ7fOe0KP2NX3tpyUD2mAhigsuxNZt
	 PfP4/1IUvz4jVRYh92yt3L5xgUTO9uJfRt+v7vSUggIa89MXRE28q647PZY37d5mtw
	 DWc03GCT3gg1WC4IZa92cMp+QbGlqtpLY/JKg0YuZ4iMOGG+5zd38jcf4AYW8cfHRE
	 KW87cPJoSJb88JeJ/D6xRbnzM3AlNfeR2VHppMUs3SkQAB2a+MlSo/Xhai2QaRCnOL
	 2NoGAQJW0wOTbSXGzFVdy5HUQ4z9y1d/NQa77xC5fWpEHjiQ8VKGnV/9MlRYoY+rDv
	 U9QF8gTybyX1A==
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
Subject: [PATCH AUTOSEL 5.15 5/6] ASoC: fsl_audmix: register card device depends on 'dais' property
Date: Mon, 31 Mar 2025 10:57:02 -0400
Message-Id: <20250331145703.1706165-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145703.1706165-1-sashal@kernel.org>
References: <20250331145703.1706165-1-sashal@kernel.org>
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
X-stable-base: Linux 5.15.179
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
index f931288e256ca..9c46b25cc6541 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -500,11 +500,17 @@ static int fsl_audmix_probe(struct platform_device *pdev)
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


