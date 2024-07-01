Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD5D91DE2F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 13:38:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QT8erB9g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCPDc0hYbz3cB2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 21:38:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=QT8erB9g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCP5c6NJKz3dHG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 21:32:04 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 65EA0240004;
	Mon,  1 Jul 2024 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719833522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YDLRcTY0BkTaFAdlLFjztJqIMTmDai9TLYinXM16row=;
	b=QT8erB9gCf6OWkg7I6bDNvSwNHrlZgWewAb/9E6bxyHgTRCqj2DNQZFNSOaK+ddE7EkNU5
	jxbm2hC72zLFhJ3/KQF480Glzu92tNXYsL9yyhfIXf2cQ/oWJG1G1jLWjhBNgQD3Yznk/5
	tseXa4zkp148CetvvWDLVuqw3Gvwgh3otEYTaDYPHfjxJ6gkOLYkdcONzryFfWuYO909oT
	7WybA9ia1UvUI1jQECS5En7l0ppFDRxfQmkGLcnHJrc/s7w+RZTKvukKsg7WA8A67bj5Q2
	t5ImicTFkaiRPQBVPJDCKPqDh+LPY1cP/XWhxPE4VAohS5ZM9RXw5M4CfTW4Pg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 08/10] soc: fsl: cpm1: qmc: Introduce qmc_chan_count_phandles()
Date: Mon,  1 Jul 2024 13:30:35 +0200
Message-ID: <20240701113038.55144-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No function in the QMC API is available to get the number of phandles
present in a phandle list.

Fill this lack introducing qmc_chan_count_phandles().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 13 +++++++++++++
 include/soc/fsl/qe/qmc.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index e23d60018400..76bb496305a0 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -1777,6 +1777,19 @@ static struct qmc_chan *qmc_chan_get_from_qmc(struct device_node *qmc_np, unsign
 	return qmc_chan;
 }
 
+int qmc_chan_count_phandles(struct device_node *np, const char *phandles_name)
+{
+	int count;
+
+	/* phandles are fixed args phandles with one arg */
+	count = of_count_phandle_with_args(np, phandles_name, NULL);
+	if (count < 0)
+		return count;
+
+	return count / 2;
+}
+EXPORT_SYMBOL(qmc_chan_count_phandles);
+
 struct qmc_chan *qmc_chan_get_byphandles_index(struct device_node *np,
 					       const char *phandles_name,
 					       int index)
diff --git a/include/soc/fsl/qe/qmc.h b/include/soc/fsl/qe/qmc.h
index 0fa7205145ce..294e42ea8d4c 100644
--- a/include/soc/fsl/qe/qmc.h
+++ b/include/soc/fsl/qe/qmc.h
@@ -16,6 +16,8 @@ struct device_node;
 struct device;
 struct qmc_chan;
 
+int qmc_chan_count_phandles(struct device_node *np, const char *phandles_name);
+
 struct qmc_chan *qmc_chan_get_byphandles_index(struct device_node *np,
 					       const char *phandles_name,
 					       int index);
-- 
2.45.0

