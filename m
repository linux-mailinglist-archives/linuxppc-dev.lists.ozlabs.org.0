Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACAD93F82A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:35:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=blT9bINO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgqt24Hjz3cM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:35:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=blT9bINO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXD1GHjz3cY1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:31 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 20A06240009;
	Mon, 29 Jul 2024 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjqvInV++CElrxkmHy5Fprr8fbtF8RDwM+F8J2U6FCo=;
	b=blT9bINO0h9Sj/5UKq8Mw6GMNM9k7Gk1dFojZrr8xeE79IMXP6NDEbdpw6a6Re4iCy1Mtp
	Um6oDqA7/qXTFnZy3OlcTjuumS1fMxU9KTcBWZo8oVRvAv8TQ/OlsFiP/1lvYePxRqVUC3
	kfaQTNLa/DFfOQFXaq5ZNSPfTFqyP1e93iKGWeLjgfbikqGApjsT3CNXtCRa9R66v40Djx
	Nl/fLi2KEimx3o4QG0gwy4ZO/noFQ6DFOdkviKDVNRgQCBurUKk86e3278ZjcikK8EWz5H
	IrlCFyfumX3GDAmFe/34iTOhcqMvIykiIVm5ttnmJmunHqd41lMNFuRpKXT+yA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 20/36] soc: fsl: cpm1: qmc: Remove unneeded parenthesis
Date: Mon, 29 Jul 2024 16:20:49 +0200
Message-ID: <20240729142107.104574-21-herve.codina@bootlin.com>
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

checkpatch.pl raises the following issue in several places
  CHECK: Unnecessary parenthesis around ...

Remove them.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 44bd9b949770..04466e735302 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -359,8 +359,8 @@ int qmc_chan_set_param(struct qmc_chan *chan, const struct qmc_chan_param *param
 
 	switch (param->mode) {
 	case QMC_HDLC:
-		if ((param->hdlc.max_rx_buf_size % 4) ||
-		    (param->hdlc.max_rx_buf_size < 8))
+		if (param->hdlc.max_rx_buf_size % 4 ||
+		    param->hdlc.max_rx_buf_size < 8)
 			return -EINVAL;
 
 		qmc_write16(chan->qmc->scc_pram + QMC_GBL_MRBLR,
@@ -1152,7 +1152,7 @@ static int qmc_check_chans(struct qmc *qmc)
 	if (ret)
 		return ret;
 
-	if ((info.nb_tx_ts > 64) || (info.nb_rx_ts > 64)) {
+	if (info.nb_tx_ts > 64 || info.nb_rx_ts > 64) {
 		dev_err(qmc->dev, "Number of TSA Tx/Rx TS assigned not supported\n");
 		return -EINVAL;
 	}
@@ -1161,7 +1161,7 @@ static int qmc_check_chans(struct qmc *qmc)
 	 * If more than 32 TS are assigned to this serial, one common table is
 	 * used for Tx and Rx and so masks must be equal for all channels.
 	 */
-	if ((info.nb_tx_ts > 32) || (info.nb_rx_ts > 32)) {
+	if (info.nb_tx_ts > 32 || info.nb_rx_ts > 32) {
 		if (info.nb_tx_ts != info.nb_rx_ts) {
 			dev_err(qmc->dev, "Number of TSA Tx/Rx TS assigned are not equal\n");
 			return -EINVAL;
-- 
2.45.0

