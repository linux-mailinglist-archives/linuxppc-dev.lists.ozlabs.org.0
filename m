Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BEE8058C1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 16:32:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CyT2iGlY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl4KC3V1Kz3vpQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 02:32:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=CyT2iGlY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl4510V4Cz3cbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 02:21:40 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5FBE040022;
	Tue,  5 Dec 2023 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QoU7y55/I3BQVSdVPYqfFTvOraYh5xPo9IDt6uWoLuY=;
	b=CyT2iGlYWxxqHyi9WoXDZ5ouOkCDjLCL/iFuvsY6QC7AtlUDYGf8R7wYSFIEIJ6DM7V13V
	gntzpmtKxiNxKA5RNOB602JseySyuyj8vIbiR5aFjJ0QSOis3wDA6GbrFd4gL+AP0qT4kR
	0tIabLVrs1PJJl0xe7QLXPqIQXmiLa7dtErGJ3axJUSve+j9Jsfsu1rvso1KdXZeUgf45X
	BcImfj4smVETJ/vk4DqY1rMBPNR7FmXfE96EXyqT+4ui3XTa0N+Q8dl/Y0/J5V0CytseVF
	ydZMlpbIQi5ka6u1IIaEIPNNKPMCGQ0iY/DzV9qmFCVtt+85Log9eD70biUsXA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 12/17] soc: fsl: cpm1: qmc: Add support for disabling channel TSA entries
Date: Tue,  5 Dec 2023 16:21:09 +0100
Message-ID: <20231205152116.122512-13-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205152116.122512-1-herve.codina@bootlin.com>
References: <20231205152116.122512-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to allow runtime timeslot route changes, disabling channel TSA
entries needs to be supported.

Add support for this new feature.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 8d71e63d0f21..c1318fad296b 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -567,7 +567,8 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 }
 
-static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_serial_info *info,
+				     bool enable)
 {
 	unsigned int i;
 	u16 curr;
@@ -603,13 +604,14 @@ static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_ser
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
-				 ~QMC_TSA_WRAP, val);
+				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 
 	return 0;
 }
 
-static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_serial_info *info,
+					bool enable)
 {
 	unsigned int i;
 	u16 curr;
@@ -650,7 +652,7 @@ static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
-				 ~QMC_TSA_WRAP, val);
+				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 	/* Set entries based on Tx stuff */
 	for (i = 0; i < info->nb_tx_ts; i++) {
@@ -658,13 +660,13 @@ static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_
 			continue;
 
 		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATTX + (i * 2),
-				 ~QMC_TSA_WRAP, val);
+				 ~QMC_TSA_WRAP, enable ? val : 0x0000);
 	}
 
 	return 0;
 }
 
-static int qmc_chan_setup_tsa(struct qmc_chan *chan)
+static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
 {
 	struct tsa_serial_info info;
 	int ret;
@@ -679,8 +681,8 @@ static int qmc_chan_setup_tsa(struct qmc_chan *chan)
 	 * and one for Tx) according to assigned TS numbers.
 	 */
 	return ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) ?
-		qmc_chan_setup_tsa_64rxtx(chan, &info) :
-		qmc_chan_setup_tsa_32rx_32tx(chan, &info);
+		qmc_chan_setup_tsa_64rxtx(chan, &info, enable) :
+		qmc_chan_setup_tsa_32rx_32tx(chan, &info, enable);
 }
 
 static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
@@ -1146,7 +1148,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	chan->qmc = qmc;
 
-	ret = qmc_chan_setup_tsa(chan);
+	ret = qmc_chan_setup_tsa(chan, true);
 	if (ret)
 		return ret;
 
-- 
2.43.0

