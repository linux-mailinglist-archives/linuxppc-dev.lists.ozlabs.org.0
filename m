Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0212D93F7BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:26:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=P6VwFSKe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgfC6ZzMz3cjm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:26:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=P6VwFSKe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgX44h53z2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:23 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 69F4024000E;
	Mon, 29 Jul 2024 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0UTWDzz2CSi9594bsioUgKxsyX0iygtz1joM8J6wTqE=;
	b=P6VwFSKeNFRSfHeZeDQlilHGy7HvfNNvRBUGGz5G2ghJ6QYYuNOxNc9KxoF2A9wggV60sp
	IstR9obpPlbrNbQqgyR6wAgj+hUQiePxAvur2b6Xb1t0gRefivdWpPjDxpF5hv7TwL9M3Y
	p0OZOMsWE4YV8Ih8CxBp+LGzi0ehR5JklSJoHAZxOMi0uWhrdAHuvm+ObabKR7jB9lx462
	PQVRUfpmUjCdRx2g9s+qgvqyw+z4K/sQJNMahkLv5FykBUtqy1EdnlcQAvhtDgmbmXk7dI
	/sJk8ToTtwmaAVdEedQ9doGLXQs3ilGKXwEsPa6qAlXu83SxT6Y2RWYO5Lgv2A==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 02/36] soc: fsl: cpm1: qmc: Enable TRNSYNC only when needed
Date: Mon, 29 Jul 2024 16:20:31 +0200
Message-ID: <20240729142107.104574-3-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240729142107.104574-1-herve.codina@bootlin.com>
References: <20240729142107.104574-1-herve.codina@bootlin.com>
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TRNSYNC feature is enabled whatever the number of time-slots used.
The feature is needed only when more than one time-slot is used.

Improve the driver enabling TRNSYNC only when it is needed.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index bacabf731dcb..916395745850 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -889,6 +889,7 @@ EXPORT_SYMBOL(qmc_chan_stop);
 static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
 {
 	struct tsa_serial_info info;
+	unsigned int w_rx, w_tx;
 	u16 first_rx, last_tx;
 	u16 trnsync;
 	int ret;
@@ -898,6 +899,14 @@ static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
 	if (ret)
 		return ret;
 
+	w_rx = hweight64(chan->rx_ts_mask);
+	w_tx = hweight64(chan->tx_ts_mask);
+	if (w_rx <= 1 && w_tx <= 1) {
+		dev_dbg(qmc->dev, "only one or zero ts -> disable trnsync\n");
+		qmc_clrbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_TRANSP_SYNC);
+		return 0;
+	}
+
 	/* Find the first Rx TS allocated to the channel */
 	first_rx = chan->rx_ts_mask ? __ffs64(chan->rx_ts_mask) + 1 : 0;
 
@@ -911,6 +920,7 @@ static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
 		trnsync |= QMC_SPE_TRNSYNC_TX((last_tx % info.nb_tx_ts) * 2);
 
 	qmc_write16(chan->s_param + QMC_SPE_TRNSYNC, trnsync);
+	qmc_setbits16(chan->s_param + QMC_SPE_CHAMR, QMC_SPE_CHAMR_TRANSP_SYNC);
 
 	dev_dbg(qmc->dev, "chan %u: trnsync=0x%04x, rx %u/%u 0x%llx, tx %u/%u 0x%llx\n",
 		chan->id, trnsync,
@@ -1378,7 +1388,7 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 	if (chan->mode == QMC_TRANSPARENT) {
 		qmc_write32(chan->s_param + QMC_SPE_ZDSTATE, 0x18000080);
 		qmc_write16(chan->s_param + QMC_SPE_TMRBLR, 60);
-		val = QMC_SPE_CHAMR_MODE_TRANSP | QMC_SPE_CHAMR_TRANSP_SYNC;
+		val = QMC_SPE_CHAMR_MODE_TRANSP;
 		if (chan->is_reverse_data)
 			val |= QMC_SPE_CHAMR_TRANSP_RD;
 		qmc_write16(chan->s_param + QMC_SPE_CHAMR, val);
-- 
2.45.0

