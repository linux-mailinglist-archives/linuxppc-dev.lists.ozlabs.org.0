Return-Path: <linuxppc-dev+bounces-1637-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 235FD988039
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2024 10:23:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFNlB6vBcz2yyq;
	Fri, 27 Sep 2024 18:23:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727425398;
	cv=none; b=akX5BxoyldG/Lo310bcmk0WwEPketR7lxSubariI/6K1sX05v/dUec+7pLDzyZ7sNaU4cwkMIUApsNfF3twvuqLrrFnU5XYv+f8ykFHQESFZziwRVbm974CKHJ38WRkf7fRs0aMnTmqu3t4XIqJH5M8Am9gkR86evxwFwpRHG28Cq2QRVht8IzEbomYNO+o+ArZ1ZUtZJq9GKdpb+JIgwdUoXxZt7ew8XY6/8Kx+Ts9LreL805DeebOL3zj2SlWcwxENHN4B4STBuU+QLU/NmL/wA0OBN0ZckU08o74P5Ioz6CD/lGd5lrB0Rdw01GAbCjE3QFQGgabUcIEx7MoRGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727425398; c=relaxed/relaxed;
	bh=r+WhuCCPTIUFSLfeWYZ6uwvbHERF0G6Zf5yhnqvfbhw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References; b=BFIrB/OE6jfliwIJ8F1JPiU9s3Duo7db6V2yXWHs7omUGTNKRletdwIIyL9aYhj67WekCu3oVWXsQEBUZvKVJTUz+PIpfK1bNAb84fkC0wnxxV/9rWfLndBYXm0iI58boTAWCmhHk8J3UAvMzcWmPgBckpFBW1+RUGZLDT+Si5gZsrUQwgHDKxLO3zZ6/y2YlyXWh4/qpg/ZRaFRFxa6+XeFSIx5umNUwVgaLy5dnr6/RrVVVxPIuuKbgkZrw4yfZS/ScsDzWqS5ChIbP6/Ngc2v0QpQYAVKvQtW2JKPUjIxGi2iAjHLkr1iD+zYN7+mQ8EKu4QZh7XvV8n7F/6Gtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFNlB4LPJz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2024 18:23:18 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EC9A2201A2A;
	Fri, 27 Sep 2024 10:23:15 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B0453201A52;
	Fri, 27 Sep 2024 10:23:15 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 18AAD183DC03;
	Fri, 27 Sep 2024 16:23:14 +0800 (+08)
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
Subject: [PATCH 3/3] ASoC: fsl_micfil: Enable micfil error interrupt
Date: Fri, 27 Sep 2024 16:00:31 +0800
Message-Id: <1727424031-19551-4-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727424031-19551-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Enable micfil error interrupt, in the error handler,
FIFO state and OUT state need to be cleared.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 6ecf46e9ac4c..0930d8c9b8d7 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -651,7 +651,7 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		/* Enable the module */
 		ret = regmap_set_bits(micfil->regmap, REG_MICFIL_CTRL1,
-				      MICFIL_CTRL1_PDMIEN);
+				      MICFIL_CTRL1_PDMIEN | MICFIL_CTRL1_ERREN);
 		if (ret)
 			return ret;
 
@@ -667,7 +667,7 @@ static int fsl_micfil_trigger(struct snd_pcm_substream *substream, int cmd,
 
 		/* Disable the module */
 		ret = regmap_clear_bits(micfil->regmap, REG_MICFIL_CTRL1,
-					MICFIL_CTRL1_PDMIEN);
+					MICFIL_CTRL1_PDMIEN | MICFIL_CTRL1_ERREN);
 		if (ret)
 			return ret;
 
@@ -940,6 +940,7 @@ static bool fsl_micfil_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case REG_MICFIL_STAT:
+	case REG_MICFIL_FIFO_STAT:
 	case REG_MICFIL_DATACH0:
 	case REG_MICFIL_DATACH1:
 	case REG_MICFIL_DATACH2:
@@ -948,6 +949,7 @@ static bool fsl_micfil_volatile_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DATACH5:
 	case REG_MICFIL_DATACH6:
 	case REG_MICFIL_DATACH7:
+	case REG_MICFIL_OUT_STAT:
 	case REG_MICFIL_VERID:
 	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_STAT:
@@ -1024,6 +1026,8 @@ static irqreturn_t micfil_err_isr(int irq, void *devid)
 {
 	struct fsl_micfil *micfil = (struct fsl_micfil *)devid;
 	struct platform_device *pdev = micfil->pdev;
+	u32 fifo_stat_reg;
+	u32 out_stat_reg;
 	u32 stat_reg;
 
 	regmap_read(micfil->regmap, REG_MICFIL_STAT, &stat_reg);
@@ -1040,6 +1044,14 @@ static irqreturn_t micfil_err_isr(int irq, void *devid)
 				  MICFIL_STAT_LOWFREQF, MICFIL_STAT_LOWFREQF);
 	}
 
+	regmap_read(micfil->regmap, REG_MICFIL_FIFO_STAT, &fifo_stat_reg);
+	regmap_write_bits(micfil->regmap, REG_MICFIL_FIFO_STAT,
+			  fifo_stat_reg, fifo_stat_reg);
+
+	regmap_read(micfil->regmap, REG_MICFIL_OUT_STAT, &out_stat_reg);
+	regmap_write_bits(micfil->regmap, REG_MICFIL_OUT_STAT,
+			  out_stat_reg, out_stat_reg);
+
 	return IRQ_HANDLED;
 }
 
-- 
2.34.1


