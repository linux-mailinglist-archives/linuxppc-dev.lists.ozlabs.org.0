Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51267328D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 08:35:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyDtX2tcCz3fCr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 18:35:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZPg7krRc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Uk88ARAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZPg7krRc;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=Uk88ARAj;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyDsb0QRHz3bvZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 18:34:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674113667; x=1705649667;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s94IzfBcezUwrrXvkeXbHYzla1KnXTUynqvpSNJ59RI=;
  b=ZPg7krRccg/FE+GEPGc+CSYdka1Ekk07Px+PQCG0jVm6KFlhWLmdEV4S
   ULAv+PG6bOsvcafKrg56XCBwXyLKXmVBeYl5nNFl9FThlLK8cjH9AuVs0
   f/UqL/7gPJUSSxv+DLYenNGCOQ8QSEOzE9n2W/x1fq96+PGTnkM67rhcf
   rc7Az10AOGhWQPlAc72NIylM3DP/a1HAMeKVVlZ9NyXsiWMdkpoAr42+9
   GUakXLw75M7U36TM5oz110onqa6xvdc9DDrdTlCqtEnYdFfzyu1T9IEWM
   SYiH2ijkgqhMhgfJpL+t3dMrkvnmc5akltyjbXSrK7ySPQGSkChYv9lHH
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; 
   d="scan'208";a="28520959"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 08:34:20 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 08:34:20 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 08:34:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674113660; x=1705649660;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=s94IzfBcezUwrrXvkeXbHYzla1KnXTUynqvpSNJ59RI=;
  b=Uk88ARAj4LAJjXbqgehHSp08D5NjYOd82SLwdcb7QLhxQf+8l5fULH2w
   jUlknjpLUxLXfVXgNSyy5NHsb1PYKmH0ePb2/4Gj6EJDVY4rmhWNRvfeo
   cdNB8BRb0u90yMwcqn9k9UYiTU6IscLDoZiyu93pvDgQWHNc58qN6Cufa
   /+NMTLS3ZK7xQWxovMebD+2yASNoYNcAYqUHmnsRjnhwRc5iR3yjvslki
   SF+xxj8HNonlA+sI10ZjcV/rlWx7iaI2UksR2rVC7uX56MqlTdAvTWE5U
   Aea3vrDVeW1BQW2fLAGgR1dADhYp/qfNMLgIOAW0Gk0vEdbymOdD8PG3g
   A==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; 
   d="scan'208";a="28520958"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 08:34:19 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7508A280056;
	Thu, 19 Jan 2023 08:34:19 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 1/1] ASoC: imx-hdmi: Use dev_err_probe
Date: Thu, 19 Jan 2023 08:34:16 +0100
Message-Id: <20230119073416.3064918-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, Alexander Stein <alexander.stein@ew.tq-group.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This silences -517 errors and helps figuring out why the device probe
is deferred.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 sound/soc/fsl/imx-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index a780cf5a65ffa..b6cc7e6c2a320 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -202,7 +202,7 @@ static int imx_hdmi_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(&data->card, data);
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
+		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
 		goto fail;
 	}
 
-- 
2.34.1

