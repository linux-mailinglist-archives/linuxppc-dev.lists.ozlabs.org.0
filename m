Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9E46BCFA8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 13:39:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcmzM59lTz3f3w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 23:39:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=N5k/cE1G;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZTtwAnQd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=alexander.stein@ew.tq-group.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=N5k/cE1G;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=ZTtwAnQd;
	dkim-atps=neutral
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcmxQ34Tmz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 23:37:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970250; x=1710506250;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=optA/elZmJXfhAeNRT+3b55PWRJaR5Rj/yChsqibYps=;
  b=N5k/cE1GKeBunOkW6Xx70mTJf/0Yyk0LyhQljABpHiWIbvUU7MJJcybi
   JqK+E0B+frl6ZEvYHhqPQXZo+Kj8269WLsE2sxqrXrKXsQVgzz3HFMy1f
   00elBK9DEhPD1Qcj+k6aQnnMJsGjoB6VxnWjlnADcNrk4xDfN14AyFYlR
   Ap568Zq1BK+O4HQ3u37FQoJmU8SlKYm4YUIqGvOeQb9LJxVpuaYCZI3mt
   dHSnTgNQwujrOfs976Br0NPjLF5Crj2pVkkqW3AM3h0UNIBIL2iSipkIs
   S/YLKl7eV198YZ9xKOfGxtIuCktibrP6FxYhRwjTNrGbrfIMdAM0MW/O+
   g==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29738031"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Mar 2023 13:36:16 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 16 Mar 2023 13:36:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1678970176; x=1710506176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=optA/elZmJXfhAeNRT+3b55PWRJaR5Rj/yChsqibYps=;
  b=ZTtwAnQd86/PaC7gY3AzVeB6Crjf44BQGc5Jn2mRK2fe9bfxhIvVOIXg
   rEZdcWwOTamlOzNxNODK7tGCRQEYFoKn93Wa75Kz0cxsyHtV2OvHVNiRc
   x5bHMW5XZcc3csRFXPCC2UBPR9NoCSZv38v1GGOdYXoTilA92t5pNNQO+
   fRiCowL0/TI6xWv5fiKDL52VJETJlK4X/zjMp0aMQkEERlga4uIZ/hdFQ
   gPCQBXsR6KuYIFtjO/5splFV6zs/xW00iBzy+NK0NeaA/EnGW2ffBF2I0
   xpE3XTE/QyHqg8wzpl+OYJ8khguKEIGtCN8ckz22ZF0cZMnnG96LEwdq2
   w==;
X-IronPort-AV: E=Sophos;i="5.98,265,1673910000"; 
   d="scan'208";a="29738029"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Mar 2023 13:36:16 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 845EB280072;
	Thu, 16 Mar 2023 13:36:16 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 2/2] ASoC: fsl: Specify driver name in ASoC card
Date: Thu, 16 Mar 2023 13:36:11 +0100
Message-Id: <20230316123611.3495597-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
References: <20230316123611.3495597-1-alexander.stein@ew.tq-group.com>
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Set the snd_soc_card driver name which fixes the warning:
fsl-asoc-card sound: ASoC: driver name too long 'imx-audio-tlv320aic32x4'
-> 'imx-audio-tlv32'

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
These patches could be squashed, but I opted for separation this patch
is the actual functional change. Patch 1 is just preparation.

 sound/soc/fsl/fsl-asoc-card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index e956abfd50f8..bffa1048d31e 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -609,6 +609,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 
 	priv->card.dapm_routes = audio_map;
 	priv->card.num_dapm_routes = ARRAY_SIZE(audio_map);
+	priv->card.driver_name = DRIVER_NAME;
 	/* Diversify the card configurations */
 	if (of_device_is_compatible(np, "fsl,imx-audio-cs42888")) {
 		codec_dai_name = "cs42888";
-- 
2.34.1

