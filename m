Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C206AE207
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 15:18:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWHcV60wxz3f3w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 01:18:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LJYUoewX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::231; helo=relay11.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=LJYUoewX;
	dkim-atps=neutral
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWHY11cXqz3cjb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 01:15:48 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 6D13110000C;
	Tue,  7 Mar 2023 14:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678198546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tebCh8O5AMYYSpkVrb+eHWhJxKEZvKSu3HtDndY/Qyc=;
	b=LJYUoewXDQBs6tICfbNh9lgrLeF62H5WYhjteP5kSPSvsvKne24IBbid3CAfdmgWLAz+AL
	4lKh9D2sJnyyVrtpxqyrg1/iyySC0EDpC84+GOgqfiOQpPl4Z6KcFYIGZSZODJEtVJ5xm6
	/K1SwrCfns/bfGN0zg42AOThla9oZuqtHa0D9Drl/zEgYmAzkI4Sem6xgJte77NHt4Ylgu
	5yb9Im7yOIY4wga+tj1QI1KS3RP8p1KZ8tyW4piC3OoSSTE5zZqBw4sBiww3Q4tHfPBuUi
	7a3r4umW1aiqDPRFzDnqL2xlWE+bCwsAXgwMI+1H6e9jVD0Cnrn7SRth3+Bhxg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH 3/3] soc: fsl: cpm1: qmc: Fix assigned timeslot masks
Date: Tue,  7 Mar 2023 15:15:03 +0100
Message-Id: <20230307141503.159766-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307141503.159766-1-herve.codina@bootlin.com>
References: <20230307141503.159766-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The assigned timeslot masks are 64bit values.
In case of 64 timeslots the code uses (1 << 64) which is undefined on a
64bit value. On the PowerPC architecture, this lead to an incorrect
result as (1 << 64) produces the same result as (1 << 0).

Fix the masks values taking care of the 64 timeslots case.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/soc/fsl/qe/qmc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index cfa7207353e0..b3c292c9a14e 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -754,6 +754,11 @@ static int qmc_check_chans(struct qmc *qmc)
 	if (ret)
 		return ret;
 
+	if ((info.nb_tx_ts > 64) || (info.nb_rx_ts > 64)) {
+		dev_err(qmc->dev, "Number of TSA Tx/Rx TS assigned not supported\n");
+		return -EINVAL;
+	}
+
 	/*
 	 * If more than 32 TS are assigned to this serial, one common table is
 	 * used for Tx and Rx and so masks must be equal for all channels.
@@ -766,9 +771,8 @@ static int qmc_check_chans(struct qmc *qmc)
 		is_one_table = true;
 	}
 
-
-	tx_ts_assigned_mask = (((u64)1) << info.nb_tx_ts) - 1;
-	rx_ts_assigned_mask = (((u64)1) << info.nb_rx_ts) - 1;
+	tx_ts_assigned_mask = info.nb_tx_ts == 64 ? U64_MAX : (((u64)1) << info.nb_tx_ts) - 1;
+	rx_ts_assigned_mask = info.nb_rx_ts == 64 ? U64_MAX : (((u64)1) << info.nb_rx_ts) - 1;
 
 	list_for_each_entry(chan, &qmc->chan_head, list) {
 		if (chan->tx_ts_mask > tx_ts_assigned_mask) {
-- 
2.39.2

