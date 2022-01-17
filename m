Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8150949097C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 14:24:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jct192Ycwz3cPf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 00:24:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=YPyLSGZV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=collabora.com (client-ip=46.235.227.227;
 helo=bhuna.collabora.co.uk; envelope-from=ariel.dalessandro@collabora.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=YPyLSGZV; 
 dkim-atps=neutral
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcsxt3Npkz30QZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 00:21:54 +1100 (AEDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id B7ED71F439D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642425710;
 bh=jVy2ZoyycuiS4S7ICSr7v6N/6BqeqbOkelv81GUI3Eo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YPyLSGZVQCMiiyR4gGxztKCKj8+YvXGtun60zrrNLm87nWT7qB9prTaf/CZOSJ5PP
 mKshbaLW+kQe7J0Uyu2lVBIIGgsFbSOEHK3+i4ZVo3Li7o3gZyfRUfr+Zr/GN3put2
 EKgBW9J5ZjCWUs+DM0Yy5tKyZQGCAwgtJWE1YFKAX2dqrIk77PLflVB1ZK40UokjGZ
 N2uWzTgIVxQ7xg40oC/8N54ZjaYq1FjF6x10YP8QXWHV9ZJh45XgY5uCfwBqQlQ07j
 +sULxKH1xX54SvzS0YMQUyZnJHOToDlf/KExChYbIpdagVwjwoTq0qrunGl1OGwct6
 UDAGtTCob1yCA==
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/5] ASoC: fsl-asoc-card: Add optional dt property for
 setting mclk-id
Date: Mon, 17 Jan 2022 10:21:08 -0300
Message-Id: <20220117132109.283365-5-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
References: <20220117132109.283365-1-ariel.dalessandro@collabora.com>
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
Cc: ariel.dalessandro@collabora.com, kuninori.morimoto.gx@renesas.com,
 Xiubo.Lee@gmail.com, tony@atomide.com, shengjiu.wang@gmail.com, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz,
 nicoleotsuka@gmail.com, broonie@kernel.org, bcousson@baylibre.com,
 michael@amarulasolutions.com, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sound cards may allow using different main clock inputs. In the generic
fsl-asoc-card driver, these values are hardcoded for each specific card
configuration.

Let's make it more flexible, allowing setting mclk-id from the
device-tree node. Otherwise, the default value for each card
configuration is used.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index 5ee945505281..156d3c669274 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -693,6 +693,12 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		goto asrc_fail;
 	}
 
+	/*
+	 * Allow setting mclk-id from the device-tree node. Otherwise, the
+	 * default value for each card configuration is used.
+	 */
+	of_property_read_u32(np, "mclk-id", &priv->codec_priv.mclk_id);
+
 	/* Format info from DT is optional. */
 	snd_soc_daifmt_parse_clock_provider_as_phandle(np, NULL, &bitclkprovider, &frameprovider);
 	if (bitclkprovider || frameprovider) {
-- 
2.34.1

