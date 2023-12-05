Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F01D58058A9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 16:29:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ouyRyNt5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl4FQ3C44z3dD2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 02:28:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ouyRyNt5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::222; helo=relay2-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl44x4nYWz3cWW
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 02:21:37 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 8D73140019;
	Tue,  5 Dec 2023 15:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701789694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sDL7N04gw5BRlFHTIZAz5PXmdYE8Pno1RSYn/SHVcJM=;
	b=ouyRyNt54e1mcTBloSV6JtW7i7S1zO4bPFu5CaE9zkCqiWEwSB8aE/OYMjkr2HOk3YEfeZ
	PfsS4jNuAiPkRrxngxdXDUdyNzsr09awPpj8nQWGnaDsdpwelx8yv5dvE095/aklXHnABf
	cPDMQvpQXS4H++q43Qyrdfmf2duFKkl4rIdE/AQEaVEN3MQBUwrMd9HLVVzwpZpvEOiEcF
	ej/bCfR8iYqjbVX/9mKDqZn4akkPUDp/LZTW7lB7mwr3vRZ/vPOySHWhii0TTExInozMdS
	kCBtNzNWSgC0oP8eXpicGjp6BoG1bUaOuVn+jGfe5eEgKQmspmCnisJ98QVLkQ==
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
Subject: [PATCH v2 08/17] soc: fsl: cpm1: qmc: Rename qmc_setup_tsa* to qmc_init_tsa*
Date: Tue,  5 Dec 2023 16:21:05 +0100
Message-ID: <20231205152116.122512-9-herve.codina@bootlin.com>
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
index 0413e25d4c67..e3f2afb8fa4d 100644
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
2.43.0

