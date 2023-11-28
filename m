Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFCC7FBC86
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Nov 2023 15:16:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KPyUdJ0x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SfkzM3DVkz3vyk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 01:16:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=KPyUdJ0x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::223; helo=relay3-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sfknx2rsHz3cW3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 01:08:36 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPA id 37C2A6000F;
	Tue, 28 Nov 2023 14:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701180509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+2B6YUVBlU8nP98Gi7Yh575FhYxDZUhvB/s29okN5tk=;
	b=KPyUdJ0xO7QWgygD02j0RNLseVzKNmRyniX4pOsSzvLlzuUuMQRqgowuUQuXn8r9WrlEWq
	Wen3h3xoZwcrt6FBc8214Lbfy0X/PMyqfE/aQtW+vtLzJfqgafT0kf2FMafIcp4PB1f/PP
	GS+BOTEXJTXv4fsL+D9IAaR6m4Og6xtpjrOch/FfToMGIg3ECBsnFXIE3bE38L+WqPpClm
	E2zk6rVYgJI48bUQGCXFH+/Xjf+ooEs/kjpAwKzY345On6Ct8GuwwLWscfQlyd9ZhLBA3W
	NeZxWVFfNBn2DUmbghqIfoKK9dkUZVWR1UuW1azKzn80VDk7XxB3Ni37NzDerA==
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
Subject: [PATCH 06/17] soc: fsl: cpm1: qmc: Add support for child devices
Date: Tue, 28 Nov 2023 15:08:05 +0100
Message-ID: <20231128140818.261541-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128140818.261541-1-herve.codina@bootlin.com>
References: <20231128140818.261541-1-herve.codina@bootlin.com>
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

QMC child devices support is needed to avoid orphan DT nodes that use a
simple DT phandle to reference a QMC channel.

Allow to instantiate child devices and also extend the API to get the
qmc_chan using a child device.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 91 +++++++++++++++++++++++++++++++---------
 include/soc/fsl/qe/qmc.h |  2 +
 2 files changed, 73 insertions(+), 20 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 27f2f16deac9..e716f13669a0 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1425,8 +1425,16 @@ static int qmc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qmc);
 
+	/* Populate channel related devices */
+	ret = devm_of_platform_populate(qmc->dev);
+	if (ret)
+		goto err_disable_txrx;
+
 	return 0;
 
+err_disable_txrx:
+	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
+
 err_disable_intr:
 	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
 
@@ -1465,26 +1473,16 @@ static struct platform_driver qmc_driver = {
 };
 module_platform_driver(qmc_driver);
 
-struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+static struct qmc_chan *qmc_chan_get_from_qmc(struct device_node *qmc_np, unsigned int chan_index)
 {
-	struct of_phandle_args out_args;
 	struct platform_device *pdev;
 	struct qmc_chan *qmc_chan;
 	struct qmc *qmc;
-	int ret;
 
-	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
-					       &out_args);
-	if (ret < 0)
-		return ERR_PTR(ret);
-
-	if (!of_match_node(qmc_driver.driver.of_match_table, out_args.np)) {
-		of_node_put(out_args.np);
+	if (!of_match_node(qmc_driver.driver.of_match_table, qmc_np))
 		return ERR_PTR(-EINVAL);
-	}
 
-	pdev = of_find_device_by_node(out_args.np);
-	of_node_put(out_args.np);
+	pdev = of_find_device_by_node(qmc_np);
 	if (!pdev)
 		return ERR_PTR(-ENODEV);
 
@@ -1494,17 +1492,12 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
-	if (out_args.args_count != 1) {
+	if (chan_index >= ARRAY_SIZE(qmc->chans)) {
 		platform_device_put(pdev);
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (out_args.args[0] >= ARRAY_SIZE(qmc->chans)) {
-		platform_device_put(pdev);
-		return ERR_PTR(-EINVAL);
-	}
-
-	qmc_chan = qmc->chans[out_args.args[0]];
+	qmc_chan = qmc->chans[chan_index];
 	if (!qmc_chan) {
 		platform_device_put(pdev);
 		return ERR_PTR(-ENOENT);
@@ -1512,8 +1505,44 @@ struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phan
 
 	return qmc_chan;
 }
+
+struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name)
+{
+	struct of_phandle_args out_args;
+	struct qmc_chan *qmc_chan;
+	int ret;
+
+	ret = of_parse_phandle_with_fixed_args(np, phandle_name, 1, 0,
+					       &out_args);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	if (out_args.args_count != 1) {
+		of_node_put(out_args.np);
+		return ERR_PTR(-EINVAL);
+	}
+
+	qmc_chan = qmc_chan_get_from_qmc(out_args.np, out_args.args[0]);
+	of_node_put(out_args.np);
+	return qmc_chan;
+}
 EXPORT_SYMBOL(qmc_chan_get_byphandle);
 
+struct qmc_chan *qmc_chan_get_bychild(struct device_node *np)
+{
+	struct device_node *qmc_np;
+	u32 chan_index;
+	int ret;
+
+	qmc_np = np->parent;
+	ret = of_property_read_u32(np, "reg", &chan_index);
+	if (ret)
+		return ERR_PTR(-EINVAL);
+
+	return qmc_chan_get_from_qmc(qmc_np, chan_index);
+}
+EXPORT_SYMBOL(qmc_chan_get_bychild);
+
 void qmc_chan_put(struct qmc_chan *chan)
 {
 	put_device(chan->qmc->dev);
@@ -1550,6 +1579,28 @@ struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev,
 }
 EXPORT_SYMBOL(devm_qmc_chan_get_byphandle);
 
+struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev,
+					   struct device_node *np)
+{
+	struct qmc_chan *qmc_chan;
+	struct qmc_chan **dr;
+
+	dr = devres_alloc(devm_qmc_chan_release, sizeof(*dr), GFP_KERNEL);
+	if (!dr)
+		return ERR_PTR(-ENOMEM);
+
+	qmc_chan = qmc_chan_get_bychild(np);
+	if (!IS_ERR(qmc_chan)) {
+		*dr = qmc_chan;
+		devres_add(dev, dr);
+	} else {
+		devres_free(dr);
+	}
+
+	return qmc_chan;
+}
+EXPORT_SYMBOL(devm_qmc_chan_get_bychild);
+
 MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
 MODULE_DESCRIPTION("CPM QMC driver");
 MODULE_LICENSE("GPL");
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 6f1d6cebc9fe..166484bb4294 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -17,9 +17,11 @@ struct device;
 struct qmc_chan;
 
 struct qmc_chan *qmc_chan_get_byphandle(struct device_node *np, const char *phandle_name);
+struct qmc_chan *qmc_chan_get_bychild(struct device_node *np);
 void qmc_chan_put(struct qmc_chan *chan);
 struct qmc_chan *devm_qmc_chan_get_byphandle(struct device *dev, struct device_node *np,
 					     const char *phandle_name);
+struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev, struct device_node *np);
 
 enum qmc_mode {
 	QMC_TRANSPARENT,
-- 
2.42.0

