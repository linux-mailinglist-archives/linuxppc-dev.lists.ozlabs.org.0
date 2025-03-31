Return-Path: <linuxppc-dev+bounces-7403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05527A768E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 16:57:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRDk453K8z2yqV;
	Tue,  1 Apr 2025 01:57:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743433020;
	cv=none; b=SYcpV7GRpyu2Zxlue+VF330xMxg1FuxI42njtMCvKk/3pelrg5no1Uf3XcTW8UEtTu3LuS9ioP7tKEDZGffUq+dCv6r65TpQpUcIVs11jtE0O742XjRU6ClnKOc4nvmhb4Rt/fj8GQdomxpm7s94Z36kzpRF5Sh5L+hbpApASRlQ72CRdLbjAIRSWsaik4hxIYHHWuv1hwk8GnzTnnqNGZGBaZVMAXTbJpfTJKrniaK1F9MvUnmgVeve8lwGsWvyf2bbAiCOn0gT9fZSO222Vc6Pe2WnmavPYFirZm4HGOS4tubtgR8G1rhOY7V70XUPnGHUwhJ8oLGBGzzeRQgZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743433020; c=relaxed/relaxed;
	bh=59q9QeVQ5DOBuIftBRXDX28NvcLI91aRjxudvJYK4Dk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CFN9npdv63grB6TQR6B0/dVs5KFMndoN3ECpCKUkB51SkOaAkgKfCJPti306q4aUMyqndbEmVPFqvhZwT3QF25NwRMdWMm3g0e2HedTjx+lvqrbD8eHla6umZsDze5nZmH3jCGvXVd3nhGdAlcf1UgiliABKMHw7hieTrS2goa8aF3Q7WXmnBeNsar5D5ISF0Dbgw2Vmfe637iHOvq/gtWQRDjXTWl3jZsXS1WrBz8+hx+r2HjvzvGh3USUVmAQDuKOYbaCL3L0F2St3Ij7Qw0wNPUIbJfx4UW7M1ZKuNa+7MEG3pzZL/Vbp68BdQZ+GV7BNuccOxi+Ra28+DvUEJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S1ZFcJ5S; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S1ZFcJ5S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRDk40MHwz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 01:57:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5534FA42E81;
	Mon, 31 Mar 2025 14:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D434C4CEE9;
	Mon, 31 Mar 2025 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743433016;
	bh=Cm1Em4GVh5UN3KC7kQilCOySbGi3rdIYc+i4/iSCYXo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S1ZFcJ5SD66wA5lwxt/Mke2xihUTvVhzi5lTxYGwCj/Yq0lHiu1TkCE7uvLSyhRJ+
	 EefeokeNPLqwMTDFUkSiRNhqLk9zSfjR5kK5QM6DMboc1zNzJWiGzEjx7qh+4TJkvv
	 Pu6O9XQrjnP1kDjRFnMUuDrFYdzMY4BRGRbc2e2SmRDVXLqgfBCDKuybm1nExzgRZa
	 VeToPEj8sISu1C0OvL8llQzcuQiLKu91dB/Gc73I51NQsHGgV6ykKYPYpfByQC4b4k
	 wAu6XNrU2l5Q4Bu2SL/4xtZ98PpyuskrhR5CVMisjQU2G6TrbuHdjvFUUH3bC+7tr/
	 SyLjDvs5aEy4g==
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
Subject: [PATCH AUTOSEL 6.1 6/9] ASoC: fsl_audmix: register card device depends on 'dais' property
Date: Mon, 31 Mar 2025 10:56:39 -0400
Message-Id: <20250331145642.1706037-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250331145642.1706037-1-sashal@kernel.org>
References: <20250331145642.1706037-1-sashal@kernel.org>
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
X-stable-base: Linux 6.1.132
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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
index 672148dd4b234..acb499a5043c8 100644
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


