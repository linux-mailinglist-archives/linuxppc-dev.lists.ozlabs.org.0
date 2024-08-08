Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA6794B7D3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 09:27:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Pgf5Qw6D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfdsR20pgz3cjm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:27:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=Pgf5Qw6D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::226; helo=relay6-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfdWw4m9Fz3dXT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 17:11:56 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 603F2C0004;
	Thu,  8 Aug 2024 07:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723101114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjqvInV++CElrxkmHy5Fprr8fbtF8RDwM+F8J2U6FCo=;
	b=Pgf5Qw6DP4Nb2S9kBDwXwOYAsOIn6OxZSGWjYy5qWu5+GyyFURmbxhKuYUfsAKAOK3N3mZ
	DcI9soaRI6zULMiU8yJSrDG7jDG4Dy5Yb4qzq0crwLDLQRxuUeZkddmykalom9c/GojClx
	ljqPQkb9xAftkoyzBCyMdtByuWAvfSnaUkqSsWNOlZmy5KpPAG9qveL6IYNtryWF+0Tv9e
	Hm4QdcuZv53Xghq43l/CaOnHy88oSfQ6BzEDyIT2NIQ2y0KpyKq/aUkKl2/jZwtyU7MA5O
	gl7TFhe/hwTdi6UGJkENy+kmGrRBZl51aOeL0Cn96r+oukBE2ouy1p3Y3NCNRg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 20/36] soc: fsl: cpm1: qmc: Remove unneeded parenthesis
Date: Thu,  8 Aug 2024 09:11:13 +0200
Message-ID: <20240808071132.149251-21-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240808071132.149251-1-herve.codina@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
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

