Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A8179CE22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 12:22:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FQTNnrDw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlKQ12v1Jz3dH1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 20:22:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FQTNnrDw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlKFB25TBz3cQP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 20:14:20 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id E0154E0007;
	Tue, 12 Sep 2023 10:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694513654;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bo77X4QhyMa+RhWCIVhgBdOcejnTibSqBkLKVKa3Png=;
	b=FQTNnrDwvWAPtAztyNBiE0lto/S8poSgFrLUuuJUte43hpU8nKZh7DEb1tFHqYvUfqja6c
	YDoDjHhPMDZEpSBzSSfkxzbMLHCjWAwDLuOi9AJCsQjlnmbiNZ1eK+UfI5QuXP2gbY4+v4
	XTZ9I1LgSEy4gN6hKyuXEiFlqiJTDKkv4c/3ciiUjxjw0fpX5pNSBiQJfcjx/hx7E++UHJ
	3bjVelhLLngONEksVMEC8eqehBibxmoI1Hw+raT06tW0b1hYyZeSwwiTLZpIz2b8j2gfBi
	8hNKr/Xj7OMBWm1aElyj8Kp4817kshNhlC6uLtKVzeOxqLATZTmUX5S/bA6SnA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5 20/31] soc: fsl: cpm1: qmc: Handle timeslot entries at channel start() and stop()
