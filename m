Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E893F85E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 16:39:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ab63qm3S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXgwq2LPSz3cW3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 00:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ab63qm3S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXgXK5zRYz3cYq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 00:21:37 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id CEE8B240009;
	Mon, 29 Jul 2024 14:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1722262895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrOLWiN4Z4gUXHz3D+P5LAM+sQ2zdU0ZhJY0pukQIhM=;
	b=ab63qm3SgdCprnyo4hXCO7oG8HathVoPoFQp5BU4mqmZ0XJ1rT24AcMYSdCFbfWwPiBm8P
	kTUwQDK528dd/GbwgyCYQGkjHI6lSHtEi5xLcGQdYNmv5YMREf3bZXdb5mt78gjJ9+ivEW
	BO9PLzsSLAGi0vCKGLaYhx3XZcC0bhyti6Qw6wcOVUEEy4GmjUzG3jSpWZpZHwLSIypXq8
	fsLZcRfH9bHvaUMm92R9uSE2TVswmti9EnWHna/3U/VTN3rLLb6FhJci80qU9c5rGWFcfb
	vtdd6bKEYYwVaCAuRT+bp/dbRV44K1CkLrLzMmtF/j0XxOIlil3BPO46rd3enw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 28/36] soc: fsl: cpm1: qmc: Rename qmc_chan_command()
Date: Mon, 29 Jul 2024 16:20:57 +0200
Message-ID: <20240729142107.104574-29-herve.codina@bootlin.com>
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

Current code handles CPM1 version of QMC and qmc_chan_command() is
clearly CPM1 specific.

In order to prepare the support for the QUICC Engine (QE) version,
rename qmc_chan_command() to reflect that point.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index b95227378f97..272da250a763 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -794,7 +794,7 @@ static int qmc_chan_setup_tsa_rx(struct qmc_chan *chan, bool enable)
 	return qmc_chan_setup_tsa_32rx(chan, &info, enable);
 }
 
-static int qmc_chan_command(struct qmc_chan *chan, u8 qmc_opcode)
+static int qmc_chan_cpm1_command(struct qmc_chan *chan, u8 qmc_opcode)
 {
 	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
 }
@@ -813,7 +813,7 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
 	}
 
 	/* Send STOP RECEIVE command */
-	ret = qmc_chan_command(chan, 0x0);
+	ret = qmc_chan_cpm1_command(chan, 0x0);
 	if (ret) {
 		dev_err(chan->qmc->dev, "chan %u: Send STOP RECEIVE failed (%d)\n",
 			chan->id, ret);
@@ -850,7 +850,7 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
 	}
 
 	/* Send STOP TRANSMIT command */
-	ret = qmc_chan_command(chan, 0x1);
+	ret = qmc_chan_cpm1_command(chan, 0x1);
 	if (ret) {
 		dev_err(chan->qmc->dev, "chan %u: Send STOP TRANSMIT failed (%d)\n",
 			chan->id, ret);
-- 
2.45.0

