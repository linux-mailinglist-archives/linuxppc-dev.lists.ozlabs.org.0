Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE57484B29
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 00:30:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT83f25gxz2xBl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 10:30:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alyssa.is header.i=@alyssa.is header.a=rsa-sha256 header.s=fm2 header.b=OZiaGNwz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=G0uiJfQ9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=x220.qyliss.net (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=qyliss@x220.qyliss.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alyssa.is header.i=@alyssa.is header.a=rsa-sha256
 header.s=fm2 header.b=OZiaGNwz; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=G0uiJfQ9; 
 dkim-atps=neutral
X-Greylist: delayed 474 seconds by postgrey-1.36 at boromir;
 Wed, 05 Jan 2022 00:30:54 AEDT
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JStmG0lBXz2x9W
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 00:30:53 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7010458037E;
 Tue,  4 Jan 2022 08:22:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 04 Jan 2022 08:22:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alyssa.is; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=x5C85cwYmXa+FbDexCIyc1oYxS
 CbENr7yiJVmNRGzGA=; b=OZiaGNwzJOshvmTiENK8tHDvOHOgYTtTRd0zpnlNwF
 eTV3bybRCpJMDDMiUt4S8WkGMZ1oFWOhAUrmJcm6rrJAciJl6gqnt6ErWuT+QRNI
 5PZEPhgmKF9cqT1OmFA33/5zABM6cm9l8+O0nd+wGN/8STs5Wv/41j0xSN5oGCwQ
 F358kbVLaSF2B8Gd2CJDlEJgON1UeDNq4dN8Vb7yKmAOPzXEZZTuTUISGP65IHC8
 3WSHLm0NbiBVtAUykWcZrQEsX6a8lSQtUlZpqECNQyuje0uIvjAuObe7+6X4/lrW
 5r9RgI4+S1Ibnuy7ic3Qrd7TpEX7tw/boXlztIF6PEsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=x5C85cwYmXa+FbDex
 CIyc1oYxSCbENr7yiJVmNRGzGA=; b=G0uiJfQ9XWC2aY+QBWnNQjZ7s6b2hNagp
 XAZc7AO3DH/rQTMoDRbcuii40aPt/3TO7SqpRn67SfL4qEg1KJCQxeQfWu7dFEbp
 QkYJfEs2fekEsCLz/vLQh/GnR9bgk2x4jbiZ/6arQcjYMpHR7PaQR5z3Yj7mkVvf
 lpV6Ba0nMjfTr5M6ekpXOK9P0gJxXNBs2c83Q/vaLzMsJYPW7wPKvr5Clr9Bmpp/
 N2DtWW2gjpGBuaEjr7+qm2Xjl9WKhWzuVO33Nv7kWJ5dgWOF+Vmf6YYSAMVAkF5z
 O+2CZZLrzu8H0tAvduXfnldeZd+Rt0ubNLjM58+9tWlpLBev3XsiA==
X-ME-Sender: <xms:L0rUYRNOSDzWNI9dQ_pPE9njYjzHtrSWG_gJMcqGC-BZ-x-JY90VgA>
 <xme:L0rUYT9saFwoccwFMLW0K14QBUaHTcLt0YfAaAcVT2SLAzx3_M1_VP7yVXWbCsKUh
 6s3njwvpHwRvpPRQA>
X-ME-Received: <xmr:L0rUYQQJK43rj0fw4yfL1QRwWgl8zrxlzNArcs5oWnUtPNiKF465XoaAvDXcYsWysqzfam4fgkqrB2mOVtwf1iBOXwMCj7WU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudeffedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetlhihshhsrgcu
 tfhoshhsuceohhhisegrlhihshhsrgdrihhsqeenucggtffrrghtthgvrhhnpeehvdffgf
 fhteeijefgteeftdfghfdvheeuhedvjedugfeggfeljefgleefvefgfeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehqhihlihhsshesgidvvd
 dtrdhqhihlihhsshdrnhgvth
X-ME-Proxy: <xmx:L0rUYdva_9Gc3MQ2ChA80KQ2O9fV5u8_alech2-Lgxe13x5NU82VXQ>
 <xmx:L0rUYZe1uDDxKkJ1DNCWjHETo0B4bhuo0U0WPeItOjaTbUN59ol70g>
 <xmx:L0rUYZ2X5YtEuB17piUBoiA1cejCFHHtIRIwA7WEU7VWmVJizNX87w>
 <xmx:L0rUYV5o_bkLvxd1srFu7dI1thDZGtTT27oBG8-E37Yfzxdo8I5QmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Jan 2022 08:22:54 -0500 (EST)
Received: by x220.qyliss.net (Postfix, from userid 1000)
 id D1C8B3D3; Tue,  4 Jan 2022 13:22:53 +0000 (UTC)
From: Alyssa Ross <hi@alyssa.is>
To: Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_mqs: fix MODULE_ALIAS
Date: Tue,  4 Jan 2022 13:22:16 +0000
Message-Id: <20220104132218.1690103-1-hi@alyssa.is>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 05 Jan 2022 10:29:31 +1100
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
Cc: Alyssa Ross <hi@alyssa.is>,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:FREESCALE SOC SOUND DRIVERS" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

modprobe can't handle spaces in aliases.

Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
Signed-off-by: Alyssa Ross <hi@alyssa.is>
---
 sound/soc/fsl/fsl_mqs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 27b4536dce44..ceaecbe3a25e 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -337,4 +337,4 @@ module_platform_driver(fsl_mqs_driver);
 MODULE_AUTHOR("Shengjiu Wang <Shengjiu.Wang@nxp.com>");
 MODULE_DESCRIPTION("MQS codec driver");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS("platform: fsl-mqs");
+MODULE_ALIAS("platform:fsl-mqs");

base-commit: c9e6606c7fe92b50a02ce51dda82586ebdf99b48
-- 
2.33.0

