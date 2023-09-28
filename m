Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5557B1499
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:18:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lgo/+sMb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx4bF2gM0z3dg1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 17:18:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=lgo/+sMb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::227; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx4Lf3FwMz3cQ4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:07:54 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7006E2000A;
	Thu, 28 Sep 2023 07:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rzUuWhRDgVHjZPWx1zQHs1eer0WBNpuWBkiimoMaxFw=;
	b=lgo/+sMbNKR8FUs+k0YGES8609sZQ8EVlN/mC6Zdsx4rRChoAg6ozS7353s+QR9OE2TqyO
	okbyDW4C6uJ8TF2rizlfrqIkcVWuGJF5igTVV2CgJqmVi/PrgUuvZO3FmKSjbIs8Wlru2y
	clG7fj3k7ToQgtP0Dclv/mzh6Zp0telWZwoBD4FcQODyjUqVUARAy7bDoOSmyZ55zItYR8
	VCy/5Sc2/mtN0U47OoK5DSxVs5o320TpqVKtpLOj/o8KBll1vrO626x5sALoPGPMKzwnPo
	sB/5yJNe40+8A50nH2cYJpq5aLx4cx6YB/2RnLrbKma2wEN3fnUFU8A5G4HqKw==
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
Subject: [PATCH v7 13/30] soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to qmc_init_tsa*
Date: Thu, 28 Sep 2023 09:06:31 +0200
Message-ID: <20230928070652.330429-14-herve.codina@bootlin.com>
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

qmc_setup_tsa* are called once at initialisation.
They initialize the QMC TSA table.
In order to introduce setup function later on for dynamic timeslots
management, rename the function to avoid later confusion.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 653d458b84b6..28acf4c8a141 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -919,7 +919,7 @@ static int qmc_of_parse_chans(struct qmc *qmc, struct device_node *np)
 	return qmc_check_chans(qmc);
 }
 
-static int qmc_setup_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *info)
+static int qmc_init_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
 	struct qmc_chan *chan;
 	unsigned int i;
@@ -961,7 +961,7 @@ static int qmc_setup_tsa_64rxtx(struct qmc *qmc, const struct tsa_serial_info *i
 	return 0;
 }
 
-static int qmc_setup_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info *info)
+static int qmc_init_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info *info)
 {
 	struct qmc_chan *chan;
 	unsigned int i;
@@ -1019,7 +1019,7 @@ static int qmc_setup_tsa_32rx_32tx(struct qmc *qmc, const struct tsa_serial_info
 	return 0;
 }
 
-static int qmc_setup_tsa(struct qmc *qmc)
+static int qmc_init_tsa(struct qmc *qmc)
 {
 	struct tsa_serial_info info;
 	int ret;
@@ -1030,12 +1030,12 @@ static int qmc_setup_tsa(struct qmc *qmc)
 		return ret;
 
 	/*
-	 * Setup one common 64 entries table or two 32 entries (one for Tx and
-	 * one for Tx) according to assigned TS numbers.
+	 * Initialize one common 64 entries table or two 32 entries (one for Tx
+	 * and one for Tx) according to assigned TS numbers.
 	 */
 	return ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) ?
-		qmc_setup_tsa_64rxtx(qmc, &info) :
-		qmc_setup_tsa_32rx_32tx(qmc, &info);
+		qmc_init_tsa_64rxtx(qmc, &info) :
+		qmc_init_tsa_32rx_32tx(qmc, &info);
 }
 
 static int qmc_setup_chan_trnsync(struct qmc *qmc, struct qmc_chan *chan)
@@ -1391,7 +1391,7 @@ static int qmc_probe(struct platform_device *pdev)
 	qmc_write32(qmc->scc_pram + QMC_GBL_C_MASK32, 0xDEBB20E3);
 	qmc_write16(qmc->scc_pram + QMC_GBL_C_MASK16, 0xF0B8);
 
-	ret = qmc_setup_tsa(qmc);
+	ret = qmc_init_tsa(qmc);
 	if (ret)
 		goto err_tsa_serial_disconnect;
 
-- 
2.41.0

