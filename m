Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F28597AAC2A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:16:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Wnmzg6aq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsQ8F6LTyz3hFn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:16:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Wnmzg6aq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.201; helo=relay8-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsPnx0psTz3ff8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 18:00:20 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 2184C1BF210;
	Fri, 22 Sep 2023 08:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695369618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BnfLJOmcIlZtdPTfQSCGu7hbf9EJc9MdEBjwblFr2LE=;
	b=Wnmzg6aqxpf8jeBHkfKm90cZCRxvByv1cnZHd89kBNF20uqVr24IrueKtiSPu89yQGk1hA
	4gZ1ULBcBLaIChw+p2BGnSSKPiwTWrG0d8ihVXD9kOS7NanD26egkd1A43cgCYDGpmFEby
	6mKdIwBC0Yuy+BitAub2lxFz6A7pbE00IMFP4De9v0RbkrklCC5TNB87l8uQO6dZ5pxhFJ
	sVKYwZcJl+ZjFsxeDG/iFqooGb4BSQdiol0ntBfYau1ySYgWGOFG4V8mChRBGLzMF0Cs+1
	fYCtWMGsLfQ7aDLyrxiN8V53X/YgIsuePMMSpREjh/l0lR6QsQXPJUJZWugJAg==
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
Subject: [PATCH v6 14/30] soc: fsl: cpm1: qmc: Introduce qmc_chan_setup_tsa*
Date: Fri, 22 Sep 2023 09:58:49 +0200
Message-ID: <20230922075913.422435-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230922075913.422435-1-herve.codina@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
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

Introduce the qmc_chan_setup_tsa* functions to setup entries related
to the given channel.
Use them during QMC channels setup.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 161 ++++++++++++++++++++++++++++++---------
 1 file changed, 125 insertions(+), 36 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 28acf4c8a141..8e8bd1942c08 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -240,6 +240,11 @@ static void qmc_clrbits16(void __iomem *addr, u16 clr)
 	qmc_write16(addr, qmc_read16(addr) & ~clr);
 }
 
+static void qmc_clrsetbits16(void __iomem *addr, u16 clr, u16 set)
+{
+	qmc_write16(addr, (qmc_read16(addr) & ~clr) | set);
+}
+
 static void qmc_write32(void __iomem *addr, u32 val)
 {
 	iowrite32be(val, addr);
@@ -562,6 +567,122 @@ static void qmc_chan_read_done(struct qmc_chan *chan)
 	spin_unlock_irqrestore(&chan->rx_lock, flags);
 }
 
+static int qmc_chan_setup_tsa_64rxtx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+{
+	unsigned int i;
+	u16 curr;
+	u16 val;
+
+	/*
+	 * Use a common Tx/Rx 64 entries table.
+	 * Tx and Rx related stuffs must be identical
+	 */
+	if (chan->tx_ts_mask != chan->rx_ts_mask) {
+		dev_err(chan->qmc->dev, "chan %u uses different Rx and Tx TS\n", chan->id);
+		return -EINVAL;
+	}
+
+	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
+
+	/* Check entries based on Rx stuff*/
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		curr = qmc_read16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2));
+		if (curr & QMC_TSA_VALID && (curr & ~QMC_TSA_WRAP) != val) {
+			dev_err(chan->qmc->dev, "chan %u TxRx entry %d already used\n",
+				chan->id, i);
+			return -EBUSY;
+		}
+	}
+
+	/* Set entries based on Rx stuff*/
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
+				 ~QMC_TSA_WRAP, val);
+	}
+
+	return 0;
+}
+
+static int qmc_chan_setup_tsa_32rx_32tx(struct qmc_chan *chan, const struct tsa_serial_info *info)
+{
+	unsigned int i;
+	u16 curr;
+	u16 val;
+
+	/* Use a Tx 32 entries table and a Rx 32 entries table */
+
+	val = QMC_TSA_VALID | QMC_TSA_MASK | QMC_TSA_CHANNEL(chan->id);
+
+	/* Check entries based on Rx stuff */
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		curr = qmc_read16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2));
+		if (curr & QMC_TSA_VALID && (curr & ~QMC_TSA_WRAP) != val) {
+			dev_err(chan->qmc->dev, "chan %u Rx entry %d already used\n",
+				chan->id, i);
+			return -EBUSY;
+		}
+	}
+	/* Check entries based on Tx stuff */
+	for (i = 0; i < info->nb_tx_ts; i++) {
+		if (!(chan->tx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		curr = qmc_read16(chan->qmc->scc_pram + QMC_GBL_TSATTX + (i * 2));
+		if (curr & QMC_TSA_VALID && (curr & ~QMC_TSA_WRAP) != val) {
+			dev_err(chan->qmc->dev, "chan %u Tx entry %d already used\n",
+				chan->id, i);
+			return -EBUSY;
+		}
+	}
+
+	/* Set entries based on Rx stuff */
+	for (i = 0; i < info->nb_rx_ts; i++) {
+		if (!(chan->rx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATRX + (i * 2),
+				 ~QMC_TSA_WRAP, val);
+	}
+	/* Set entries based on Tx stuff */
+	for (i = 0; i < info->nb_tx_ts; i++) {
+		if (!(chan->tx_ts_mask & (((u64)1) << i)))
+			continue;
+
+		qmc_clrsetbits16(chan->qmc->scc_pram + QMC_GBL_TSATTX + (i * 2),
+				 ~QMC_TSA_WRAP, val);
+	}
+
+	return 0;
+}
+
+static int qmc_chan_setup_tsa(struct qmc_chan *chan)
+{
+	struct tsa_serial_info info;
+	int ret;
+
+	/* Retrieve info from the TSA related serial */
+	ret = tsa_serial_get_info(chan->qmc->tsa_serial, &info);
+	if (ret)
+		return ret;
+
+	/*
+	 * Setup one common 64 entries table or two 32 entries (one for Tx
+	 * and one for Tx) according to assigned TS numbers.
+	 */
+	return ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) ?
+		qmc_chan_setup_tsa_64rxtx(chan, &info) :
+		qmc_chan_setup_tsa_32rx_32tx(chan, &info);
+}
+
 static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
 {
 	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
@@ -921,7 +1042,6 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 
 static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
-	struct qmc_chan *chan;
 	unsigned int i;
 	u16 val;
 
@@ -935,18 +1055,6 @@ static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *in
 	for (i = 0; i < 64; i++)
 		qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), 0x0000);
 
