Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5641CF291
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 12:34:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LvLd54Z4zDqsX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 20:34:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LvJX1SVqzDqlZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 20:32:41 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 72DE0200F2E;
 Tue, 12 May 2020 12:32:37 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E6ABC200F8B;
 Tue, 12 May 2020 12:32:32 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0D4E9402BC;
 Tue, 12 May 2020 18:32:26 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_asrc: Set ASR76K and ASR56K based on processing
 clock
Date: Tue, 12 May 2020 18:22:59 +0800
Message-Id: <1589278979-31008-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The processing clock is different for platforms, so it is better
to set ASR76K and ASR56K based on processing clock, rather than
hard coding the value for them.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Mihai Serban <mihai.serban@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 067a54ab554f..ca926915068f 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -858,6 +858,8 @@ static const struct regmap_config fsl_asrc_regmap_config = {
  */
 static int fsl_asrc_init(struct fsl_asrc *asrc)
 {
+	unsigned long ipg_rate;
+
 	/* Halt ASRC internal FP when input FIFO needs data for pair A, B, C */
 	regmap_write(asrc->regmap, REG_ASRCTR, ASRCTR_ASRCEN);
 
@@ -875,11 +877,14 @@ static int fsl_asrc_init(struct fsl_asrc *asrc)
 	regmap_update_bits(asrc->regmap, REG_ASRTFR1,
 			   ASRTFR1_TF_BASE_MASK, ASRTFR1_TF_BASE(0xfc));
 
-	/* Set the processing clock for 76KHz to 133M */
-	regmap_write(asrc->regmap, REG_ASR76K, 0x06D6);
-
-	/* Set the processing clock for 56KHz to 133M */
-	return regmap_write(asrc->regmap, REG_ASR56K, 0x0947);
+	/*
+	 * Set the period of the 76KHz and 56KHz sampling clocks based on
+	 * the ASRC processing clock.
+	 * On iMX6, ipg_clk = 133MHz, REG_ASR76K = 0x06D6, REG_ASR56K = 0x0947
+	 */
+	ipg_rate = clk_get_rate(asrc->ipg_clk);
+	regmap_write(asrc->regmap, REG_ASR76K, ipg_rate / 76000);
+	return regmap_write(asrc->regmap, REG_ASR56K, ipg_rate / 56000);
 }
 
 /**
-- 
2.21.0

