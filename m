Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FB37B14B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:23:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Qih0cEeJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx4hz4vm7z3fNX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:23:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Qih0cEeJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx4M42cPrz3cRR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:08:16 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id C80C120002;
	Thu, 28 Sep 2023 07:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VsO/shW7GdAWiIRATyL5QAf+hh5aGcox3ohTh+0Qx8Q=;
	b=Qih0cEeJEeoaHZBRH0rdEwfUl8JqGAkp3ERik5aXr22HRHdlGcMJQ+ELiSEf8cGfEsBD7e
	xDHmoL9rltoFyWCy9DYxrZ4afZdz2flx140ha5LVlkDUWVUrYeX+aF5XRDRgMassnnj7Sd
	NvvBPDdaBsE+FHwW3qGj7w4umuzA12MtJH1V7xNYg/r3WuV8/+wkGEl+fz+zPP9W/ByBHr
	rHnq+8Osd+915niqJazC8EsepK1QTzxBBNSSsIl5/NLWAn+hLbhQfTnGpncECN3IZLQfKC
	vd5m8yvpEgTRG2Cux5Hi38dGbF7du6YbpAOu2H5jDrzO43uJfeB+pSG60co8SA==
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
Subject: [PATCH v7 19/30] soc: fsl: cpm1: qmc: Introduce is_tsa_64rxtx flag
Date: Thu, 28 Sep 2023 09:06:37 +0200
Message-ID: <20230928070652.330429-20-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928070652.330429-1-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
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

In order to support runtime timeslot route changes, some operations will
be different according the routing table used (common Rx and Tx table or
one table for Rx and one for Tx).

The is_tsa_64rxtx flag is introduced to avoid extra computation to
determine the table format each time we need it.
It is set once at initialization.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index eeceb81bf107..19acfcded9bc 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -216,6 +216,7 @@ struct qmc {
 	u16 __iomem *int_curr;
 	dma_addr_t int_dma_addr;
 	size_t int_size;
+	bool is_tsa_64rxtx;
 	struct list_head chan_head;
 	struct qmc_chan *chans[64];
 };
@@ -696,7 +697,7 @@ static int qmc_chan_setup_tsa(struct qmc_chan *chan, bool enable)
 	 * Setup one common 64 entries table or two 32 entries (one for Tx
 	 * and one for Tx) according to assigned TS numbers.
 	 */
-	if (info.nb_tx_ts > 32 || info.nb_rx_ts > 32)
+	if (chan->qmc->is_tsa_64rxtx)
 		return qmc_chan_setup_tsa_64rxtx(chan, &info, enable);
 
 	ret = qmc_chan_setup_tsa_32rx(chan, &info, enable);
@@ -1053,6 +1054,7 @@ static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *in
 	 * Everything was previously checked, Tx and Rx related stuffs are
 	 * identical -> Used Rx related stuff to build the table
 	 */
+	qmc->is_tsa_64rxtx = true;
 
 	/* Invalidate all entries */
 	for (i = 0; i < 64; i++)
@@ -1081,6 +1083,7 @@ static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info
 	 * Use a Tx 32 entries table and a Rx 32 entries table.
 	 * Everything was previously checked.
 	 */
+	qmc->is_tsa_64rxtx = false;
 
 	/* Invalidate all entries */
 	for (i = 0; i < 32; i++) {
-- 
2.41.0