-	/* Set entries based on Rx stuff*/
-	list_for_each_entry(chan, &qmc->chan_head, list) {
-		for (i = 0; i < info->nb_rx_ts; i++) {
-			if (!(chan->rx_ts_mask & (((u64)1) << i)))
-				continue;
-
-			val = QMC_TSA_VALID | QMC_TSA_MASK |
-			      QMC_TSA_CHANNEL(chan->id);
-			qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), val);
-		}
-	}
-
 	/* Set Wrap bit on last entry */
 	qmc_setbits16(qmc->scc_pram + QMC_GBL_TSATRX + ((info->nb_rx_ts - 1) * 2),
 		      QMC_TSA_WRAP);
@@ -963,7 +1071,6 @@ static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *in
 
 static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
-	struct qmc_chan *chan;
 	unsigned int i;
 	u16 val;
 
@@ -978,28 +1085,6 @@ static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info
 		qmc_write16(qmc->scc_pram + QMC_GBL_TSATTX + (i * 2), 0x0000);
 	}
 
-	/* Set entries based on Rx and Tx stuff*/
-	list_for_each_entry(chan, &qmc->chan_head, list) {
-		/* Rx part */
-		for (i = 0; i < info->nb_rx_ts; i++) {
-			if (!(chan->rx_ts_mask & (((u64)1) << i)))
-				continue;
-
-			val = QMC_TSA_VALID | QMC_TSA_MASK |
-			      QMC_TSA_CHANNEL(chan->id);
-			qmc_write16(qmc->scc_pram + QMC_GBL_TSATRX + (i * 2), val);
-		}
-		/* Tx part */
-		for (i = 0; i < info->nb_tx_ts; i++) {
-			if (!(chan->tx_ts_mask & (((u64)1) << i)))
-				continue;
-
-			val = QMC_TSA_VALID | QMC_TSA_MASK |
-			      QMC_TSA_CHANNEL(chan->id);
-			qmc_write16(qmc->scc_pram + QMC_GBL_TSATTX + (i * 2), val);
-		}
-	}
-
 	/* Set Wrap bit on last entries */
 	qmc_setbits16(qmc->scc_pram + QMC_GBL_TSATRX + ((info->nb_rx_ts - 1) * 2),
 		      QMC_TSA_WRAP);
@@ -1081,6 +1166,10 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	chan->qmc = qmc;
 
+	ret = qmc_chan_setup_tsa(chan);
+	if (ret)
+		return ret;
+
 	/* Set channel specific parameter base address */
 	chan->s_param = qmc->dpram + (chan->id * 64);
 	/* 16 bd per channel (8 rx and 8 tx) */
-- 
2.41.0