Date: Tue, 12 Sep 2023 12:14:07 +0200
Message-ID: <20230912101407.225677-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912081527.208499-1-herve.codina@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Simon Horman <horms@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to support runtime timeslot route changes, enable the
channel timeslot entries at channel start() and disable them at
channel stop().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 175 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 163 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 19acfcded9bc..185e6e87a83f 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -177,6 +177,7 @@ struct qmc_chan {
 	struct qmc *qmc;
 	void __iomem *s_param;
 	enum qmc_mode mode;
+	spinlock_t	ts_lock; /* Protect timeslots */
 	u64	tx_ts_mask_avail;
 	u64	tx_ts_mask;
 	u64	rx_ts_mask_avail;
@@ -265,6 +266,7 @@ static void qmc_setbits32(void __iomem *addr, u32 set)
 int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 {
 	struct tsa_serial_info tsa_info;
+	unsigned long flags;
 	int ret;
 
 	/* Retrieve info from the TSA related serial */
@@ -272,6 +274,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 	if (ret)
 		return ret;
 
+	spin_lock_irqsave(&chan->ts_lock, flags);
+
 	info->mode = chan->mode;
 	info->rx_fs_rate = tsa_info.rx_fs_rate;
 	info->rx_bit_rate = tsa_info.rx_bit_rate;
@@ -280,6 +284,8 @@ int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
 	info->tx_bit_rate = tsa_info.tx_bit_rate;
 	info->nb_rx_ts = hweight64(chan->rx_ts_mask);
 
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+
 	return 0;
 }
 EXPORT_SYMBOL(qmc_chan_get_info);
@@ -683,6 +689,40 @@ static int qmc_chan_setup_tsa_32tx(struct qmc_chan *chan, const struct tsa_seria
 	return 0;
 }
 
+static int qmc_chan_setup_tsa_tx(struct qmc_chan *chan, bool enable)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/* Setup entries */
+	if (chan->qmc->is_tsa_64rxtx)
+		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
+
+	return qmc_chan_setup_tsa_32tx(chan, &info, enable);
+}
+
+static int qmc_chan_setup_tsa_rx(struct qmc_chan *chan, bool enable)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/* Setup entries */
+	if (chan->qmc->is_tsa_64rxtx)
+		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
+
+	return qmc_chan_setup_tsa_32rx(chan, &info, enable);
+}
+
 static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
 {
 	struct tsa_serial_info info;
@@ -719,6 +759,12 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
 
+	if (chan->is_rx_stopped) {
+		/* The channel is already stopped -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
 	/* Send STOP RECEIVE command */
 	ret = qmc_chan_command(chan, 0x0);
 	if (ret) {
@@ -729,6 +775,15 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
 
 	chan->is_rx_stopped = true;
 
+	if (!chan->qmc->is_tsa_64rxtx || chan->is_tx_stopped) {
+		ret = qmc_chan_setup_tsa_rx(chan, false);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: Disable tsa entries failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
+	}
+
 end:
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 	return ret;
@@ -741,6 +796,12 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
 
+	if (chan->is_tx_stopped) {
+		/* The channel is already stopped -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
 	/* Send STOP TRANSMIT command */
 	ret = qmc_chan_command(chan, 0x1);
 	if (ret) {
@@ -751,37 +812,82 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
 
 	chan->is_tx_stopped = true;
 
+	if (!chan->qmc->is_tsa_64rxtx || chan->is_rx_stopped) {
+		ret = qmc_chan_setup_tsa_tx(chan, false);
+		if (ret) {
+			dev_err(chan->qmc->dev, "chan %u: Disable tsa entries failed (%d)\n",
+				chan->id, ret);
+			goto end;
+		}
+	}
+
 end:
 	spin_unlock_irqrestore(&chan->tx_lock, flags);
 	return ret;
 }
 
+static int qmc_chan_start_rx(struct qmc_chan *chan);
+
 int qmc_chan_stop(struct qmc_chan *chan, int direction)
 {
-	int ret;
+	bool is_rx_rollback_needed = false;
+	unsigned long flags;
+	int ret = 0;
+
+	spin_lock_irqsave(&chan->ts_lock, flags);
 
 	if (direction & QMC_CHAN_READ) {
+		is_rx_rollback_needed = !chan->is_rx_stopped;
 		ret = qmc_chan_stop_rx(chan);
 		if (ret)
-			return ret;
+			goto end;
 	}
 
 	if (direction & QMC_CHAN_WRITE) {
 		ret = qmc_chan_stop_tx(chan);
-		if (ret)
-			return ret;
+		if (ret) {
+			/* Restart rx if needed */
+			if (is_rx_rollback_needed)
+				qmc_chan_start_rx(chan);
+			goto end;
+		}
 	}
 
-	return 0;
+end:
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+	return ret;
 }
 EXPORT_SYMBOL(qmc_chan_stop);
 
-static void qmc_chan_start_rx(struct qmc_chan *chan)
+static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan);
+
+static int qmc_chan_start_rx(struct qmc_chan *chan)
 {
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->rx_lock, flags);
 
+	if (!chan->is_rx_stopped) {
+		/* The channel is already started -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
+	ret = qmc_chan_setup_tsa_rx(chan, true);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Enable tsa entries failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
 	/* Restart the receiver */
 	if (chan->mode == QMC_TRANSPARENT)
 		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
@@ -792,15 +898,38 @@ static void qmc_chan_start_rx(struct qmc_chan *chan)
 
 	chan->is_rx_stopped = false;
 
+end:
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
+	return ret;
 }
 
-static void qmc_chan_start_tx(struct qmc_chan *chan)
+static int qmc_chan_start_tx(struct qmc_chan *chan)
 {
 	unsigned long flags;
+	int ret;
 
 	spin_lock_irqsave(&chan->tx_lock, flags);
 
+	if (!chan->is_tx_stopped) {
+		/* The channel is already started -> simply return ok */
+		ret = 0;
+		goto end;
+	}
+
+	ret = qmc_chan_setup_tsa_tx(chan, true);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: Enable tsa entries failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
+	ret = qmc_setup_chan_trnsync(chan->qmc, chan);
+	if (ret) {
+		dev_err(chan->qmc->dev, "chan %u: setup TRNSYNC failed (%d)\n",
+			chan->id, ret);
+		goto end;
+	}
+
 	/*
 	 * Enable channel transmitter as it could be disabled if
 	 * qmc_chan_reset() was called.
@@ -812,18 +941,39 @@ static void qmc_chan_start_tx(struct qmc_chan *chan)
 
 	chan->is_tx_stopped = false;
 
+end:
 	spin_unlock_irqrestore(&chan->tx_lock, flags);
+	return ret;
 }
 
 int qmc_chan_start(struct qmc_chan *chan, int direction)
 {
-	if (direction & QMC_CHAN_READ)
-		qmc_chan_start_rx(chan);
+	bool is_rx_rollback_needed = false;
+	unsigned long flags;
+	int ret = 0;
 
-	if (direction & QMC_CHAN_WRITE)
-		qmc_chan_start_tx(chan);
+	spin_lock_irqsave(&chan->ts_lock, flags);
 
-	return 0;
+	if (direction & QMC_CHAN_READ) {
+		is_rx_rollback_needed = chan->is_rx_stopped;
+		ret = qmc_chan_start_rx(chan);
+		if (ret)
+			goto end;
+	}
+
+	if (direction & QMC_CHAN_WRITE) {
+		ret = qmc_chan_start_tx(chan);
+		if (ret) {
+			/* Restop rx if needed */
+			if (is_rx_rollback_needed)
+				qmc_chan_stop_rx(chan);
+			goto end;
+		}
+	}
+
+end:
+	spin_unlock_irqrestore(&chan->ts_lock, flags);
+	return ret;
 }
 EXPORT_SYMBOL(qmc_chan_start);
 
@@ -992,6 +1142,7 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 		}
 
 		chan->id = chan_id;
+		spin_lock_init(&chan->ts_lock);
 		spin_lock_init(&chan->rx_lock);
 		spin_lock_init(&chan->tx_lock);
 
-- 
2.41.0

