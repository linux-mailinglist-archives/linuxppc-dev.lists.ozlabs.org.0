Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2ED8805899
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 16:26:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=aLiE+WIn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl4Bb3GF4z3d8N
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 02:26:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=aLiE+WIn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl44x45K7z3cVS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 02:21:36 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 5018140010;
	Tue,  5 Dec 2023 15:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oTsZ03wdLe2jX7b5CbBFQq2qQh274AFtQjsKmPdMnuY=;
	b=aLiE+WIn02wlJInTUmiuNrEeMsfvNJmP7q6RldXeW/G25MZb729t/cgIKuJGxVcNsU3gKt
	yvZzMFxGU9YZnZlfEWiKTD2RNIxQBJuokUuPgJ53ASN2X9Xw96NIn4WbdG1dph+GCwb2kK
	ppWks68v0d9y3Z3jSX5BA89LGb3MeRs4ewEchlwZbuP87dhRmffbmoxQHRNLY4oZcY5RJS
	WCl9khI+xSADBPielBK1VtS5RH0IhUSdhUS+WptRYPunN0Yhjkg/0bqdgOyaCwOsIPxy8O
	IIXvHo61rc+Cb2+RlLo/yINWTHchEu1t/jJ03IIwDhkW8fZ3Y/+iVpp0nYyJbA==
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
Subject: [PATCH v2 04/17] soc: fsl: cpm1: qmc: Extend the API to provide Rx status
Date: Tue,  5 Dec 2023 16:21:01 +0100
Message-ID: <20231205152116.122512-5-herve.codina@bootlin.com>
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

In HDLC mode, some status flags related to the data read transfer can be
set by the hardware and need to be known by a QMC consumer for further
analysis.

Extend the API in order to provide these transfer status flags at the
read complete() call.

In TRANSPARENT mode, these flags have no meaning. Keep only one read
complete() API and update the consumers working in transparent mode.
In this case, the newly introduced flags parameter is simply unused.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c      | 29 +++++++++++++++++++++++++----
 include/soc/fsl/qe/qmc.h      | 15 ++++++++++++++-
 sound/soc/fsl/fsl_qmc_audio.c |  2 +-
 3 files changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 2312152a44b3..4b4832d93c9b 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -166,7 +166,7 @@
 struct qmc_xfer_desc {
 	union {
 		void (*tx_complete)(void *context);
-		void (*rx_complete)(void *context, size_t length);
+		void (*rx_complete)(void *context, size_t length, unsigned int flags);
 	};
 	void *context;
 };
@@ -421,7 +421,8 @@ static void qmc_chan_write_done(struct qmc_chan *chan)
 }
 
 int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
-			 void (*complete)(void *context, size_t length), void *context)
+			 void (*complete)(void *context, size_t length, unsigned int flags),
+			 void *context)
 {
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
@@ -454,6 +455,10 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 	xfer_desc->rx_complete = complete;
 	xfer_desc->context = context;
 
+	/* Clear previous status flags */
+	ctrl &= ~(QMC_BD_RX_L | QMC_BD_RX_F | QMC_BD_RX_LG | QMC_BD_RX_NO |
+		  QMC_BD_RX_AB | QMC_BD_RX_CR);
+
 	/* Activate the descriptor */
 	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
 	wmb(); /* Be sure to flush data before descriptor activation */
@@ -485,7 +490,7 @@ EXPORT_SYMBOL(qmc_chan_read_submit);
 
 static void qmc_chan_read_done(struct qmc_chan *chan)
 {
-	void (*complete)(void *context, size_t size);
+	void (*complete)(void *context, size_t size, unsigned int flags);
 	struct qmc_xfer_desc *xfer_desc;
 	unsigned long flags;
 	cbd_t __iomem *bd;
@@ -527,7 +532,23 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 
 		if (complete) {
 			spin_unlock_irqrestore(&chan->rx_lock, flags);
-			complete(context, datalen);
+
+			/*
+			 * Avoid conversion between internal hardware flags and
+			 * the software API flags.
+			 * -> Be sure that the software API flags are consistent
+			 *    with the hardware flags
+			 */
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_LAST  != QMC_BD_RX_L);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_FIRST != QMC_BD_RX_F);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_OVF   != QMC_BD_RX_LG);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_UNA   != QMC_BD_RX_NO);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_ABORT != QMC_BD_RX_AB);
+			BUILD_BUG_ON(QMC_RX_FLAG_HDLC_CRC   != QMC_BD_RX_CR);
+
+			complete(context, datalen,
+				 ctrl & (QMC_BD_RX_L | QMC_BD_RX_F | QMC_BD_RX_LG |
+					 QMC_BD_RX_NO | QMC_BD_RX_AB | QMC_BD_RX_CR));
 			spin_lock_irqsave(&chan->rx_lock, flags);
 		}
 
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 3c61a50d2ae2..6f1d6cebc9fe 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -9,6 +9,7 @@
 #ifndef __SOC_FSL_QMC_H__
 #define __SOC_FSL_QMC_H__
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device_node;
@@ -56,8 +57,20 @@ int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param
 int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 			  void (*complete)(void *context), void *context);
 
+/* Flags available (ORed) for read complete() flags parameter in HDLC mode.
+ * No flags are available in transparent mode and the read complete() flags
+ * parameter has no meaning in transparent mode.
+ */
+#define QMC_RX_FLAG_HDLC_LAST	BIT(11) /* Last in frame */
+#define QMC_RX_FLAG_HDLC_FIRST	BIT(10) /* First in frame */
+#define QMC_RX_FLAG_HDLC_OVF	BIT(5)  /* Data overflow */
+#define QMC_RX_FLAG_HDLC_UNA	BIT(4)  /* Unaligned (ie. bits received not multiple of 8) */
+#define QMC_RX_FLAG_HDLC_ABORT	BIT(3)  /* Received an abort sequence (seven consecutive ones) */
+#define QMC_RX_FLAG_HDLC_CRC	BIT(2)  /* CRC error */
+
 int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
-			 void (*complete)(void *context, size_t length),
+			 void (*complete)(void *context, size_t length,
+					  unsigned int flags),
 			 void *context);
 
 #define QMC_CHAN_READ  (1<<0)
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 56d6b0b039a2..bfaaa451735b 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -99,7 +99,7 @@ static void qmc_audio_pcm_write_complete(void *context)
 	snd_pcm_period_elapsed(prtd->substream);
 }
 
-static void qmc_audio_pcm_read_complete(void *context, size_t length)
+static void qmc_audio_pcm_read_complete(void *context, size_t length, unsigned int flags)
 {
 	struct qmc_dai_prtd *prtd = context;
 	int ret;
-- 
2.43.0

