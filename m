Return-Path: <linuxppc-dev+bounces-1684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B72989A88
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 08:31:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHB6X04Rmz2yK9;
	Mon, 30 Sep 2024 16:31:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727677875;
	cv=none; b=OtzAjD2/frlpMPhLLW8xkyQythDuQTR5gQrQkxxQIT9aLtkPZD9sA0qIQCOACKnWmpQXHHg3vf1o7jBpxZmzVNviq3HwaCv4FtMYWOy7KGDQEtSQyXS6kv6F6C1McXclNVgKvGWDyEQYusx+TgD2yNojKQrkc+8Mprp35Rujl4SKTNt8fPXIe0St91mPa0kZnbr9tIdHq6pCV92KxGOIFmeSuvQtVflq5qc4q935IRiIPy6yxsXkXraefDSrKHPoJ60tLhd/SxokNaeeXzXebpqYwW1VTfJKd3ZRey88sAsSzEscBLi4n9ETHmmMOBMzryNj/tkzz8X64Tqde6/xmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727677875; c=relaxed/relaxed;
	bh=w3u+rBUek+XTdqKOnouvjqneODRITqXAUEaOu1gCgC0=;
	h=From:To:Subject:Date:Message-Id; b=SII5El7ZhpaCx/w7RQnMN+389oahxU0pZ5ZMBrWXZ8fo37Ig7MDypyLODNSn3LywRkB/wC1/SG1V5Lbnao/dqoCB2Rnrvx5Xi3AHp0ktreYhNjL2oPW/zecRRjb93qI6sqmSUeJdHu+tIZqk9JNMoLRLbUPbWHfw7vIK4rOxUP8kv/AUMsflWI1JdOJ++/ru6WeL1hvhbebOwKohuHxB8cpM6r6NM4wxYwj13zKbXXhwo3pTMt6gR6xJwofvgB/NOvnktVO8jZUP4XdAI0VtS+woD3vtm73qHzTLw5YnVvpqeWlvFDbkuxxOmaWahOmQoP4RgJe4pBAhISeYgk5bIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHB6W17Glz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 16:31:14 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9616B1A016A;
	Mon, 30 Sep 2024 08:31:11 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5E53A1A1780;
	Mon, 30 Sep 2024 08:31:11 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C0556183DC04;
	Mon, 30 Sep 2024 14:31:09 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_sai: Enable 'FIFO continue on error' FCONT bit
Date: Mon, 30 Sep 2024 14:08:28 +0800
Message-Id: <1727676508-22830-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

FCONT=1 means On FIFO error, the SAI will continue from the
same word that caused the FIFO error to set after the FIFO
warning flag has been cleared.

Set FCONT bit in control register to avoid the channel swap
issue after SAI xrun.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_sai.c | 5 ++++-
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ab58a4461073..634168d2bb6e 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -613,6 +613,9 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
 
+	/* Set to avoid channel swap */
+	val_cr4 |= FSL_SAI_CR4_FCONT;
+
 	/* Set to output mode to avoid tri-stated data pins */
 	if (tx)
 		val_cr4 |= FSL_SAI_CR4_CHMOD;
@@ -699,7 +702,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR4(tx, ofs),
 			   FSL_SAI_CR4_SYWD_MASK | FSL_SAI_CR4_FRSZ_MASK |
-			   FSL_SAI_CR4_CHMOD_MASK,
+			   FSL_SAI_CR4_CHMOD_MASK | FSL_SAI_CR4_FCONT_MASK,
 			   val_cr4);
 	regmap_update_bits(sai->regmap, FSL_SAI_xCR5(tx, ofs),
 			   FSL_SAI_CR5_WNW_MASK | FSL_SAI_CR5_W0W_MASK |
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index dadbd16ee394..9c4d19fe22c6 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -137,6 +137,7 @@
 
 /* SAI Transmit and Receive Configuration 4 Register */
 
+#define FSL_SAI_CR4_FCONT_MASK	BIT(28)
 #define FSL_SAI_CR4_FCONT	BIT(28)
 #define FSL_SAI_CR4_FCOMB_SHIFT BIT(26)
 #define FSL_SAI_CR4_FCOMB_SOFT  BIT(27)
-- 
2.34.1


