Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38079CE05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 12:18:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BpFZPjk8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlKLJ1NXjz3dSb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 20:18:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=BpFZPjk8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.193; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlKDV57kdz3cRF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 20:13:46 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPA id 7F809240012;
	Tue, 12 Sep 2023 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694513623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GfKXqceCJRcdJy8GVo/qvxOxSxxXVg9uDZ8RcdLStV4=;
	b=BpFZPjk88vC3dCTL9ZT8v/dJcorZosIrlcJ1y/TqzK3C5fS+ZWMYI2jbjDb4UTuweXdRli
	7eIVxQq/4B7MBQzN+K9IYJYPN4MSF+aLdu/BI6d65aYqLNs/9pvBTywCfkzaHuQ7b0x0hJ
	PzaBzPr2TGRCte+TxXmCZLsy0mGHqYRLHBvgOC2ugWgJpiCuZ0UHksFmoyWek7M8WyM2z2
	LmXMVdTLEQnQSvaqG9oIOsLlzEvitF5flikgeKgmVdBcT6x5uf9+fIpVKvVTp+XFk5wMf/
	IRpnrXxhA8ZLgbFJ+r/x3I6N3MDgac7UwQE+oGftUSTMlAu1u/+/tsCfb2C9GA==
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
	Lee Jones <lee@kernel.org>,
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
Subject: [PATCH v5 16/31] soc: fsl: cpm1: qmc: Check available timeslots in qmc_check_chans()
Date: Tue, 12 Sep 2023 12:13:40 +0200
Message-ID: <20230912101340.225575-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230912081527.208499-1-herve.codina@bootlin.com>
References: <20230912081527.208499-1-herve.codina@bootlin.com>
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

The timeslots checked in qmc_check_chans() are the timeslots used.
With the introduction of the available timeslots, the used timeslots
are a subset of the available timeslots. The timeslots checked during
the qmc_check_chans() call should be the available ones.

Simply update and check the available timeslots instead of the used
timeslots in qmc_check_chans().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 1189e6076e37..269d10cd3c7a 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -914,13 +914,13 @@ static int qmc_check_chans(struct qmc *qmc)
 	rx_ts_assigned_mask = info.nb_rx_ts == 64 ? U64_MAX : (((u64)1) << info.nb_rx_ts) - 1;
 
 	list_for_each_entry(chan, &qmc->chan_head, list) {
-		if (chan->tx_ts_mask > tx_ts_assigned_mask) {
-			dev_err(qmc->dev, "chan %u uses TSA unassigned Tx TS\n", chan->id);
+		if (chan->tx_ts_mask_avail > tx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u can use TSA unassigned Tx TS\n", chan->id);
 			return -EINVAL;
 		}
 
-		if (chan->rx_ts_mask > rx_ts_assigned_mask) {
-			dev_err(qmc->dev, "chan %u uses TSA unassigned Rx TS\n", chan->id);
+		if (chan->rx_ts_mask_avail > rx_ts_assigned_mask) {
+			dev_err(qmc->dev, "chan %u can use TSA unassigned Rx TS\n", chan->id);
 			return -EINVAL;
 		}
 	}
-- 
2.41.0

